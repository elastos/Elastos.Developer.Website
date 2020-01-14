+++
title = "DApp distribution"
weight = 100
chapter = false
pre = ""
alwaysopen = false
+++

{{% notice note %}}
This publication process uses the temporary centralized DApp store server. This process will change when the DAPP sidechain is ready, so that we have a decentralized DApps management.
{{% /notice %}}

## Introduction

A **Trinity DApp store server** is available to host your DApps and make them downloadable through the store DApp by all Trinity users. 

## Validation

The first time a DApp is published, or randomly after that, there is a manual review process from the Elastos team members, so your DApp won't appear in the store DApp right after publishing it. Application updates are faster.

Note that this centralized process will change in the future and will be replaced with a decentralized community-based model.

## Creating an application DID

Publishin your DApp requires to sign it using an Elastos DID. The Trinity CLI lets you create a DID this way:

```bash
$ trinity-cli did create
```

Save your **DID string** and **mnemonics** in a safe place. You will need to use them to publish your DApp, now but also every time you want to publish an updated version.

Your signature needs to be uploaded on the DID sidechain. You have to user the Trinity mobile application itself to scan the QR code provided during the DID creation, and **pay a very low transaction fee to publish your DID on chain**.

At first, your wallet app may have all ELA stored on the ELA mainchain, but nothing on the DID sidechain. You need to use the wallet DApp to **transfer some amount to the DID sidechain** (only the first time). A very small amount such as 0.1 ELA or less is enough to write several DID transactions.

You finally have to **wait a few minutes for the transaction to be validated by the blockchain** (first time only). After that, you will be able to upload your application. Awaiting your DID to be available on chain is required as the DApp store server looks for it while validating your published DApp.

Make sure to not store the created DID storage folder (in your current folder) to your GIT repository.

**In case you cannot totally finalize the DID publication** on chain, you can still retry to publish your created DID later using the following command: 

```bash
$ trinity-cli did publish
```

## Publishing your app

* Make sure your application is **stable** and provides a **good quality** for end users.
* Enter your DApp folder using a terminal.
* **Edit your manifest.json** to make sure all information is correct, including author name, app description, app icon, and so on. Information in this manifest is what is going to be used for the publication. 
* Run the following command:

```bash
$ trinity-cli publish --did did:elastos:yourdid --news "What's new information"
```

* If this is your first publication, you'll have to wait for the Elastos team to review your publication before being able to view your DApp in the DApp store.

## Upgrading your app

* In the manifest, **increase the version name and code** if this is an app upgrade, otherwise the upload will fail.
* Go through the same steps as for the initial publication process.