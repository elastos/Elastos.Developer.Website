+++
title = "Environment setup"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}

{{< todo "@BPI check with bo cheng if the CLI is needed only for blockchain developers, or also for app developers" >}}

## Install the Elastos CLI command line tool

The {{< internallink "Elastos CLI" "elastos_blockchain/guides/elastos_cli.md" >}} is a supertool that will help you do several key operations on the Elastos environment. 

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

{{< todo "@BoCheng When package managers are ready - Add tabs for every OS elastos-cli is available for" >}}

Make sure everything was ok - type the following command in a shell:

{{< highlight "shell" >}}
$ elastos-cli info
{{< /highlight >}}

## Testnet setup

**What is testnet?** This is a clone of mainnet (the "prod" environment), where you can test your apps before releasing them, use test ELAs instead of real ELAs during development phase, test smart contracts more easily, with faster block times, etc.

By default, the active network is testnet. You can go on with the {{< internallink "testnet configuration page" "testnet_config.md" >}} to start creating your first wallet and get a few test ELAs. 

Right after that, you can start {{< internallink "getting your application ready" "elastos_core_services/setup/project_setup/_index.md" >}} and start using Elastos APIs!
