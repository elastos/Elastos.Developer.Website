
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

