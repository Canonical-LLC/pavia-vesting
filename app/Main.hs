{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import Cardano.Api hiding (TxId)
import Cardano.Api.Shelley
import Control.Monad
import qualified Data.Aeson as Aeson
import qualified Data.ByteString.Lazy as LBS
import Options.Applicative
import qualified Plutus.V1.Ledger.Api as Plutus
import qualified Plutus.V1.Ledger.Ada as Ada
import qualified Plutus.V1.Ledger.Time as Time

import qualified Canonical.Vesting as Vesting
import           Data.List.Split
import qualified PlutusTx.AssocMap as M
import           Text.Read
import           Data.String
import qualified PlutusTx.Prelude as PlutusTx
import           PlutusTx.These

main :: IO ()
main = join . execParser $ opts

parseValue :: String -> Maybe Plutus.Value
parseValue = parseValue' . words

parseValue' :: [String] -> Maybe Plutus.Value
parseValue' = go mempty where
  go (Plutus.Value acc) xs = case xs of
    [] -> Just $ Plutus.Value acc
    countStr:asset:rest -> do
      count <- readMaybe countStr
      (policyId, tokenName) <- case splitOn "." asset of
        [policyId, tokenName] -> Just (fromString policyId, fromString tokenName)
        _
          | asset == "lovelace" -> Just (Ada.adaSymbol, Ada.adaToken)
          | otherwise -> Nothing

      let newAcc = Plutus.Value $ these id id (\x y -> these id id (+) PlutusTx.<$> M.union x y) PlutusTx.<$> M.union (M.singleton policyId $ M.singleton tokenName count) acc

      go newAcc rest
    _ -> Nothing

opts :: ParserInfo (IO ())
opts = info (optsParser <**> helper) . mconcat $
  [ fullDesc
  , progDesc "Create a smart contract for vesting"
  ]

optsParser :: Parser (IO ())
optsParser = subparser . mconcat $
  [ command "write" (info writeCmd idm)
  , command "datum" (info datumCmd idm)
  ] where

  writeCmd = writeSC
    <$> (strOption . mconcat $
      [ long "output"
      , metavar "FILE"
      , help "Where to write the script."
      ])

  datumCmd = writeDatum
    <$> (optional . strOption . mconcat $
      [ long "output"
      , metavar "FILE"
      , help "Where to write the datum. Defaults to stdout."
      ])
    <*> (strOption . mconcat $
      [ long "beneficiary"
      , metavar "PUBKEYHASH"
      , help "Public key hash of the address of the benenficiary."
      ])
    <*> (some . option parsePortionOpt . mconcat $
      [ long "portion"
      , metavar "<deadline>:<amount>"
      , help "When an amount vests. Deadline is seconds since the Unix epoch (1970-01-01 00:00 UTC). Amount is in lovelaces. Can appear multiple times."
      ])

  parsePortionOpt :: ReadM Vesting.Portion
  parsePortionOpt = eitherReader $ \s ->
    case break (== ':') s of
      (ts, ':' : as) -> Vesting.Portion <$> parseDeadline <*> parseAmount where
        parseDeadline = case reads @Integer ts of
          [(r, "")] -> Right . Time.fromMilliSeconds . fromInteger $ r * 1000
          _ -> Left . mconcat $ [ "Cannot parse deadline `", ts, "`" ]
        parseAmount = case Main.parseValue as of
          Nothing -> Left "Failed to parse Value"
          Just v -> Right v

      (_, _) -> Left "Missing amount"

minAda :: Integer
minAda = 1000000

writeSC :: FilePath -> IO ()
writeSC output = do
  result <- writeFileTextEnvelope output Nothing $ Vesting.vesting
  case result of
      Left err -> print $ displayError err
      Right () -> putStrLn $ "wrote validator to file " ++ output

writeDatum :: Maybe FilePath -> Plutus.PubKeyHash -> Vesting.Schedule -> IO ()
writeDatum output beneficiary schedule = write . plutusDataToJSON $ datum where
  write = maybe LBS.putStr LBS.writeFile output
  datum = Vesting.Datum beneficiary schedule

plutusDataToJSON :: Plutus.ToData a => a -> LBS.ByteString
plutusDataToJSON
  = Aeson.encode
  . (scriptDataToJson ScriptDataJsonDetailedSchema)
  . fromPlutusData
  . Plutus.toData
