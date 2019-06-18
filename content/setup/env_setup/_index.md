+++
title = "Environment setup"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = "<i class='fa ela-folder'></i> "
alwaysopen = false
+++ 

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
{{< /tabs >}}

{{< todo "Add tabs for every OS elastos-cli is available for" >}}

Make sure everything was ok - type the following command in a shell:

{{< highlight "shell" >}}
$ elastos-cli info
{{< /highlight >}}

## Testnet setup

Before deploying your applications on the mainnet, you will develop and test them on the **Elastos testnet**. Testnet is similar to the mainnet but makes it easy for example to get free ELA, debug smart contracts, and get faster blocks time, which makes it more convenience for development.

By default, the active network is testnet.

{{< todo "Explain is some things have to be configured or not here" >}}

## Switching between testnet and mainnet

{{< todo "switch + deployment flows" >}}

{{< todo "Type something like 'elastos-cli testnet enable' ? ">}}
