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

## Publishing your app

Publishing your app is rather easy. Here is how:

* Make sure your application is **stable** and provides a **good quality** for end users.
* Enter your DApp folder using a terminal.
* **Edit your manifest.json** to make sure all information is correct, including author name, app description, app icon, and so on. Information in this manifest is what is going to be used for the publication. 
* Run the following command:

```bash
$ trinity-cli publish
```

* If this is your first publication, you'll have to wait for the Elastos team to review your publication before being able to view your DApp in the DApp store.

## Upgrading your app

* In the manifest, **increase the version name and code** if this is an app upgrade, otherwise the upload will fail.
* Go through the same steps as for the initial publication process.