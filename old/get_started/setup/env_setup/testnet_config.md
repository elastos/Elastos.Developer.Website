+++
title = "Get ready on testnet"
date = 2019-05-24T21:15:33+02:00
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++ 

After installing develap, the whole Elastos ecosystem is ready to be used but you need to go through a few additional steps to get things ready, such as creating your initial wallets and getting test ELAs:

In order to easily create wallets and manage them, you can download ela-cli program from [https://download.elastos.org/elastos-ela](https://download.elastos.org/elastos-ela/).

To learn more about what commands are available for ela-cli, please visit [ELA CLI Guide]({{< relref "../../../elastos_blockchain/guides/ela_cli.md" >}})

## Unzip ela-cli program
This guide uses [https://download.elastos.org/elastos-ela/elastos-ela-v0.3.7/elastos-ela-v0.3.7-linux-x86_64.tgz](https://download.elastos.org/elastos-ela/elastos-ela-v0.3.7/elastos-ela-v0.3.7-linux-x86_64.tgz) as reference.
``` 
wget https://download.elastos.org/elastos-ela/elastos-ela-v0.3.7/elastos-ela-v0.3.7-linux-x86_64.tgz;
tar -xzvf elastos-ela-v0.3.7-linux-x86_64.tgz;
mv elastos-ela-v0.3.7/ela-cli .;
rm -rf elastos-ela-v0.3.7 elastos-ela-v0.3.7-linux-x86_64.tgz;
```

## Create a new test wallet
Note: When you create a wallet on Elastos, the same wallet can be used for both mainnet and testnet.

```
./ela-cli wallet create
```

Should return something like:
```
Password:
Re-enter Password:
ADDRESS                            PUBLIC KEY                                                        
---------------------------------- ------------------------------------------------------------------
EMPPw2R7CsV3c5NXmK51JL34tEzDYsaHnw 0228a280dc99f035fa57d190830f42a6d941c92ed39db5a8a96d29db98ee15d6a9
---------------------------------- ------------------------------------------------------------------
```
You'll be asked to provide a password. This password is what protects the keystore.dat file that is created using the above command. 

You can check the private key of your wallet by doing:
```
./ela-cli wallet export 
```

## Get test ELA

Your newly created test wallet doesn't have any ELA. You have to request a few ELAs from our <a href="https://faucet.elastos.org/">faucet website</a> in order to start using the elastos ecosystem, as transactions have a cost.

The faucet website will ask for your wallet address.

{{< figure src="/get_started/setup/env_setup/faucet_website.jpg" >}}

After requesting test ELAs, please allow a few minutes (~10 minutes) for your  wallet to be credited. You can then check your balance on the <a href="http://blockchain-beta.elastos.org/">testnet block explorer website</a>.

You can also check how much balance you have by doing:
```
./ela-cli wallet b --rpcport 21336
```

## Next steps

Your environment is ready. You can now {{< internallink "start building your app" "get_started/setup/project_setup/_index.md" >}}.