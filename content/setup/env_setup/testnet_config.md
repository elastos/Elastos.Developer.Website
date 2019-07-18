+++
title = "Testnet configuration"
date = 2019-05-24T21:15:33+02:00
weight = 10
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}

By default, testnet is the active network after installing Elastos. The whole Elastos ecosystem is ready to be used but you need to go through a few steps to get things ready, such as creating your initial wallets and getting test ELAs:

## Creating a new test wallet
There are two ways of creating a wallet on testnet. 

1. You can go to <a href="https://wallet-beta.elastos.org/">TestNet Wallet Website</a>
2. Connect your local main chain node to testnet using configuration available at <a href="https://github.com/elastos/Elastos.ELA/blob/master/docs/testnet_config.json.sample">Testnet Config Sample</a> and then using a command line interface, do the following:
{{% highlight "shell" %}}
$ ela-cli wallet create (?)
{{% /highlight %}}

## Getting more test ELA
Currently, the only way to request test ELA is by filling out the form at <a href="https://faucet.elastos.org/">Faucet Website</a>

## Interact with your wallet
{{< todo "List all the different commands you can invoke to interact with the wallet from a terminal">}}

{{< todo "List all useful commands for app developers to be able to work on the testnet efficiently" >}}