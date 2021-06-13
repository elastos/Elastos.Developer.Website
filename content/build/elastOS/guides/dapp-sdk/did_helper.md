+++
title = "DID helper"
weight = 20
chapter = false
pre = ""
alwaysopen = true
+++

## Purpose

This helper provides **higher level APIs than the DID plugin**, for the most frequent DID operations.

## DID Helper creation

```javascript
let didHelper = new TrinitySDK.DID.DIDHelper();
```

## Generate a random DID store ID

dApps that use DIDs usually have to **generate a DID store ID**. This can be done like this:

```javascript
let storeId = didHelper.generateRandomDIDStoreId();
```

## Quickly create a new DID in a new DID store

Convenient way to create a **new DID store**, with a **auto-generated mnemonic**, with a **new DID** inside:

```javascript
let creationResult = await didHelper.fastCreateDID(DIDPlugin.MnemonicLanguage.ENGLISH);
```

## Open a DID store

Convenient way to **open an existing DID store** using its store ID.

```javascript
let store = await didHelper.openDidStore("the-store-id");
```

## Load a DID from a DID store

Convenient way to open a DID store then **load a DID using a DID string**.

```javascript
let did = await didHelper.loadDID("the-store-id", "did:elastos:the-did");
```

## Load all credentials inside a DID

Convenient way to quickly **load all credentials** inside a DID.

```javascript
let credentials = await didHelper.loadDIDCredentials(did);
```

## Get an application instance DID / Info

**Application instance DIDs are DIDs created only inside a dApp**. Usually, those DIDs are local only, not published on chain. They are used to let the dApp sign some communications/exchanges with others, using a temporary DID.

For example, authenticating on Hive requires signing some operations with DIDs. In order to not launch the identity capsule every time to let the user sign operations with his real DID, an app instance DID is used.

This helper function creates (and stores in local storage) the app instance DID if it doesn't exist yet, or starts the process to generate it if needed.

**Most of the time, developers do not have to manually handle this**.

```javascript
let instanceInfo = await didHelper.getOrCreateAppInstanceDID();
// instanceInfo.did contains the DID itself. instanceInfo.didStore contains the DIDStore instance.

// Later:
let instanceInfo = await didHelper.getExistingAppInstanceDIDInfo();
// instanceInfo.storeID, instanceInfo.didString, instanceInfo.storePassword
```

## Get an application identity credential

An application identity credential is a credential issued by the identity capsule, and signed by the user's DID. It contains the app DID string of the calling capsule, confirmed by the elastOS runtime.

**This credential can then be used by capsules to proove who they are**. This is used in the hive authentication flow to let the hive back-ends know who is calling and give it access to only a specific storage context.

While **capsules running inside elastOS can automatically get this credential** without user confirmation, **native dApps requesting such credential require user to manually confirm this operation**, and additional security checks are executed.

```javascript
let appIDCredential = await didHelper.getOrCreateAppIdentityCredential(did);
```
