+++
title = "Supported Intents"
weight = 25
chapter = false
pre = ""
alwaysopen = false
+++

## How to send intents?

{{< hero >}}
    {{< heroitem link="/build/elastos/guides/interapp_communication" rightArrow="true" >}}
        <h5>Interapp Communication</h5>
    {{< /heroitem >}}
{{< /hero >}}

## Supported intents in elastOS

### Standard Elastos scheme intents

See  for more details about the following standard intents.

| Intent action | Description |
| ------------- | ----------- |
| pay | Send a payment to a user or to purchase an item. | 
| didtransaction | Record a DID request on the DID sidechain (ex: publish/update a DID). |
| esctransaction | Execute a smart contract transaction on the ETH sidechain. |
| dposvotetransaction | Record a vote for a list of supernodes on the ELA mainchain. |
| credaccess | Get user information (name, email, ...) from his DID profile. |
| walletaccess | Get information about user's wallet (Ex: ELA address). |
| sign | Sign some binary content using a DID signature. |

### Specific elastOS intents

#### Open an application

##### Description

Opens a given capsule.

##### Request parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| id | The application package id (ex: org.company.app) | string |

##### Response parameters

None

##### Request example

**Raw Http GET request**

    http://scheme.elastos.org/app?id=org.company.app | 

**elastOS**

    appManager.sendIntent("app", {
        id: "org.company.app"
    }, ...)




#### Register application profile

##### Description

Register user as using a given capsule, on his DID profile. After publishing this information to the DID sidechain, other users / friends can view that this user has a profile in the given app, and easily reach him there.

For example, if a developer creates CoolCapsule and CoolCapsule let users add friends and friends can write and read posts (similar to Facebook), Then CoolCapsule can ask its users to register their application profile. That profile will include a CoolCapsule-specific id in a VerifiableCredential. This way, when friends view this user's profile from the DID sidechain, they can reach others through a **connectapplicationprofile** intent that will receive all the regiter custom information and therefore be able to immediatelly connect inside CoolCapsule.

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

**elastOS**

    appManager.sendIntent("registerapplicationprofile", {
        identifier: "did-demo-app-profile",
        connectactiontitle: "Reach out in DID Demo capsule",
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

Usually, as a capsule developer you don't need to emit this intent. Instead, you will most likely listen to this intent emitted by the elastOS runtime.

##### Request parameters

All fields included in the ApplicationProfileCredential.

##### Response parameters

None

##### Request example

**elastOS**

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

Intent emitted by the scanner capsule after scanning a QR code.

This intent is sent only if the scanner capsule was started manually by the user. Otherwise if the scanner app is started by **scanqrcode** intent, the scanned data will be received in the sendIntent() callback.

##### Request parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| data | The scanned content | string |

##### Response parameters

None

##### Request example

**elastOS**

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

Requests the scanner capsule to scan a QR code and return the scanned data.

##### Request parameters

None

##### Response parameters

    {
        data: "ABCDEF"
    }

##### Request example

**elastOS**

    appManager.sendIntent("scanqrcode", {}, ...)

##### Response example

Received by the **appManager.sendIntent()** onSuccess callback.

    {
        data: "ABCDEF"
    }



#### Share content

##### Description

Shares some content either inside another elastOS capsule, or thr ough the native OS share feature.Shared content includes a title and a (optional) url.

It's up to the receiving app to share the content in a suitable way. A chat application would show a new clickable message to a user, and when clicked, the "url" is activated. The built-in friends app would instead let the user pick a friend and send a remote notification to that friend with the embedded shared content.

##### Request parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| title | Title describing the share action. Visible by everyone | string |
| url | Action url related to this shared content. For example, a link to open the target app in elastOS. Usually, this should be a elastos scheme link such as https://scheme.elastos.org/* | string |

##### Response parameters

None

##### Request example

**elastOS**

    appManager.sendIntent("share", {
        title: "Add me as a friend in elastOS",
        url: "https://scheme.elastos.org/addfriend?did=did:elastos:abcdef"
    }, ...)

##### Response example

None



#### Add friend

##### Description

Allows the user to add a given friend (by DID) to his friends list. 

For example, the built-in friends app simply saved the target DID as a friends in the friends list, in order to be able to reach that friend later.

Adding a friend is not directly reciprocal, friends are not notified that a user is adding them. It's up to the handling application to notify the friend if relevant.

##### Request parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| did | DID of the friend to be added | string |

##### Response parameters

None

##### Request example

**elastOS**

    appManager.sendIntent("addfriend", {
        did: "did:elastos:abcdef"
    }, ...)

##### Response example

None




#### Pick a friend

##### Description

Allows an application to pick a friend from another application. This works between any apps, but the most standard use case is for an application to pick a friend from the global built-in friends app that contains lots of contacts.

Pick friend requests can be filtered to look for a specific credential type.

##### Request parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| singleSelection | Pick only one friend at a time if true, or multiple ones at the same time if false. Default: true | boolean |
| filter | An optional "Filter" object | Filter |

<b>Filter object</b>:

| Parameter | Description | Format |
| ----- | ----- | ----- |
| credentialType | An optional string to pick only friends that have a specific credential type in their public DID document | string |

##### Response parameters

| Parameter | Description | Format |
| ----- | ----- | ----- |
| friends | A list of selected friends | Array<Friend> |

<b>Friend object</b>:

| Parameter | Description | Format |
| ----- | ----- | ----- |
| did | DID string of the friend (ex: "did:elastos:abc"). Mandatory. | DID string |
| document | Full DID document of the friend. Optional | DID Document |

##### Request example

**elastOS**

    appManager.sendIntent("pickfriend", {
        singleSelection: true,
        filter: {
            credentialType: "ApplicationProfileCredential"
        }
    }, ...)

##### Response example

	{
	    friends: [
	        {
	            did: "did:elastos:abcdef"
	        },
	        {
	            did: "did:elastos:123456"
	        }
	    ]
	}
