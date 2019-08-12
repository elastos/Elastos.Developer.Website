+++
title = "Testnet configuration"
date = 2019-05-24T21:15:33+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}

By default, testnet is the active network after installing Elastos. The whole Elastos ecosystem is ready to be used but you need to go through a few steps to get things ready, such as creating your initial wallets and getting test ELAs:

## Creating a new test wallet

Go to the <a href="https://wallet-beta.elastos.org/">testnet wallet website</a> and follow the steps to create your wallet. After a few pages, your test wallet will be ready and you will see something like this:

{{< figure src="/setup/env_setup/testnet_web_wallet_created.jpg" >}}

## Getting test ELA

Your newly created test wallet doesn't have any ELA. You have to request a few ELAs from our <a href="https://faucet.elastos.org/">faucet website</a> in order to start using the elastos ecosystem, as transactions have a cost.

The faucet website will ask for your wallet address. You can find it on the <a href="https://wallet-beta.elastos.org/">testnet wallet website</a>, in the **receive** tab.

{{< figure src="/setup/env_setup/faucet_website.jpg" >}}

After requesting test ELAs, please allow a few minutes (~10 minutes) for your  wallet to be credited. You can then check your balance on the <a href="https://wallet-beta.elastos.org/">testnet wallet website</a>.

## Next steps

Your environment is ready. You can now {{< internallink "start building your app" "elastos_core_services/setup/project_setup/_index.md" >}}.