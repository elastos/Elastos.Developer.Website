+++
title = "Connectors"
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

In a decentralized environment, as end users are responsible for holding their identity and funds, this also means that most applications are not centrally hosted on a single server - the developer's one - but that they **need to rely on a wallet** chosen by users.

The most common example of this is when Ethereum applications run on web apps, they **all need to call Metamask** to do some wallet operations.

In the Elastos world it's not different, except that in addition to the token wallet operations, **Elastos also uses the "wallet app" to manage users' decentralized identity and decentralized storage**.

## Elastos Connectivity SDK

The connectivity SDK provides an easy to use interface for all operations that require user interaction in a wallet app. For example, retrieve DID credentials, publish a smart contract call, or authenticate on the Hive storage.

This SDK provides flexibility and different **connectors** that implement a common interface can be dynamically added. **The default one is the Elastos Essentials connector**, that implements communicaiton between web apps and mobile apps, to and from the Elastos Essentials wallet.

{{< hero >}}
    {{< heroitem link="elastos_essentials" rightArrow="true" >}}
        <h5>Elastos Essentials connector</h5>
    {{< /heroitem >}}
{{< /hero >}}

{{< hero >}}
    {{< heroitem link="localidentity" rightArrow="true" >}}
        <h5>Local identity connector</h5>
    {{< /heroitem >}}
{{< /hero >}}

## The connectivity interface

The connectivity SDK provides interfaces for the following operations. Those interfaces are implemented by **connectors** such as the **Elastos Essentials connector**.

### Identity

| Feature | Summary |
| ------- | ------- |
| **Get DID credentials** | Retrieve user's DID string, name, country, or any other information). |
| **Import DID credentials** | (To let a third party app send a credential to user's profile, so that anyone can query this credential through the get credentials feature later). |
| **Sign data with DID** | Sign any data with user's DID. |

### Ethereum

| Feature | Summary |
| ------- | ------- |
| **Web3 requests** | Handle Web3 ethereum compatible transactions. For instance, a smart contract call. |

### Hive storage

| Feature | Summary |
| ------- | ------- |
| **Issue an app ID credential** | Accessing Hive storages require the identity wallet to confirm that the application is trusted and can access user's storage. This happens through a specific DID credential type and this is done automatically during Hive clients authentication flow. |
