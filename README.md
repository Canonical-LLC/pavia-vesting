# Vesting Smart Contract

This smart contract validates tokens are unlocked only when the vesting deadline has passed.

## Setting up the Environment

First source either the testnet or mainnet environment variables.

For testnet

```
$ source scripts/envars/testnet-env.envvars
```

For mainnet

```
$ source scripts/envars/mainnet-env.envvars
```

The environment variable files set `CARDANO_NODE_SOCKET_PATH` to the path of the appropriate Daedalus socket file (either Testnet Daedalus or the regular mainnet Daedalus). It you run a `cardano-node` on your own you should set this environment variable to your socket file location after sourcing the environment variable file.

## Building

The compile the code to a Plutus smart contract, run:

```bash
./scripts/compile.sh
```

This will write a file to `scripts/vesting.plutus` and either `testnet/vesting.addr` or `mainnet/vesting.addr` depending on the result of the previous step.

A `shell.nix` is also providing for nix users.

## Example Transactions

Example transactions can be found in `scripts/core`. The scripts are used by other scripts in `scripts/happy-path` which demonstrates how to create a vesting schedule and unlock vested value after the deadline has passed.

## Example Datums

The datum for a vesting schedule consists of the address of the beneficiary and the vesting schedule - a list of amounts and when they are vested and available to unlock by the beneficiary.

To create a datum file, the `vesting-sc` tool can be used

```
$ cabal run -- vesting-sc datum \
  --beneficiary 67614c1b06ddbb100cb6cbe919594cac31771c25530b6c7f28da242b \
  --portion $(date -d '+12 month' '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941 \
  --portion $(date -d '+13 month' '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941

```

for MacOS run:

```
$ cabal run -- vesting-sc datum \
  --beneficiary 67614c1b06ddbb100cb6cbe919594cac31771c25530b6c7f28da242b \
  --portion $(date -v+12m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941 \
  --portion $(date -v+13m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941
```

This creates a datum with a vesting schedule for 2 Ada: the 1 Ada vests after one month and the second Ada vests after two months.

## Pavia Specific Datum Generation Scripts

In `scripts/pavia-lock-datums` there are two scripts `lock-datum-1.sh` and `lock-datum-2.sh` that take in beneficiary as and argument and produce a 1 year cliff 36 month disbursement schedule for 600,000,000 and 230,000,000 $PAVIA tokens respectively.

There are also example datums, `paviaDatum1.json` and `paviaDatum2.json` that show the output with an example beneficiary.

To run the scripts call

```bash
$ ./scripts/pavia-lock-datums/lock-datum-1.sh 67614c1b06ddbb100cb6cbe919594cac31771c25530b6c7f28da242b
```

Where the first argument is the public key hash of the beneficiary.

## Full System Testing Prerequistes

Before testing you need to make sure you have `cardano-cli` installed and on your path, and it must be version 1.31.0 or greater. You will also need the json utility `jq` as well as `cardano-cli` helper `cardano-cli-balance-fixer` which can be downloaded here: https://github.com/Canonical-LLC/cardano-cli-balance-fixer

## Init (only done once)

First create the wallets and get the protocol parameters.

```
$ ./scripts/wallets/make-all-wallets.sh
$ ./scripts/query-protocol-parameters.sh
```

# Manual Testing

We will walk through the process of manually testing creating a vesting schedule and unlocking vested amounts.

After following the setup steps above, first make sure that the `~/$BLOCKCHAIN_PREFIX/benefactor.addr` and `~/$BLOCKCHAIN_PREFIX/beneficiary.addr` have Ada.

Now create a vesting schedule by calling:

```bash
$ scripts/happy-path/lock-tx.sh 0 300 600
```

This will create a vesting schedule where 1 Ada vests after 300 seconds (5 minutes) and another Ada vests after 600 seconds (10 minutes). The `0` is namespace so we can have more than one auction going at a time.

Wait for the next slot:

```bash
$ scripts/wait/until-next-block.sh
```

You can now view the token at the smart contract address:

```bash
$ scripts/query/sc
```

When the time is right, call close:

```bash
$ scripts/happy-path/unlock-tx.sh
```

Wait for the next slot, and then check that the value was added to `beneficiary`'s wallet:

```bash
$ scripts/query/beneficiary
```

Note that if you wait until everything is vested, the beneficiary will have received all the value.
