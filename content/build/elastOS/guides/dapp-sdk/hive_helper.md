+++
title = "Hive helper"
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++

## Purpose

Using Hive 2.0 API is rather straightforward, but the **authentication flow** can be more cumbersome. For example, authentication a user to his vault requires a specific credential from the Identity app, packaged inside a DID presentation, signed by user's DID. Details of such operation don't have to be known by regular dApp developers. The Trinity dApp SDK therefore encapsulates the **hive connection flow in a one liner api**.

## Hive client creation

```javascript
// Get a hive authentication helper
let hiveAuthHelper = new TrinitySDK.Hive.AuthHelper();

// Create a hive instance
let hiveClient = await hiveAuthHelper.getClientWithAuth((error)=>{});

// Get a user's vault and start calling hive APIs
vault = await hiveClient.getVault(vaultOwnerDid);
await vault.getDatabase.findOne(...);
```

## Suggest creating a vault

In case the active user has no vault configured when first using the Elastos ecosystem, a helper function makes it easy to open the hive manager capsule to let him/her configure a new vault space:

```
TrinitySDK.Hive.HiveHelper.suggestUserToSetupVault();
```
