+++
title = "Elastos Scheme"
date = 2020-03-15T21:15:46+02:00
weight = 60
chapter = false
pre = ""
alwaysopen = false
+++

## Introduction

The Elastos scheme is the way for dApps to request operations to be completed by another Elastos application, on behalf of the user. For example, if your dApp wishes to request a payment from a user, it will call the payment scheme, which will open the installed wallet app, which will proceed to the payment (because it's the only one to know private user information), and send the payment confirmation to your app.

Schemes and parameters are the sames for all programming environments (elastOS, native apps ...). Nevertheless, the way to call them and get response changes.

## Deployment Method

Apps can request operations from other Elastos applications either through a special scheme, "elastos://", or "https://scheme.elastos.org". Those Elastos scheme URLs can be clicked, or scanned using a QR code scanner application.

## Scheme format

`elastos://<command></RequiredParameters...>`

or

`https://scheme.elastos.org/<command></RequiredParameters...`

## JWT requests and responses

The Elastos scheme usually uses signed or unsigned JWT tokens to transport requests and responses data. 

### Unsigned JWT requests

Unsigned requests are used in places where we cannot secure a private key to sign the JWT payload (ex: client side web page or native mobile app). In this case, JWT tokens are generated using no signature (**{alg: none} **in header) and an **empty signature** part.

### Signed requests

Signed requests are generated server side to prevent man in the middle attacks. They use the application DID keypair to sign JWTs.

### Signed responses

Responses can be signed. They use one of user’s DID key pairs contained in the identity management application.

### Raw request parameters

Although raw request parameters are supported, they are not recommended. Usage of JWT encoded requests is the preferred way.

Example of a raw request:

`https://scheme.elastos.org/pay?amount=12.4`

Raw requests can be used only for commands with flat parameters list (ex: pay), but they won't work for commands that require sub-object in parameters (ex: credaccess claims object).

## Commands list

| Command | Link | Description |
| --- | --- | --- |
| Access credentials | [ The **credaccess** command](#access-credentials-command) | Request access to user credentials |
| Issue a credential | [ The **credissue** command](#issue-credential-command) | Issue a new credential to a third party after signing it with user's DID |
| Import credentials | [ The **credimport** command](#import-credentials-command) | Let a user attach a previously issued credential to his DID |
| Access wallet info | [ The **walletaccess** command](#access-wallet-info-command) | Access wallet information such as ELA address, ELA amount |
| Pay | [ The **pay** command](#pay-command) | Send secure ELA payments, with blockchain confirmations |
| Ethereum transaction | [ The **esctransaction** command ](#esc-transaction-command) | Publish an ethereum transaction on the ethereum side chain |
| DID transaction | [ The **didtransaction** command ](#did-transaction-command) | Publish a DID transaction on the DID sidechain |
| DPoS vote transaction | [ The **dposvotetransaction** command ](#dpos-vote-transaction-command) | Publish a DPoS vote transaction on the ELA mainchain |
| Register as CR member | [ The **crmemberregister** command ](#register-as-a-cr-member-command) | Registers a new CR member candidate on the ELA mainchain |
| Vote for CR members | [ The **crmembervote** command ](#vote-for-cr-members-command) | Vote for CR members |
| Sign data | [ The **sign** command](#sign-data-command) | Sign any kind of data on behalf of a user in order to prove that this data belongs to him |

## Transport

### URLs

On the device any URL whose **hostname** is scheme.elastos.org or **scheme** is elastos:// open one of the supported Elastos apps such as the ELA wallet or the elastOS browser. If no such app is installed, scheme.elastos.org urls display a page that tells users how to get one of those apps.

iOS developers can use [open()](https://developer.apple.com/documentation/uikit/uiapplication/1648685-open) with the URL directly.

Android developers can use the [ACTION_VIEW intent](https://developer.android.com/reference/android/content/Intent.html#ACTION_VIEW) to open the URL as well.

### QR Code

By encoding the request url in a QR code it is very easy for users with an Elastos app installed to scan a request. On iOS 11, the system camera can scan QR codes automatically.

### Use cases

The following use cases must be handled by a wallet app implementing the Elastos scheme:

#### Case 1: Mobile browser transport

A native mobile application generates a request. The request is broadcast within the mobile operating system (android, ios) using native methods (intents, open url) and directly handled by the elatos wallet application if installed. Response is returned by the same mechanism, either using intents or open url, by providing specific scheme or hostname in the response’ callback url. There is no server interaction in this case.

#### Case 2: Desktop browser server backed transport

A desktop browser displays a QR code that represents the request. That QR code was generated by the website back-end and the request JWT is signed. The wallet app scans the QR code and handles the request. Response is sent through a HTTP POST call to the back-end server, which informs its website front-end of the result.

#### Case 3: Mobile browser server backed transport

A mobile browser requires its back-end to generate a signed request. This request is directly opened on the device, which opens the wallet application. Response is sent to the website back-end which handles the response and informs its front-end of the result.

## Requests


### Format

The following formats are usable:
 
`http://scheme.elastos.org/[command]/[JWT]`

`http://scheme.elastos.org/[command]?[query as get parameters]`

`elastos://[command]/[JWT]`

`elastos://[command]?[query as get parameters]`

The benefit of using https://scheme.elastos.org URLs is that they can **open a web site with an App Store link if the wallet app is not installed**. On a desktop browser, the browser can display a QR code containing the request and will ask the user to scan the code with their mobile app. This should therefore be the preferred way for websites.

On the other hand, native apps may prefer calling the **elastos://** scheme for a smoother (direct) user experience.


### Encoding

* All JWT requests usually have a single parameter, which is the signed JWT token.
* JWT tokens are generated according to the [RFC 7519](https://tools.ietf.org/html/rfc7519) specification.
* In case raw parameters are used, each parameter must be url encoded.
* All strings in requests and responses use the UTF8 encoding.

### Required parameters

The following parameters are common to all requests. All scheme requests must provide the parameters if they are mandatory. Some of those parameters are used as information to the end user, while some others are used to secure the communication and verify that requests and responses are genuine.

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>iss
   </td>
   <td>The DID of the requester (mobile app’s application DID, website’s DID) - Entity who is sending (and possibly signing) this request.
   </td>
   <td>no
   </td>
   <td>DID String
   </td>
  </tr>
  <tr>
   <td>iat
   </td>
   <td>Time at which the JWT was created
   </td>
   <td>no
   </td>
   <td>Unix timestamp (seconds)
   </td>
  </tr>
  <tr>
   <td>exp
   </td>
   <td>Expiration time of the JWT. After this time, responses to this request should return an error.
   </td>
   <td>yes
   </td>
   <td>Unix timestamp (seconds)
   </td>
  </tr>
  <tr>
   <td>callbackurl
   </td>
   <td>Callback URL for returning the response to the requester. Callback is called using HTTP POST and data is passed as a JSON object {“jwt”:[JWT]}
<p>
Custom parameters in the url are preserved and passed back to the receiving server or destination.
<p>
Callback receiver must return an HTTP code 200 to notify the wallet app that the response was handled correctly.
   </td>
   <td>No (1)
   </td>
   <td>URL encoded string
   </td>
  </tr>
  <tr>
   <td>redirecturl
   </td>
   <td>The redirect URL is called using mobile OS open url API or intent. This allows the calling app to directly handle this call. 
<p>
Custom parameters in the url are preserved and passed back to the receiving mobile application.
<p>
The JWT response is appended to the given url as a fragment (yourcallback?params#[JWT])
   </td>
   <td>No (1)
   </td>
   <td>
   </td>
  </tr>
</table>
{{< /rawhtml >}}

1. Usually, one of callbackurl or redirecturl is required, but some commands do not await any response (ex: issue credential)


## Responses

Responses are created by the app that received a request, as a response to that request. either through the **callbackurl** method, or **redirecturl** method.

The JWT token contains the response payload, and a signature that can be used to verify the provided payload.

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>type
   </td>
   <td>Depends on the request type. Check this in the specific request.
   </td>
   <td>no
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>iss
   </td>
   <td>DID of the entity signing the JWT. Usually, user's DID
   </td>
   <td>no
   </td>
   <td>DID String
   </td>
  </tr>
  <tr>
   <td>aud
   </td>
   <td>DID of the requester. Usually, the application DID.
   </td>
   <td>yes
   </td>
   <td>DID String
   </td>
  </tr>
  <tr>
   <td>iat
   </td>
   <td>Time at which the JWT was created
   </td>
   <td>yes
   </td>
   <td>Unix timestamp (seconds)
   </td>
  </tr>
  <tr>
   <td>exp 
   </td>
   <td>Expiration time of the JWT. After this time, response should be handled in error by the receiver.
   </td>
   <td>yes
   </td>
   <td>Unix timestamp (seconds)
   </td>
  </tr>
  <tr>
   <td>req
   </td>
   <td>The original JWT received from the request
   </td>
   <td>yes if the received request was signed
   </td>
   <td>JWT
   </td>
  </tr>
</table>
{{< /rawhtml >}}

## Verifying requests

{{< notice note >}}
This is not implemented by any app yet.
{{</ notice >}}

The **wallet** application implementing those scheme commands verifies the validity of incoming request JWTs as following:

*   Extract the JWT payload, and get the App DID
*   Make sure the JWT is not expired
*   Retrieve App information from the dApp sidechain, from the App ID: App name (use it for display), Developer information (for display), callback url and app public key.
*   (If the JWT is signed:) Use the public key to verify that the JWT was signed using the right keypair.
*   Make sure that the callback url in the JWT matches whitelisted URLs from the dApp sidechain (those whitelisted urls have been registered by the developer when creating his app ID).
*   Display information such as app name and developer name inside the wallet, while requesting user action.
*   With this procedure, we make sure that we will send private user information, such as credentials, to an authorized callback url.

## Verifying responses

In case responses use the **callbackurl** method, the receiving server back-end or client mobile application has to verify the validity of incoming response JWTs as following:

*   For responses that are signed by a user DID by the wallet app
*   Extract the JWT payload
*   Make sure the JWT is not expired
*   Retrieve user’s public key from the DID sidechain, using the issuer did provided in the JWT
*   Use the public key to verify that the response is valid
*   (Optional:) If user identity is already known, check that user listed in the response is the signed in user
*   With this procedure, we make sure that the response is sent by the right user.


## Access Credentials Command

Used to request user related information first name, email address, phone number, diploma, certifications, accomplishments, or anything else related to the user.

Typically used to sign up/in users, or to prove facts (ex: user belongs to a university).

Those credentials have been attached as verified credentials on user’s DID before, by third party issuers.

### Endpoint

**/credaccess/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>claims
   </td>
   <td>List of claims the application requests from the user. See Claims format.
   </td>
   <td>yes
   </td>
   <td>Claims format
   </td>
  </tr>
  <tr>
   <td>sub
   </td>
   <td>DID of the targeted user identity, in case user’s DID is already known and we want to get additional credentials. That will auto-select the right identity in the DID application.
   </td>
   <td>no
   </td>
   <td>DID string
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Claims format

{{< highlight "json" >}}
    "claims": {
      // default parameters: required: true, no reason, no specific iss requirement
      "CLAIM_NAME": true, 
      // or
      "CLAIM_NAME": {
        // If a required field cannot be provided, the request will fail
        "required": true | false, 
        // Optional
        "reason": "Reason displayed to user", 
        // Requirements about the credential issue (ex: if we want to target a specific organization)
        "iss": {
          // Credential must have been issued by this specific DID
          "did":"issuer_did" 
        }
      }
    }
{{< /highlight >}}

### Request example

`https://scheme.elastos.org/credaccess/[JWT]`

**JWT Payload**:

{{< highlight "json" >}}
    {
      "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
      "iat": 1566352213,
      "exp": 1566382213,
      "redirecturl": "myapp://elastosschemeresponse",
      "claims": {
        "email": true,
        "diploma": {
          "required": false,
          "reason": "If provided, will be shown to end user",
          // or
          "reason": [{
            "lang": "en|fr|zh|etc",
            "value": "Language specific reason",
          }],
          "iss": {
            "did":"did:elastos:my_university_did"
          }
        }
      }
    }
{{< /highlight >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>presentation
   </td>
   <td>The verifiable presentation
   </td>
   <td>yes
   </td>
   <td>W3C’s verifiable presentation
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response example

**JWT Payload:**

{{< highlight "json" >}}
    {
      "type": "credaccess",
      "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
      "aud": "did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",
      "iat": 1566352213,
      "exp": 1566382213,
      "req": "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",
      "presentation": [PRESENTATION_CONTENT]
    }
{{< /highlight >}}

**Presentation content:**

{{< highlight "json" >}}
    {
      "@context": [
        "https://www.w3.org/2018/credentials/v1",
        "https://www.w3.org/2018/credentials/examples/v1"
      ],
      "type": "VerifiablePresentation",
      "verifiableCredential": [{
        "@context": [
          "https://www.w3.org/2018/credentials/v1",
          "https://www.w3.org/2018/credentials/examples/v1"
        ],
        "id": "http://example.edu/credentials/1872",
        "type": ["VerifiableCredential", "AlumniCredential"],
        "issuer": "https://example.edu/issuers/565049",
        "issuanceDate": "2010-01-01T19:73:24Z",
        "credentialSubject": {
          "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
          "alumniOf": {
            "id": "did:example:c276e12ec21ebfeb1f712ebc6f1",
            "name": [{
              "value": "Example University",
              "lang": "en"
            }, {
              "value": "Exemple d'Université",
              "lang": "fr"
            }]
          }
        },
        // Optional. Only for credentials that can be verified (not self issued)
        "proof": { 
          "type": "RsaSignature2018",
          "created": "2017-06-18T21:19:10Z",
          "proofPurpose": "assertionMethod",
          "verificationMethod": "https://example.edu/issuers/keys/1",
          "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X
            sITJX1CxPCT8yAV-TVkIEq_PbChOMqsLfRoPsnsgw5WEuts01mq-pQy7UJiN5mgRxD-WUc
            X16dUEMGlv50aqzpqh4Qktb3rk-BuQy72IFLOqV0G_zS245-kronKb78cPN25DGlcTwLtj
            PAYuNzVBAh4vGHSrQyHUdBBPM"
        }
      }],
      "proof": {
        "type": "ECDSAsecp256r1",
        "verificationMethod": "did:example:icJ4z2DULrHEzYSvjKNJpKyhqFDxvYV7pN#keys-1",
        "nonce": "6c573d7abe8720b5a659671335788a6f",
        "realm": "example.com",
        "signature": "eyJhbGci...AnKb78="
      }
    }
{{< /highlight >}}

### Claim Taxonomy

The elastos scheme is agnostic to different claim types. This allows you to plug in your own taxonomy of claims or use an existing taxonomy that works in your industry.

Whenever possible, for apps communication compatibility, we recommend to use the list of standard claim names that has been defined in the [Elastos Verifiable Claims Specification](https://github.com/elastos/Elastos.DID.Method/blob/master/VerifiableClaims/Elastos-Verifiable-Claims-Specification_en.md#credential-subject).




## Issue Credential Command

Used to generate a Verifiable Credential given a set of properties and other information. The generated credential if signed by current user's identity and targets a subject identity.

### Endpoint

**/credissue/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>identifier
   </td>
   <td>The credential key (credential "id" in W3C terms)
   </td>
   <td>yes
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>types
   </td>
   <td>Array of custom credential types. At least one type must be provided.
   </td>
   <td>yes
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>subjectdid
   </td>
   <td>DID of the entity that should receive the issued credential.
   </td>
   <td>yes
   </td>
   <td>DID String
   </td>
  </tr>
  <tr>
   <td>properties
   </td>
   <td>Custom JSON object with all the properties to attach as credentialSubject to the credential.
   </td>
   <td>yes
   </td>
   <td>JSON object
   </td>
  </tr>
  <tr>
   <td>expirationdate
   </td>
   <td>Date at which the issued credential will be no longer valid.
   </td>
   <td>no
   </td>
   <td>ISO 8601 date string
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Request example

`https://scheme.elastos.org/credissue/[JWT]`

**JWT Payload**:

{{< highlight "json" >}}
    {
      "identifier": "customcredentialkey",
      "types": ["MyCredentialType"],
      "subjectdid": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
      "properties": {
          "customData": "Here is a test data that will appear in someone else's DID document after he imports it.",
          "moreComplexData": {
            "info": "A sub-info"
          }
      },
      "expirationdate": "2025-05-25T08:08:04.000Z"
    }
{{< /highlight >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>credential
   </td>
   <td>The verifiable credential
   </td>
   <td>yes
   </td>
   <td>W3C’s verifiable credential
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response example

**JWT Payload:**

{{< highlight "json" >}}
    {
        "@context": [
          "https://www.w3.org/2018/credentials/v1",
          "https://www.w3.org/2018/credentials/examples/v1"
        ],
        "id": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC#customcredentialkey",
        "type": ["MyCredentialType"],
        "issuer": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
        "issuanceDate": "2020-01-01T19:73:24Z",
        "credentialSubject": {
          "id": "did:example:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
          "customData": "Here is a test data that will appear in someone else's DID document after he imports it.",
          "moreComplexData": {
            "info": "A sub-info"
          }
        },
        "proof": { 
          "type": "RsaSignature2018",
          "created": "2020-06-18T21:19:10Z",
          "proofPurpose": "assertionMethod",
          "verificationMethod": "https://example.edu/issuers/keys/1",
          "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X
            sITJX1CxPCT8yAV-TVkIEq_PbChOMqsLfRoPsnsgw5WEuts01mq-pQy7UJiN5mgRxD-WUc
            X16dUEMGlv50aqzpqh4Qktb3rk-BuQy72IFLOqV0G_zS245-kronKb78cPN25DGlcTwLtj
            PAYuNzVBAh4vGHSrQyHUdBBPM"
        }
      }
{{< /highlight >}}





## Import Credentials Command

Requests the user to accept or reject one or more credentials issued by an issuer (ex: a university issues a diploma for this user) before attaching this credential to user’s DID. The issuer's credential is first attached to the local DID on user's device, and the user can choose to make it public or not (DID sidechain) later.

Credentials can be generated using a DID SDK, such as the Elastos native or Java SDKs, or the elastOS DID plugin.

In order to issue a credential, the issuer needs to have a DID himself first, because this DID is used to sign the credential. Later on, this signing DID can also be checked on the DID sidechain by a service, to make sure if the credential issuer is valid and trusted or not.

### Endpoint

**/credimport/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>credentials
   </td>
   <td>Array of verifiable credentials as per the W3C specification
   </td>
   <td>yes
   </td>
   <td>W3C’s verifiable credential
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Verifiable credentials format

{{< highlight "json" >}}
{
  "credentials": [{
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1"
    ],
    "id": "http://example.gov/credentials/3732",
    "type": ["VerifiableCredential", "UniversityDegreeCredential"],
    "issuer": "https://example.edu",
    "issuanceDate": "2010-01-01T19:73:24Z",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
      "degree": {
        "type": "BachelorDegree",
        "name": "Bachelor of Science and Arts"
      }
    },
    "proof": {
      "type": "RsaSignature2018",
      "created": "2018-06-18T21:19:10Z",
      "proofPurpose": "assertionMethod",
      "verificationMethod": "https://example.com/jdoe/keys/1",
      "jws": "eyJhbGciOiJQUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19
        ..DJBMvvFAIC00nSGB6Tn0XKbbF9XrsaJZREWvR2aONYTQQxnyXirtXnlewJMB
        Bn2h9hfcGZrvnC1b6PgWmukzFJ1IiH1dWgnDIS81BH-IxXnPkbuYDeySorc4
        QU9MJxdVkY5EL4HYbcIfwKj6X4LBQ2_ZHZIu1jdqLcRZqHcsDF5KKylKc1TH
        n5VRWy5WhYg_gBnyWny8E6Qkrze53MR7OuAmmNJ1m1nN8SxDrG6a08L78J0-
        Fbas5OjAQz3c17GY8mVuDPOBIOVjMEghBlgl3nOi1ysxbRGhHLEK4s0KKbeR
        ogZdgt1DkQxDFxxn41QWDw_mmMCjs9qxg0zcZzqEJw"
    }
  }]
}
{{< /highlight >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>importedcredentials
   </td>
   <td>List of IDs of credentials that were imported
   </td>
   <td>yes
   </td>
   <td>Array of strings
   </td>
  </tr>
</table>
{{< /rawhtml >}}




## Access Wallet Info Command

Used to get user ELA address, ELA wallet amount, or other wallet related information. 

### Endpoint

**/walletaccess/**

### Request parameters

The following parameters could or should be part of the JWT structure:

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>reqfields
   </td>
   <td>List of fields requested to the user.
   </td>
   <td>yes
   </td>
   <td>Requested field format
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Request field format

{{< highlight "json" >}}
{
  "reqfields": [{
    // default parameters: required: true, no reason
    "FIELD_NAME": true, 
    // or
    "FIELD_NAME": { 
      // Optional
      "reason": "Reason displayed to user", 
      // or
      "reason": [{
        "lang":"en|fr|zh|etc",
        "value":"Language specific reason",
      }]
    }
  }]
}
{{< /highlight >}}

### Standard fields

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Field</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>elaaddress
   </td>
   <td>ELA wallet address
   </td>
   <td>Wallet address string
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Request example

`https://scheme.elastos.org/walletaccess/[JWT]`

**JWT Payload**:

{{< highlight "json" >}}
{
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "iat": 1566352213,
  "exp": 1566382213,
  "redirecturl": "myapp://elastosschemeresponse",
  "reqfields": [{
    "elaaddress": true,
    // or
    "elaaddress": {
      "reason": "If provided, will be shown to end user",
      // or
      "reason": [{
        "lang":"en|fr|zh|etc",
        "value":"Language specific reason",
      }]
    }
  }]
}
{{< /highlight >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>walletinfo
   </td>
   <td>List of information for requested fields
   </td>
   <td>yes
   </td>
   <td>
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response example

JWT Payload:

{{< highlight "json" >}}
{
  "type": "walletaccess",
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "aud": "did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",
  "iat": 1566352213,
  "exp": 1566382213,
  "req": "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",
  "walletinfo": [ {
    "elaaddress": "abcdef"
  }]
}
{{< /highlight >}}

## Pay Command

Used to send payments, usually from a user to another user, or from a user to a "shop" to purchase a good. This does not include specific transaction like paying fees to create a DID, run a smart contract, or vote for DPoS. This pay command should remain related to what end users are used to do with google pay or apple pay.

Several kind of payments are available:

*   ELA mainchain payment
*   ELAESC payment
*   ERC20 token payment

In case of ERC20 tokens, token smart contract addresses are hardcoded by the implementing application, **not** passed as command parameter.

### Endpoint

**/pay/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>amount
   </td>
   <td>Amount to be transferred
   </td>
   <td>yes
   </td>
   <td>Number (0.00)
   </td>
  </tr>
  <tr>
   <td>receiver
   </td>
   <td>ELA address receiving the payment
   </td>
   <td>yes
   </td>
   <td>ELA address
   </td>
  </tr>
  <tr>
   <td>currency
   </td>
   <td>Crypto currency name or ERC20 token name. If nothing is provided, ELA is assumed.
   </td>
   <td>no
   </td>
   <td>"ELA","ELAESC","TOK", etc
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>txid
   </td>
   <td>Chain-specific ID generated by the created transaction
   </td>
   <td>yes
   </td>
   <td>
   </td>
  </tr>
   <td>status
   </td>
   <td>Transaction status
   </td>
   <td>yes
   </td>
   <td>"cancelled", "published", “error”
   </td>
  <tr>
  </tr>
</table>
{{< /rawhtml >}}

### Request example

`https://scheme.elastos.org/pay/[JWT]`

JWT Payload:

{{< highlight "json" >}}
{
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "iat": 1566352213,
  "exp": 1566382213,
  "redirecturl": "myapp://elastosschemeresponse",
  "amount": 20.50,
  "receiver": "EfPaLGVqoBTCRtioLN5CFbExBVu7NsgFpX"
}
{{< /highlight >}}

### Response example

JWT Payload:

{{< highlight "json" >}}
{
  "type": "pay",
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "aud": "did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",
  "iat": 1566352213,
  "exp": 1566382213,
  "req": "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",
  "txid": "cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"
}
{{< /highlight >}}


## ESC Transaction command

Transaction to execute an **ethereum sidechain smart contract**.

### Endpoint

**/esctransaction/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>receiver
   </td>
   <td>Smart contract account address
   </td>
   <td>yes
   </td>
   <td>ETH account address
   </td>
  </tr>
  <tr>
   <td>amount
   </td>
   <td>Amount of ELAESC to be passed to the smart contract
   </td>
   <td>no
   </td>
   <td>Number (0.00)
   </td>
  </tr>
  <tr>
   <td>payload
   </td>
   <td>Smart contract payload. Ex: the result of “<code>web3.eth.contract(abi).at(address).myMethod.getData(myParam);"</code>
   </td>
   <td>yes
   </td>
   <td>ETH transaction data payload
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>txid
   </td>
   <td>Chain-specific ID generated by the created transaction
   </td>
   <td>yes
   </td>
   <td>
   </td>
  </tr>
  </tr>
   <td>status
   </td>
   <td>Transaction status
   </td>
   <td>yes
   </td>
   <td>"cancelled", "published", “error”
   </td>
  <tr>
</table>
{{< /rawhtml >}}

### Request example

https://scheme.elastos.org/esctransaction/[JWT]

JWT Payload:

{{< highlight "json" >}}
{
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "iat": 1566352213,
  "exp": 1566382213,
  "redirecturl": "myapp://elastosschemeresponse",
  "amount": 20.50,
  "receiver": "EfPaLGVqoBTCRtioLN5CFbExBVu7NsgFpX",
  "payload": [......]
}
{{< /highlight >}}

### Response example

JWT Payload:

{{< highlight "json" >}}
{
  "type": "esctransaction",
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "aud": "did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",
  "iat": 1566352213,
  "exp": 1566382213,
  "req": "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",
  "txid": "cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"
}
{{< /highlight >}}

## DID Transaction Command

Used to record a given DID request (ex: including updated DID document given by the DID app) to the DID sidechain.

### Endpoint

**/didtransaction/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>didrequest
   </td>
   <td>DID request (JSON), as provided by the DID SDK 
   </td>
   <td>yes
   </td>
   <td>DID Request
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>txid
   </td>
   <td>DID sidechain-specific ID generated by the created transaction
   </td>
   <td>yes
   </td>
   <td>
   </td>
  </tr>
  </tr>
   <td>status
   </td>
   <td>Transaction status
   </td>
   <td>yes
   </td>
   <td>"cancelled", "published", “error”
   </td>
  <tr>
</table>
{{< /rawhtml >}}

### Request example

`https://scheme.elastos.org/didtransaction/[JWT]`

JWT Payload:

{{< highlight "json" >}}
{
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "iat": 1566352213,
  "exp": 1566382213,
  "redirecturl": "myapp://elastosschemeresponse",
  "didrequest": {
    "header": {
      "specification": "elastos/did/1.0",
      "operation": "create"
    },
    "payload": "eyJpZCI6ImRpZDplbGFzdG9zOmlZY3A3SkRCenhTZnFlcVV0VlQ1TG5yZ1dvNDhpUVV0Q2oiLCJwdWJsaWNLZXkiOlt7ImlkIjoiI3ByaW1hcnkiLCJwdWJsaWNLZXlCYXNlNTgiOiJ6bkduc042N3BFUXBwQ3FIS2t4TDJuNzV4MnlqSmNtcllrbW1MdnNoNGZSQSJ9XSwiYXV0aGVudGljYXRpb24iOlsiI3ByaW1hcnkiXSwiZXhwaXJlcyI6IjIwMjQtMTEtMTJUMTM6MDA6MDBaIn0",
    "proof":{
      "verificationMethod": "#primary",
      "signature": "h3PQyLMVR+vWXF6jPGmHSXDD/3QwjtBy17aqZ9DErL+2xNUE9s1NdSQ5jpBUAqXrG/8nGkBDVDYTHixV2uvBSw=="
    }
  }
}
{{< /highlight >}}

### Response example

JWT Payload:

{{< highlight "json" >}}
{
  "type": "didtransaction",
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "aud": "did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",
  "iat": 1566352213,
  "exp": 1566382213,
  "req":  "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",
  "txid": "cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"
}
{{< /highlight >}}

## DPoS Vote Transaction Command

Used to record a user vote to the mainchain.

### Endpoint

**/dposvotetransaction/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>publickeys
   </td>
   <td>List of public keys of supernodes for which we want to vote. Between 1 and 36 keys are allowed.
   </td>
   <td>yes
   </td>
   <td>
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>txid
   </td>
   <td>The created mainchain transaction ID.
   </td>
   <td>yes
   </td>
   <td>
   Array of public key dids
   </td>
  </tr>
  </tr>
   <td>status
   </td>
   <td>Transaction status
   </td>
   <td>yes
   </td>
   <td>"cancelled", "published", “error”
   </td>
  <tr>
</table>
{{< /rawhtml >}}

### Request example

`https://scheme.elastos.org/dposvotetransaction/[JWT]`

JWT Payload:

{{< highlight "json" >}}
{
    "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
    "iat": 1566352213,
    "exp": 1566382213,
    "redirecturl": "myapp://elastosschemeresponse",
    "publickeys": ["abcd","defg","hijk"]
}
{{< /highlight >}}

### Response example

JWT Payload:

{{< highlight "json" >}}
{
  "type": "dpostransaction",
  "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
  "aud": "did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",
  "iat": 1566352213,
  "exp": 1566382213,
  "req": "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",
  "txid": "cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"
}
{{< /highlight >}}

## Register as a CR member Command

Registers a CR council member candidate so that other persons can vote for her/him.

### Endpoint

**/crmemberregister/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>did
   </td>
   <td>DID of the user that has to be registered as a proposed candidate for the CR voting process
   </td>
   <td>yes
   </td>
   <td>DID string
   </td>
  </tr>
  <tr>
   <td>nickname
   </td>
   <td>Name of the candidate
   </td>
   <td>yes
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>url
   </td>
   <td>Marketing website url for the candidate
   </td>
   <td>no
   </td>
   <td>URL
   </td>
  </tr>
  <tr>
   <td>location
   </td>
   <td>Location of the CR member candidate.
   </td>
   <td>yes
   </td>
   <td>International calling code number without the + prefix
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>txid
   </td>
   <td>Generated transaction ID on the Elastos mainchain
   </td>
   <td>yes
   </td>
   <td>
   </td>
  </tr>
  </tr>
   <td>status
   </td>
   <td>Transaction status
   </td>
   <td>yes
   </td>
   <td>"cancelled", "published", “error”
   </td>
  <tr>
</table>
{{< /rawhtml >}}

### Request example

`https://scheme.elastos.org/crmemberregister/[JWT]`

JWT Payload:

{{< highlight "json" >}}
{
    "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
    "iat": 1566352213,
    "exp": 1566382213,
    "redirecturl": "myapp://elastosschemeresponse",
    "did": "did:ela:ia9akyCKcvwDNGAGxPrMTNVSKZV4f3tcKj",
    "url": "http://my.website.com",
    "nickname": "The candidate",
    "location": "86"
}
{{< /highlight >}}


## Vote for CR members Command

Allows a user to vote for one or more CR council members

### Endpoint

**/crmembervote/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>votes
   </td>
   <td>List of candidate did / number of SELA
   </td>
   <td>yes
   </td>
   <td>Object that contains a list of key/value vote pairs
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>txid
   </td>
   <td>Generated transaction ID on the Elastos mainchain
   </td>
   <td>yes
   </td>
   <td>
   </td>
  </tr>
  </tr>
   <td>status
   </td>
   <td>Transaction status
   </td>
   <td>yes
   </td>
   <td>"cancelled", "published", “error”
   </td>
  <tr>
</table>
{{< /rawhtml >}}

### Request example

`https://scheme.elastos.org/crmembervote/[JWT]`

JWT Payload:

{{< highlight "json" >}}
{
    "iss": "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",
    "iat": 1566352213,
    "exp": 1566382213,
    "redirecturl": "myapp://elastosschemeresponse",
    "votes": {
      "did:ela:ia9akyCKcvwDNGAGxPrMTNVSKZV4f3tcKj":"1000000",
      "did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC":"2500000"
    }
}
{{< /highlight >}}

## Sign Data Command

Used to sign a document. Later on, anyone can check the signed result to make sure of the original data ownership.

### Endpoint

**/sign/**

### Request parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>data
   </td>
   <td>Binary data to sign
   </td>
   <td>yes
   </td>
   <td>String
   </td>
  </tr>
</table>
{{< /rawhtml >}}

### Response parameters

{{< rawhtml >}}
<table>
  <tr>
   <td><strong>Parameter</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Mandatory</strong>
   </td>
   <td><strong>Format</strong>
   </td>
  </tr>
  <tr>
   <td>signingdid
   </td>
   <td>DID Url of the signer
   </td>
   <td>yes
   </td>
   <td>DID URL
   </td>
  </tr>
  <tr>
   <td>publickey
   </td>
   <td>Public key of the signer
   </td>
   <td>yes
   </td>
   <td>DID public key
   </td>
  </tr>
  <tr>
   <td>signature
   </td>
   <td>Generated signature using the original data and the selected DID’s keypair
   </td>
   <td>yes
   </td>
   <td>String
   </td>
  </tr>
</table>
{{< /rawhtml >}}

## Custom scheme commands

Besides standard command listed above, the same scheme can be extended to exchange custom requests and responses among elastos apps.

**Examples:**

*   Open a red packet
*   Install a dapp

In such cases, it’s up to the application to decide:

*   If it wants to use JWT tokens or simple non encoded GET query parameters
*   Command names (**except reserved commands** for the standard scheme commands)

Custom command example:

*   https://scheme.elastos.org/redpacket/open?packetid=123&userid=345


## Creating application identities

Developers willing to use the Elastos scheme may need to create an identity for each application (website, native app, elastOS capsule...) on the DID sidechain first if they want to sign their requests JWTs. After registration, they may get the following information at least:

*   Developer DID
*   Developer DID private key
*   Developer DID public key
