
+++
title = "Elastos Essentials"
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++

Welcome! Nothing fancy here for now. After the transition from elastOS to Elastos Essentials, we are restarting to aggregate **various guides and howtos** in this section, in order for developers to let their applications (web, mobile) communicate with Elastos Essentials.

Mid-term, this documentation will be migrated to the Elastos Essentials website.

## Essentials features

Elastos Essentials provides the following features to **regular end users**:

* Create and manage a Elastos **Decentralised Identity (DID)**.
* Setup and manage a Elastos Hive **storage**.
* **A wallet** for the Elastos chains and for a few other EVM compatible chains (HECO, BSC - coming soon).
* A **contact manager** based on contacts DIDs.
* Vote for **Elastos DPoS supernodes**, **Cyber Republic Council** and **Cyber Republic proposals**.

## Interactive operations

Elastos Essentials provides Elastos connectivity connectors (external libraries) that can be added to third party projects (web apps, mobile apps) in order to easily execute operations that require interaction with the Elastos Essentials. For instance, getting credentials (name, email) from a user's decentralised DID requires user confirmation in Elastos Essentials before the information can be provided to the third party application.

The Elastos Essentials connector library currently provides the following capabilities:

### IDENTITY

| Feature | Summary |
| ------- | ------- |
| **Get DID credentials** | Retrieve user's DID string, name, country, or any other information). |
| **Import DID credentials** | (To let a third party app send a credential to user's profile, so that anyone can query this credential through the get credentials feature later). |
| **Sign data with DID** | Sign any data with user's DID. |

### ETHEREUM

| Feature | Summary |
| ------- | ------- |
| **Web3 requests** | Handle Web3 ethereum compatible transactions. For instance, a smart contract call. |

### Hive storage

| Feature | Summary |
| ------- | ------- |
| **Issuer an app ID credential** | Accessing Hive storages require the identity wallet to confirm that the application is trusted and can access user's storage. This happens through a specific DID credential type and this is done automatically during Hive clients authentication flow. |


## Sample code

### Typescript Web app

#### User flow

Calling methods below such as didAccess.getCredentials() does:

* First time, open a **Wallet Connect** QR code

#### Initial setup

```bash
npm install @elastosfoundation/elastos-connectivity-sdk-js
npm install @elastosfoundation/essentials-connector-client-browser
npm install @elastosfoundation/did-js-sdk
```

```typescript
import {
    connectivity,
    DID as ConnDID
} from "@elastosfoundation/elastos-connectivity-sdk-js";

import {
    EssentialsConnector
} from "@elastosfoundation/essentials-connector-client-browser";

constructor() {
  let essentialsConnector = new EssentialsConnector();
  connectivity.registerConnector(this.essentialsConnector);
}
```

#### Get credentials

```typescript
let didAccess = new ConnDID.DIDAccess();
let presentation = await didAccess.getCredentials({claims: {
    name: true,
    avatar: {
      required: false,
      reason: "To check if you are handsome or not"
    }
}});

if (presentation) {
  let nameCredential = presentation.getCredentials().find((c) => {
    return c.getId().getFragment() === "name";
  });
  if (nameCredential) {
      console.log("Thank you for signing in, "+nameCredential.getSubject().getProperty("name"));
  }
}
```

```typescript
  public async testImportCredentials() {
    this.infoMessage = "";

    console.log("Creating and importing a credential");
    let storeId = "client-side-store";
    let storePass = "unsafepass";
    let passphrase = ""; // Mnemonic passphrase

    // For this test, always re-create a new identity for the signer of the created credential.
    // In real life, the signer should remain the same.
    DIDBackend.initialize(new ConnDID.ElastosIODIDAdapter(ConnDID.ElastosIODIDAdapterMode.DEVNET));
    let didStore = await DIDStore.open(storeId);
    let rootIdentity = RootIdentity.createFromMnemonic(Mnemonic.getInstance().generate(), passphrase, didStore, storePass, true);
    console.log("Created identity:", rootIdentity);

    let issuerDID = await rootIdentity.newDid(storePass, 0, true); // Index 0, overwrite
    console.log("Issuer DID:", issuerDID);

    let issuer = new Issuer(issuerDID);
    console.log("Issuer:", issuer);

    let targetDID = DID.from("did:elastos:insTmxdDDuS9wHHfeYD1h5C2onEHh3D8Vq");
    console.log("Target DID:", targetDID);

    // Create the credential
    let vcb = new VerifiableCredential.Builder(issuer, targetDID);
    let credential = await vcb.id("#creda").properties({
      wallet1: "xxxx",
      wallet2: "xxxx"
    }).type("TestCredentialType").seal(storePass);
    console.log("Generated credential:", credential);

    // Send the credential to the identity wallet (essentials)
    let didAccess = new ConnDID.DIDAccess();
    let importedCredentials = await didAccess.importCredentials([credential]);

    // Result of this import, depending on user
    console.log("Imported credentials:", importedCredentials);
  }
```