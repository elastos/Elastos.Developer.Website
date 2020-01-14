+++
title = "Supported intents"
weight = 25
chapter = false
pre = ""
alwaysopen = false
+++

## What are intents?

They are a way to **let DApps communicate with each other** without really knowing each other. For example, a DApp can send a "pay" intent request, that follows the elastos scheme standardized definition, and another DApp can catch this intent to handle the payment. 

But the initiating DApp doesn't really know which DApp will realize this operation. As a consequence, several applications being able to handle the pay intent (wallet DApps in our case) could exist in Trinity, and the user could choose which of them he wants to use to proceed to the payment.

## How to send intents?

See {{< internallink "Interapp communication" "/elastos_trinity/guides/interapp_communication.md" >}}.

## What can you do with those intents?

You can either:

* **Send intents** to request other DApps to do something (ex: pay, if you want to let your users purchase something)
* Or **handle intents** (using intent filters in your manifest) to handle actions requested by other DApps (ex: handle "handlescannedcontent_did" if you want to do something when a end user scans a QR code in Trinity).

## Supported intents in Trinity

### Standard Elastos scheme intents

See {{< internallink "Elastos scheme" "/elastos_core_services/guides/elastos_scheme.md" >}} for more details about the following standard intents.

| Intent action | Description |
| ------------- | ----------- |
| pay | Send a payment to a user or to purchase an item. | 
| didtransaction | Record a DID request on the DID sidechain (ex: publish/update a DID). |
| esctransaction | Execute a smart contract transaction on the ETH sidechain. |
| dposvotetransaction | Record a vote for a list of supernodes on the ELA mainchain. |
| credaccess | Get user information (name, email, ...) from his DID profile. |
| walletaccess | Get information about user's wallet (Ex: ELA address). |
| appinstall | Request system to install a DApp using an EPK file. |
| appdetails | Display a specific DApp details page on a DApp store. |
| sign | Sign some binary content using a DID signature. |

### Specific Trinity intents

#### Open an application

##### Description

Opens a given DApp.

##### Request parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| id | The application package id (ex: org.company.app) | string |

##### Response parameters

None

##### Request example

**Raw Http GET request**

    http://scheme.elastos.org/a?id=org.company.app | 


**Http GET with JWT**

    http://scheme.elastos.org/JWT_CONTAINING_REQUEST_FIELDS_AND_MORE

**Trinity**

    appManager.sendIntent("a", {
        id: "org.company.app"
    }, ...)




#### Register application profile

##### Description

Register user as using a given DApp, on his DID profile. After publishing this information to the DID sidechain, other users / friends can view that this user has a profile in the given app, and easily reach him there.

For example, if a developer creates CoolDApp and CoolDApp let users add friends and friends can write and read posts (similar to Facebook), Then CoolDApp can ask its users to register their application profile. That profile will include a CoolDApp-specific id in a VerifiableCredential. This way, when friends view this user's profile from the DID sidechain, they can reach others through a **connectapplicationprofile** intent that will receive all the regiter custom information and therefore be able to immediatelly connect inside CoolDApp.

##### Request parameters

| Parameter | Description | Required | Format |
| ----- | ----- | ----- | ---- |
| identifier | Unique identifier for this profile inside the given app | Yes | string |
| connectactiontitle | Description string to explain users viewing this profile (after registration on ID chain) what action they can expect if opening the target app | Yes | string or array of {lang:"", value:""} |
| customcredentialtypes | Custom credential types to register with the app profile (as the application profile is a Verifiable Credential) | No | Array of strings |
| sharedclaims | Claims to register to user's DID document as basic profile credential, independencly from the generated ApplicationProfileCredential | No | Array of key->value | 
| [Any field] | Any custom field passed to the intent will be saved in the ApplicationprofileCredential | No | key->value |

##### Response parameters

None

##### Request example

**Trinity**

    appManager.sendIntent("registerapplicationprofile", {
        identifier: "did-demo-app-profile",
        connectactiontitle: "Reach out in DID Demo dApp",
        sharedclaims: [
            {
                diddemoid: "abcdef"
            }
        ],
        diddemoid:"abcdef"
    }, ...)




#### Connect to an application profile

##### Description

Opens a target app using a **ApplicationProfileCredential** information registered using a **registerapplicationprofile** intent. The target app (usually the one that also called **registerapplicationprofile**) must register the **connectapplicationprofile** application in its manifest.

When opening, the app receives the original fields registered by **registerapplicationprofile** (ex: "diddemoid").

Usually, as a dApp developer you don't need to emit this intent. Instead, you will most likely listen to this intent emitted by the trinity runtime.

##### Request parameters

All fields included in the ApplicationProfileCredential.

##### Response parameters

None

##### Request example

**Trinity**

    appManager.sendIntent("connectapplicationprofile", {
        identifier: "did-demo-app-profile",
        diddemoid: "abcedf",
        ...
    }, ...)

##### Response example

Received by the **appManager.setIntentListener()** callback.

    {
        identifier: "did-demo-app-profile",
        diddemoid: "abcedf"
    }




#### Handle scanned content

##### Description

Intent emitted by the scanner dApp after scanning a QR code.

This intent is sent only if the scanner dApp was started manually by the user. Otherwise if the scanner app is started by **scanqrcode** intent, the scanned data will be received in the sendIntent() callback.

##### Request parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| data | The scanned content | string |

##### Response parameters

None

##### Request example

**Trinity**

    appManager.sendIntent("handlescannedcontent", {data: "ABCDEF"}, ...)

##### Response example

Received by the **appManager.setIntentListener()** callback.

    {
        data: "ABCDEF"
    }




#### Handle scanned content (DID format)

##### Description

Similar to **handlescannedcontent**, but the passed data is a DID string (ex: did:elastos:abcdef).




#### Scan QR code

##### Description

Requests the scanner dApp to scan a QR code and return the scanned data.

##### Request parameters

None

##### Response parameters

    {
        data: "ABCDEF"
    }

##### Request example

**Raw Http GET request**

    http://scheme.elastos.org/a?id=org.company.app

**Http GET with JWT**

    http://scheme.elastos.org/JWT_CONTAINING_REQUEST_FIELDS_AND_MORE

**Trinity**

    appManager.sendIntent("scanqrcode", {}, ...)

##### Response example

Received by the **appManager.sendIntent()** onSuccess callback.

    {
        data: "ABCDEF"
    }
