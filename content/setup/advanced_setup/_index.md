+++
title = "Advanced setup"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}

## Private net

In case using testnet during development is not an option for you, for several possible reasons (development privacy, restricted amount of ELAs provided by the testnet, advanced customization...), you can choose to use your own private net.

Please refer to <a href="https://github.com/cyber-republic/elastos-privnet">Private Net Github Repo</a> for documentation on how to setup your private net locally

## Developer Workflow from private net to testnet to mainnet
{{< todo "Explain how to switch the app to use privnet/testnet/mainnet" >}}

## Create a test wallet using your own local node

{{< todo "Improve. This is for people running their own nodes locally (privnet?) to generate a wallet using the CLI instead of the web interface. May be more convenient in some cases" >}}

Connect your local main chain node to testnet using configuration available at <a href="https://github.com/elastos/Elastos.ELA/blob/master/docs/testnet_config.json.sample">Testnet Config Sample</a> and then using a command line interface, do the following:
{{% highlight "shell" %}}
$ ela-cli wallet create (?)
{{% /highlight %}}

