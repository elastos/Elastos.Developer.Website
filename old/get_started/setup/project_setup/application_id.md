+++
title = "Getting an application ID"
date = 2019-05-24T21:15:33+02:00
weight = 5
chapter = false
pre = ""
alwaysopen = false
+++ 

## Introduction

Some of the Elastos services or API will require your app to be registered. This is the case for example for elastOS or to call Elastos scheme commands.

## Generating an app ID

For now, please use the [elastos academy wizard](https://elastos.academy/did-wizard/) to generate your application ID and related data.

## Generated data

Here is more information about the things that are generated on that wizard:

| Generated entry | Description |
| -------- | -------- |
| Application ID | Your main application ID. To be used in your apps. .|
| Private key | Your app ID's private key. Used when you want to sign content on behalf of your application. (More detailed in relevant sections in this documentation) |
| Public key | Counterpart of the private key. |
| DID | This is your application's DID. Your application has an identity on the ID sidechain, like users. |
| ELA address | ELA Address on the DID sidechain. Used to transfer ELA from your main wallet to the DID sidechain, as some fees are required when writing data on the ID sidechain. Don't worry about this part for now. |
| Mnemonic | Mnemonic to save in order to recover your ELA address if lost (or when you want to import it somewhere) |