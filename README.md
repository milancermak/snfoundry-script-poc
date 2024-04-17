## Setup

* create an account with a keystore signer, move the two files to `scripts/deploy/` according to the names in `snfoundry.toml`
* `cd scripts/deploy/`

## Issue #1

* run `scarb run dep`

You should see an error

```text
command: script run
error: No such file or directory (os error 2)
```

Same issue when running `sncast --profile sepolia script run deploy`.

It works with `sncast --url https://starknet-sepolia.public.blastapi.io/rpc/v0_7 --account sepolia_admin.json --keystore sepolia_admin_keystore.json script run deploy` Why?

And running `sncast --profile sepolia script run deploy` again now, after running the command above, works without the previous issue.

## Issue #2

The above `sncast script run deploy` will probably work, but I've encountered this issue#2 even if it fails.

* modify `deploy/src/deploy.cairo` - e.g. add another `println!()` or uncomment the one on line 6
* run the deploy script again
* the newly added print is not in the script output !

From my experience, any new changes to the script are not reflected when running it again 😩
