
+++
title = "Elastos Essentials connector"
weight = 20
chapter = false
pre = ""
alwaysopen = true
+++

Elastos Essentials is a kind of wallet application available on Android and iOS. Similar to other wallets such as Metamask or Token Pocket, it allows users to manage their crypto tokens.

In addition, Elastos Essentials also provides full management of Decentralized Identities (DID), Hive storage space, and more.

Elastos Essentials provides **Elastos Essentials connector libraries** that implement the [Elastos Connectivity SDK](..) for operations such as getting credentials, publishing ethereum transactions, etc.

## Elastos Essentials: Main features

Elastos Essentials provides the following features to **regular end users**:

* Create and manage a Elastos **Decentralised Identity (DID)**.
* Setup and manage a Elastos Hive **storage**.
* **A wallet** for the Elastos chains and for a few other EVM compatible chains (HECO, BSC - coming soon).
* A **contact manager** based on contacts DIDs.
* Vote for **Elastos DPoS supernodes**, **Cyber Republic Council** and **Cyber Republic proposals**.

## Basic flow

Calling methods below such as didAccess.getCredentials() on the Connectivity SDK does:

* **First time** only:
  * Open a **Wallet Connect** QR code, on a web app. From a mobile app, the same code simply shows a "connect" button.
  * Users open Elastos Essentials and scans the QR code.
  * Essentials prompts users to confirm whether they want to get linked to the website or app.
  * Users confirm and a websocket connection is established between the external app and Essentials. Note: this connection is automatically re-established later on when Essentials restarts.

* **When a wallet connect link is already established** between the application and Essentials:
  * The connectivity SDK sends commands through wallet connect, to Essentials.
  * Essentials shows appropriate confirmation screens to users.
  * Users confirm and the calling app gets the response (i.e.: user's DID profile information).

## Advanced EIP commands support

The following commands are supported by Elastos Essentials through the Essentials connector:

### wallet_watchAsset

Lets applications ask users to add a custom ERC token to their list of available tokens.

```typescript
const wasAdded = await ethereum.request({
  method: 'wallet_watchAsset',
  params: {
    type: 'ERC20', // Initially only supports ERC20, but eventually more!
    options: {
      address: "0x2fceb9e10c165ef72d5771a722e8ab5e6bc85015", // The address that the token is at.
      symbol: "BNA", // A ticker symbol or shorthand, up to 5 chars.
      decimals: 18, // The number of decimals in the token
      image: "http://placekitten.com/200/300", // A string url of the token logo
    },
  },
});
```