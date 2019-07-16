+++
title = "Environment setup"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = "<i class='fa ela-folder'></i> "
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}

## Install the Elastos CLI command line tool

The {{< internallink "Elastos CLI" "/guides/elastos_cli.md" >}} is a supertool that will help you doing several key operations on the Elastos environment. 

You can simply install it with the following command:

{{< tabs >}} 
    {{% tab name="Mac OS" %}} 
    brew install elastos-cli
    {{% /tab %}} 
    {{% tab name="Ubuntu" %}} 
    yum install elastos-cli
    {{% /tab %}} 
    {{% tab name="Others" %}} 
Even if it hasn't been packaged for your usual package manager, you can try to build the elastos-cli from source by reading its github repository [here](https://github.com/elastos/Elastos.ELA.Client).
    {{% /tab %}} 
{{< /tabs >}}

{{< todo "Add tabs for every OS elastos-cli is available for" >}}

Make sure everything was ok - type the following command in a shell:

{{< highlight "shell" >}}
$ elastos-cli info
{{< /highlight >}}

## Testnet setup

{{< todo "Make sure if we use a testnet by default, or a privnet. Check if 10 ELA is enough and what to do if not enough. Make sure all the ecosystems modules run on the testnet as well as on the mainnet (testnet and mainnet have to behave exactly the same way for all apis)." >}}

Before deploying your applications on the mainnet, you will develop and test them on the **Elastos testnet**. Testnet is similar to the mainnet but makes it easy for example to get free ELA, debug smart contracts, and get faster blocks time, which makes it more convenience for development.

By default, the active network is testnet. You can go on with the {{< internallink "testnet configuration page" "/setup/env_setup/testnet_config.md" >}} to start creating your first wallet and get a few test ELAs. 

Right after that, you can start {{< internallink "getting your application ready" "/setup/project_setup/_index.md" >}} and start using Elastos APIs!