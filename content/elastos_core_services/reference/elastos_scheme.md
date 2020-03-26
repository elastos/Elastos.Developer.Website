+++
title = "Elastos scheme"
date = 2020-03-15T21:15:46+02:00
weight = 60
chapter = false
pre = ""
alwaysopen = false
draft = true
+++

## Introduction

The Elastos scheme is the way for dApps to request operations to be completed by another Elastos application, on behalf of the user. For example, if your dApp wishes to request a payment from a user, it will call the payment scheme, which will open the installed wallet app, which will proceed to the payment (because it's the only one to know private user information), and send the payment confirmation to your app.

Schemes and parameters are the sames for all programming environments (Trinity, native apps ...). Nevertheless, the way to call them and get response changes. Please refer to the {{< internallink "elastos scheme guide" "elastos_core_services/guides/elastos_schemes.md" >}} for more information about your platform.

## Deployment Method

Apps can request operations from other Elastos applications either through a special scheme, "elastos://", or "https://scheme.elastos.org". Those Elastos scheme URLs can be clicked, or scanned using a QR code scanner application.

## Scheme format

elastos://<command></RequiredParameters...>
https://scheme.elastos.org/<command></RequiredParameters...>

## JWT requests and responses

The Elastos scheme uses signed or unsigned JWT tokens to transport requests and responses data.

### Unsigned JWT requests

Unsigned requests are used in places where we cannot secure a private key to sign the JWT payload (ex: client side web page or native mobile app). In this case, JWT tokens are generated using no signature ({alg: none} in header) and an empty signature part.
Signed requests
Signed requests are generated server side to prevent man in the middle attacks. They use the application DID keypair to sign JWTs.
Signed responses
Responses are always signed. They use one of user’s DID key pairs contained in the wallet application.

### Raw request parameters

Although raw request parameters are supported, they are not recommended. Usage of JWT encoded requests is the preferred way.

Example of a raw request:

`https://scheme.elastos.org/pay?amount=12.4`

### Commands list

| Command | Link | Description |
| --- | --- | --- |
| Access credentials | [ The **credaccess** command](#credaccess-command) | Request access to user credentials |
| Issue credentials | [ The **credissue** command](#credissue-command) | Request from a credential issuer to prompt user to attach this credential to his DID |
| Access wallet info | [ The **walletaccess** command](#walletaccess-command) | Access wallet information such as ELA address, ELA amount |
| Pay | [ The **pay** command](#pay-command) | Send secure ELA payments, with blockchain confirmations |
| Sign data | [ The **sign** command](#sign-command) | Sign any kind of data on behalf of a user in order to prove that this data belongs to him |

## Transports

## Ways of sending request URLs

Requests always consist of URLs that are handled by mobile apps. There are different ways of sending the URL to the mobile app:

*   Open uPort URL on the phone
*   Scan a QR Code from the wallet application
*   Send push notification to the wallet application

For all of these cases the request consists of a **URL**.


### **Open URL**

On the device any URL whose **hostname** is scheme.elastos.org or **scheme** is elastos:// must be opened directly by the Elastos wallet app if installed. If not installed, that url must redirect to the appropriate app store in order to offer end users to install a wallet application.

iOS developers can use [open()](https://developer.apple.com/documentation/uikit/uiapplication/1648685-open) with the URL directly.

Android developers can use the [ACTION_VIEW intent](https://developer.android.com/reference/android/content/Intent.html#ACTION_VIEW) to open the URL as well.


### **QR Code**

By encoding the request url in a QR code it is very easy for users with the Elastos wallet app installed to scan a request. On iOS 11, the system camera can scan QR codes automatically.


### **Push Notifications**

Not handled by this version of the Elastos scheme specification. Push notifications are useful to improve the communication flow, especially to prevent scanning a QR code for every operation on a website. With push messages, request urls can be sent easily to the wallet app (see wechat desktop authentication using wechat mobile app).

For this, an initial request has to be completed manually, for instance using a QR code, after what a push token is issued and can be reused (similarly to a JWT auth token) by the client app or client website to send further requests to the app.


## Use cases

The following use cases must be handled by a wallet app implementing the Elastos scheme:


### Mobile browser transport

A native mobile application generates a request. The request is broadcast within the mobile operating system (android, ios) using native methods (intents, open url) and directly handled by the wallet application if installed. Response is returned by the same mechanism, either using intents or open url, by providing specific scheme or hostname in the response’ callback url. There is no server interaction in this case.



<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Elastos-Scheme0.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Elastos-Scheme0.png "image_tooltip")


_* This diagram is copied from the uPort specification, but it also works for the Elastos Scheme specification._


### Desktop browser server backed transport

A desktop browser displays a QR code that represents the request. That QR code was generated by the website back-end and the request JWT is signed. The wallet app scans the QR code and handles the request. Response is sent through a HTTP POST call to the back-end server, which informs its website front-end of the result.



<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Elastos-Scheme1.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Elastos-Scheme1.png "image_tooltip")


_* This diagram is copied from the uPort specification, but it also works for the Elastos Scheme specification._


### Mobile browser server backed transport

A mobile browser requires its back-end to generate a signed request. This request is directly opened on the device, which opens the wallet application. Response is sent to the website back-end which handles the response and informs its front-end of the result.


# JWT generation

This scheme uses signed or unsigned JWT tokens to transport requests and responses data.


## Unsigned requests

Unsigned requests are used in places where we cannot secure a private key to sign the JWT payload (ex: client side web page or native mobile app). In this case, JWT tokens are generated using no signature (**{alg: none} **in header) and an **empty signature** part.


## Signed requests

Signed requests are generated server side to prevent man in the middle attacks. They use the application DID keypair to sign JWTs.


## Signed responses

Responses are always signed. They use one of user’s DID key pairs contained in the wallet application.


# Requests


## Format

**http://scheme.elastos.org/[command]/[JWT]**

**http://scheme.elastos.org/[command]?[query as get parameters]**

**elastos://[command]/[JWT]**

**elastos://[command]?[query as get parameters]**

The benefit of using https://scheme.elastos.org URLs is that they can **open a web site with an App Store link if the wallet app is not installed**. On a desktop browser, the browser can display a QR code containing the request and will ask the user to scan the code with their mobile app. This should therefore be the preferred way.


## Encoding



*   All JWT requests usually have a single parameter, which is the signed JWT token.
*   JWT tokens are generated according to the [RFC 7519](https://tools.ietf.org/html/rfc7519) specification.
*   All strings in requests and responses use the UTF8 encoding.


## Required parameters

The following parameters are common to all requests. All scheme requests must provide the parameters if they are mandatory. Some of those parameters are used as information to the end user, while some others are used to secure the communication and verify that requests and responses are genuine.


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
   <td>appid
   </td>
   <td>Application ID. Developer’s application must be registered first.
   </td>
   <td>yes
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>iss
   </td>
   <td>The DID of the requester (mobile app’s app ID, website’s app ID) - Entity who is sending this request.
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




1. Usually, one of callbackurl or redirecturl is required, but some commands do not await any response (ex: issue credential)


# Responses

Responses are created by the app that received a request, as a response to that request. A response is returned as POST, to the callback url included in the request, with a JSON encoded object structured like this:

{

	“jwt”: SIGNED_JWT

}

The JWT token contains the response payload, and a signature that can be used to verify the provided payload.


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
   <td>yes
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>iss
   </td>
   <td>DID of the entity signing the JWT. The elastos wallet application DID
   </td>
   <td>yes
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



# Verifying requests

The **wallet** application has to** **verify the validity of incoming request JWTs as following:



*   Extract the JWT payload, and get the App ID
*   Make sure the JWT is not expired
*   Retrieve App information from the DApp sidechain, from the App ID: App name (use it for display), Developer information (for display), callback url and app public key.
*   (If the JWT is signed:) Use the public key to verify that the JWT was signed using the right keypair.
*   Make sure that the callback url in the JWT matches whitelisted URLs from the DApp sidechain (those whitelisted urls have been registered by the developer when creating his app ID).
*   Display information such as app name and developer name inside the wallet, while requesting user action.
*   **With this procedure, we make sure that we will send private user information, such as credentials, to an authorized callback url.**


# Verifying responses

The receiving server back-end, or client mobile application, has to verify the validity of incoming response JWTs as following:



*   All responses are signed by a user DID by the wallet app
*   Extract the JWT payload, and get the App ID
*   Make sure the JWT is not expired
*   Retrieve user’s public key from the DID sidechain, using the did provided in the JWT
*   Use the public key to verify that the response is valid
*   (Optional:) If user identity is already known, check that user listed in the response is the signed in user
*   **With this procedure, we make sure that the response is sent by the right user.**


# Access Credentials Command

Used to request user related information first name, email address, phone number, diploma, certifications, accomplishments, or anything else related to the user.

Typically used for sign users up or in when first launching an application, or to prove facts (ex: user belongs to a university).

Those credentials have been attached as verified credentials on user’s DID, by third party issuers.


## Endpoint

**/credaccess/**


## Implementer

Theoretically implemented by the user identity management app (DID App)


## Request parameters

The following parameters could or should be part of the JWT structure:


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
   <td>DID
   </td>
  </tr>
</table>



## Claims format

**"claims"**: {

       	**"CLAIM_NAME"**: true, // default parameters: required: true, no reason, no specific iss requirement

	// or

	**"CLAIM_NAME"**: {

		**"required"**: true | false, // If a required field cannot be provided, the request will fail

		**"reason"**: "Reason displayed to user", // Optional

                	**"Iss"**: {	 // Requirements about the credential issue (ex: if we want to target a specific organization)

			**"did"**:"issuer_did" // Credential must have been issued by this specific DID

                	}

      	}

}


## Request example

[https://scheme.elastos.org/credaccess/[JWT](https://scheme.elastos.org/credaccess/[JWT)]

**JWT Payload**:

{


    **"appid"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",


    **"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"redirecturl"**:"myapp://elastosschemeresponse",


     **"claims"**: {

       		**"email"**: true,

		**"diploma"**: {

			**"required"**: false,

			**"reason"**: "If provided, will be shown to end user",

			// or

			**"reason"**:  [ {

				**"lang"**:"en|fr|zh|etc",

				**"value"**:"Language specific reason",

                		} ],

                		**"Iss"**: {

				**"did"**:"did:elastos:my_university_did"

                	}

      		}

}

}


## Response parameters


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



## Response example

JWT Payload:

{

**"type"**:”credaccess",

**"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",

**"aud"**:"did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"req"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",

**"presentation"**:[PRESENTATION_CONTENT]

}

Presentation content:

{

  **"@context"**: [

    "https://www.w3.org/2018/credentials/v1",

    "https://www.w3.org/2018/credentials/examples/v1"

  ],

  **"type"**: "VerifiablePresentation",

  **"verifiableCredential"**: [{

    **"@context"**: [

      "https://www.w3.org/2018/credentials/v1",

      "https://www.w3.org/2018/credentials/examples/v1"

    ],

    **"id"**: "http://example.edu/credentials/1872",

    **"type"**: ["VerifiableCredential", "AlumniCredential"],

    **"issuer"**: "https://example.edu/issuers/565049",

    **"issuanceDate"**: "2010-01-01T19:73:24Z",

    **"credentialSubject"**: {

      **"id"**: "did:example:ebfeb1f712ebc6f1c276e12ec21",

      **"alumniOf"**: {

        **"id"**: "did:example:c276e12ec21ebfeb1f712ebc6f1",

        **"name"**: [{

          **"value"**: "Example University",

          **"lang"**: "en"

        }, {

          **"value"**: "Exemple d'Université",

          **"lang"**: "fr"

        }]

      }

    },

    **"proof"**: { // Optional. Only for credentials that can be verified (not self issued)

      **"type"**: "RsaSignature2018",

      **"created"**: "2017-06-18T21:19:10Z",

      **"proofPurpose"**: "assertionMethod",

      **"verificationMethod"**: "https://example.edu/issuers/keys/1",

      **"jws"**: "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X

        sITJX1CxPCT8yAV-TVkIEq_PbChOMqsLfRoPsnsgw5WEuts01mq-pQy7UJiN5mgRxD-WUc

        X16dUEMGlv50aqzpqh4Qktb3rk-BuQy72IFLOqV0G_zS245-kronKb78cPN25DGlcTwLtj

        PAYuNzVBAh4vGHSrQyHUdBBPM"

    }

  }]

}


## Claim Taxonomy

The elastos scheme is agnostic to different claim types. This allows you to plug in your own taxonomy of claims or use an existing taxonomy that works in your industry.

If you don't need to follow a specific taxonomy of claims, we recommend that you find suitable claim types within [Schema.org](http://schema.org/).


## Required in-app features

The implementing DID application must provide the following features regarding user identity management, in order to correctly fulfil scheme requests:



*   As no user identity exists at first, the wallet app must provide a way to create a new identity with default credentials (name, etc) or import one.
*   Clearly show to the user who is the requester, why there is such a request.
*   Provide a way to the user to choose which optional claims are sent or not.
*   Clearly show the user which mandatory claims are going to be provided to the requester.


# Issue Credential Command

Requests the user to accept or reject a credential issued by an issuer (ex: a university issues a diploma for this user) before permanently attaching this credential to user’s DID in a storage (ex: DID sidechain). This is necessary to make sure malicious issuers don’t try to attach false or misleading information to a user identity.


## Endpoint

**/credissue/**


## Implementer

Theoretically implemented by the user identity management app (DID App)


## Request parameters

The following parameters could or should be part of the JWT structure:


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
   <td>issuedcredentials
   </td>
   <td>Array of verifiable credentials as per the W3C specification
   </td>
   <td>yes
   </td>
   <td>W3C’s verifiable credential
   </td>
  </tr>
</table>



## Verifiable credentials format

{**"issuedcredentials"**: [{

  **"@context"**: [

    "https://www.w3.org/2018/credentials/v1",

    "https://www.w3.org/2018/credentials/examples/v1"

  ],

  **"id"**: "http://example.gov/credentials/3732",

  **"type"**: ["VerifiableCredential", "UniversityDegreeCredential"],

  **"issuer"**: "https://example.edu",

  **"issuanceDate"**: "2010-01-01T19:73:24Z",

  **"credentialSubject"**: {

    **"id"**: "did:example:ebfeb1f712ebc6f1c276e12ec21",

    **"degree"**: {

      **"type"**: "BachelorDegree",

      **"name"**: "Bachelor of Science and Arts"

    }

  },

  **"proof"**: {

    **"type"**: "RsaSignature2018",

    **"created"**: "2018-06-18T21:19:10Z",

    **"proofPurpose"**: "assertionMethod",

    **"verificationMethod"**: "https://example.com/jdoe/keys/1",

    **"jws"**: "eyJhbGciOiJQUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19

      ..DJBMvvFAIC00nSGB6Tn0XKbbF9XrsaJZREWvR2aONYTQQxnyXirtXnlewJMB

      Bn2h9hfcGZrvnC1b6PgWmukzFJ1IiH1dWgnDIS81BH-IxXnPkbuYDeySorc4

      QU9MJxdVkY5EL4HYbcIfwKj6X4LBQ2_ZHZIu1jdqLcRZqHcsDF5KKylKc1TH

      n5VRWy5WhYg_gBnyWny8E6Qkrze53MR7OuAmmNJ1m1nN8SxDrG6a08L78J0-

      Fbas5OjAQz3c17GY8mVuDPOBIOVjMEghBlgl3nOi1ysxbRGhHLEK4s0KKbeR

      ogZdgt1DkQxDFxxn41QWDw_mmMCjs9qxg0zcZzqEJw"

  }

}]

}


## Response parameters

No response is expected for this command.


# Access Wallet Info Command

Used to get user ELA address, ELA wallet amount, or other wallet related information. 


## Endpoint

**/walletaccess/**


## Implementer

Theoretically implemented by the wallet app


## Request parameters

The following parameters could or should be part of the JWT structure:


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



## Request field format

**"reqfields"**: [ {

       	**"FIELD_NAME"**: true, // default parameters: required: true, no reason

	// or

	**"FIELD_NAME"**: { // required: true

		**"reason"**: "Reason displayed to user", // Optional


    // or

		**"reason"**:  [ {

			**"lang"**:"en|fr|zh|etc",

			**"value"**:"Language specific reason",

           		} ]

      	}

} ]


## Standard fields


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



## Request example

[https://scheme.elastos.org/walletaccess/[JWT](https://scheme.elastos.org/walletaccess/[JWT)]

**JWT Payload**:

{


    **"appid"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",


    **"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"redirecturl"**:"myapp://elastosschemeresponse",


    **"reqfields"**: [ {

       		**"elaaddress"**: true,

		**"elaaddress"**: {

			**"reason"**: "If provided, will be shown to end user",

			// or

			**"reason"**:  [ {

				**"lang"**:"en|fr|zh|etc",

				**"value"**:"Language specific reason",

                		} ]

      		}

} ]

}


## Response parameters


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



## Response example

JWT Payload:

{

**"type"**:”walletaccess",

**"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",

**"aud"**:"did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"req"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",

**"walletinfo"**: [ {

       		**"elaaddress"**: “abcdef”

} ]

}


## Required in-app features

The implementing wallet application must provide the following features, in order to correctly fulfil scheme requests:



*   Clearly show to the user who is the requester, why there is such a request.
*   Provide a way to the user to choose one of his wallets.


# Pay Command

Used to send payments, usually from a user to another user, or from a user to a “shop” to purchase a good. This does not include specific transaction like paying fees to create a DID, run a smart contract, or vote for DPoS. This pay command should remain related to what end users are used to do with google play or apple pay.



*   ELA mainchain payment
*   ELAESC payment
*   ERC20 token payment

In case of ERC20 tokens, execution smart contract addresses are hardcoded by the implementing application, **not** passed as command parameter.


## Endpoint

**/pay/**


## Implementer

Theoretically implemented by the wallet management app (SPV Wallet App)


## Request parameters

The following parameters could or should be part of the JWT structure:


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
   <td>“ELA”,”ELAESC”,”TOK”, etc
   </td>
  </tr>
</table>



## Response parameters


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
</table>



## Request example

[https://scheme.elastos.org/pay/[JWT](https://scheme.elastos.org/pay/[JWT)]

JWT Payload:

{


    **"appid"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",


    **"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"redirecturl"**:"myapp://elastosschemeresponse",


     **"amount"**: "20.50",


     **"receiver"**: EfPaLGVqoBTCRtioLN5CFbExBVu7NsgFpX

}


## Response example

JWT Payload:

{

**"type"**:”pay",

**"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",

**"aud"**:"did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"req"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",

**"txid"**:"cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"

}


## Required in-app features

The implementing wallet application must provide the following features regarding payments, in order to correctly fulfil scheme requests:



*   Create or import one or more ELA wallets
*   Show wallets amount and transactions
*   Send and receive transactions
*   Show and and allow copy of wallets address
*   In case other tokens than ELA are not handled, that should at least be handled as an error and users should be informed about it


# ESC Transaction command

Transaction to execute an **ethereum sidechain smart contract**.


## Endpoint

**/esctransaction/**


## Implementer

Theoretically implemented by the wallet management app (SPV Wallet App)


## Request parameters

The following parameters could or should be part of the JWT structure:


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



## Response parameters


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
</table>



## Request example

[https://scheme.elastos.org/esctransaction/[JWT](https://scheme.elastos.org/esctransaction/[JWT)]

JWT Payload:

{


    **"appid"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",


    **"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"redirecturl"**:"myapp://elastosschemeresponse",


     **"amount"**: "20.50",


     **"receiver"**: EfPaLGVqoBTCRtioLN5CFbExBVu7NsgFpX,


     **"payload"**: [......]

}


## Response example

JWT Payload:

{

**"type"**:”esctransaction",

**"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",

**"aud"**:"did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"req"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",

**"txid"**:"cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"

}


## Required in-app features

The implementing wallet application must provide the following features, in order to correctly fulfil scheme requests:



*   Allow end user to customize the transaction fees (fast vs slow) but provide a default reasonable fee and hide the complexity to the end user. Fee customization should only be in an advanced menu.


# DID Transaction Command

Used to record a given DID request(ex: including updated DID document given by the DID app) to the DID sidechain.


## Endpoint

**/didtransaction/**


## Implementer

Theoretically implemented by the wallet management app (SPV Wallet App)


## Request parameters

The following parameters could or should be part of the JWT structure:


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



## Response parameters


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
</table>



## Request example

[https://scheme.elastos.org/didtransaction/[JWT](https://scheme.elastos.org/didtransaction/[JWT)]

JWT Payload:

{


    **"appid"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",


    **"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"redirecturl"**:"mydidapp://elastosschemeresponse",


    **"didrequest"**: {


      **"header"**:{


        **"specification"**:"elastos/did/1.0",


        **"operation"**:"create"


      },


    **"payload"**:"eyJpZCI6ImRpZDplbGFzdG9zOmlZY3A3SkRCenhTZnFlcVV0VlQ1TG5yZ1dvNDhpUVV0Q2oiLCJwdWJsaWNLZXkiOlt7ImlkIjoiI3ByaW1hcnkiLCJwdWJsaWNLZXlCYXNlNTgiOiJ6bkduc042N3BFUXBwQ3FIS2t4TDJuNzV4MnlqSmNtcllrbW1MdnNoNGZSQSJ9XSwiYXV0aGVudGljYXRpb24iOlsiI3ByaW1hcnkiXSwiZXhwaXJlcyI6IjIwMjQtMTEtMTJUMTM6MDA6MDBaIn0",


    **"proof"**:{


        **"verificationMethod"**:"#primary",


        **"signature"**:"h3PQyLMVR+vWXF6jPGmHSXDD/3QwjtBy17aqZ9DErL+2xNUE9s1NdSQ5jpBUAqXrG/8nGkBDVDYTHixV2uvBSw=="


      }


               }

}


## Response example

JWT Payload:

{

**"type"**:”didtransaction",

**"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",

**"aud"**:"did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"req"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",

**"txid"**:"cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"

}


## Required in-app features

The implementing wallet application may just confirm with user that he agrees to pay some fees to record information about his identity on the mainchain.


# DPoS Vote Transaction Command

Used to record a user vote to the mainchain.


## Endpoint

**/dposvotetransaction/**


## Implementer

Theoretically implemented by the wallet management app (SPV Wallet App).

In Trinity, the whole voting process is managed by a separate DApp, not by the wallet. But the final transaction that contains votes has to be written on the mainchain, using user’s ELA keys, so this has to be handled by the wallet application.


## Request parameters

The following parameters could or should be part of the JWT structure:


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



## Response parameters


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
   </td>
  </tr>
</table>



## Request example

[https://scheme.elastos.org/dposvotetransaction/[JWT](https://scheme.elastos.org/dposvotetransaction/[JWT)]

JWT Payload:

{


    **"appid"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",


    **"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"redirecturl"**:"mydidapp://elastosschemeresponse",


    ** "publickeys"**: [“abcd”,”defg”,”hijk”]

}


## Response example

JWT Payload:

{

**"type"**:”dpostransaction",

**"iss"**:"did:ela:iUQtoHoQx8zgxRcLx6FxLKE4eYJiEz8nzC",

**"aud"**:"did:ela:e02e05a2e7dc29a5f2a5882c509a56CeYJ",


    **"iat"**:1566352213,


    **"exp"**:1566382213,


    **"req"**: "440645e21aabd6820110f3dc2449e02e05a2e7dc29a5f2a5882c509a566fd7f2aa4d0bd2bca040a2f3a7dc8b8dc2ec14a98688b28602f6a2efb3f0513ef04ac4",

**"txid"**:"cLx02f6a26FxLKE4eYJiEz8n9e02e05zC"

}


## Required in-app features

The implementing wallet application may just confirm with user that he agrees to pay some fees to record vote information on the mainchain. It could also display the number of nodes user if going to vote for.


# Register as a CR member Command


## Endpoint

**/crmemberregister/**


## Implementer

Theoretically implemented by the voting application


## Request parameters

The following parameters could or should be part of the JWT structure:


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
   <td>sub
   </td>
   <td>DID of the user that has to be registered as a proposed candidate for the CR voting process
   </td>
   <td>yes
   </td>
   <td>DID
   </td>
  </tr>
  <tr>
   <td>name
   </td>
   <td>Name of the candidate
   </td>
   <td>To be clarified by the voting procedure
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>email
   </td>
   <td>Email address of the candidate
   </td>
   <td>To be clarified by the voting procedure
   </td>
   <td>Email
   </td>
  </tr>
  <tr>
   <td>Other custom vote related info TBD
   </td>
   <td>Any other kind of fields the voting system may require. To be defined later
   </td>
   <td>To be clarified by the voting procedure
   </td>
   <td>
   </td>
  </tr>
</table>



## Response parameters


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
</table>



# Vote for CR members Command

Allows a user to vote for one or more


## Endpoint

**/crmembervote/**


## Implementer

Theoretically implemented by the ELA wallet application


## Request parameters

The following parameters could or should be part of the JWT structure:


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
   <td>sub
   </td>
   <td>DID of the user that has to be registered as a proposed candidate for the CR voting process
   </td>
   <td>yes
   </td>
   <td>DID
   </td>
  </tr>
  <tr>
   <td>name
   </td>
   <td>Name of the candidate
   </td>
   <td>To be clarified by the voting procedure
   </td>
   <td>String
   </td>
  </tr>
  <tr>
   <td>email
   </td>
   <td>Email address of the candidate
   </td>
   <td>To be clarified by the voting procedure
   </td>
   <td>Email
   </td>
  </tr>
  <tr>
   <td>Other custom vote related info TBD
   </td>
   <td>Any other kind of fields the voting system may require. To be defined later
   </td>
   <td>To be clarified by the voting procedure
   </td>
   <td>
   </td>
  </tr>
</table>



## Response parameters


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
</table>



# Sign Data Command

Used to sign a document. Later on, anyone can check the signed result to make sure of the original data ownership.


## Endpoint

**/sign/**


## Implementer

Theoretically implemented by the DID application


## Request parameters

The following parameters could or should be part of the JWT structure:


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



## Response parameters


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



# Custom scheme commands

Besides standard command listed above, the same scheme can be extended to exchange custom requests and responses among elastos apps.

Examples: 



*   Open a red packet
*   Install a dapp

In such cases, it’s up to the application to decide:



*   If it wants to use JWT tokens or simple non encoded GET query parameters
*   Command names (**except reserved commands** for the standard scheme commands)

Custom command example:



*   https://scheme.elastos.org/redpacket/open?packetid=123&userid=345


# Standard credentials fields


# Creating a developer identity

Developers willing to use the Elastos scheme have to create a developer identity on the DID sidechain first (see developer portal for more information). After registration, they may get the following information at least:



*   Developer DID
*   Developer DID private key
*   Developer DID public key


# Registering application

Developers willing to use the Elastos scheme have to **register their application** on a specific Elastos service (see developer portal for more details). After registration, they may get the following information at least:



*   Application ID
*   Application private key
*   Application public key


# General implementation advice


## Inform of invalid settings

Every time a received request is invalid (missing field, invalid field, failed verification, unregistered app id or developer did, etc) the implementing wallet app must display a clear message with the error, no matter if the reader is an end user or a developer.


## QR code scanner

A QR code scanner must be available in the wallet application to let users scan codes. If the QR code is an elastos scheme request, it should be handled directly in the wallet app without exiting the app. If this is a regular url, the external browser should be opened. Other kind of QR codes may not be handled (up to the wallet app) and in such case, an error should be displayed to the user.


# Recommendations


## Build native helper libraries

In order to hide the complexity of building requests and responses, signing, verifying, and more, we need to provide native libraries for Elastos Scheme support.

**Platforms**: android java, ios swift, nodejs

**Features**:



*   Build requests (all command types) and responses.
*   Sign and verify JWTs
*   Send requests
*   Handle responses (mobile and server)
*   Generate QR codes (server)


## Create a Micro payments service

In order to bring a better user experience in apps and games, we need to provide a fast way to purchase something. This solution has to be analyzed but this could be a service like this:



*   The elastos wallet app offers user to create a micropayment wallet and transfers some ELA there.
*   This micropayment wallet could be a ethereum smart contract with a small amount of ELA, possible automatically recharged. This benefits users because of ethereum sidechain speed: a few seconds instead of at least 2 minutes (ELA mainchain).
*   User would then be able to purchase things quickly, keep maximum funds security on the main chain, and get fast transactions for small amounts with a low risk of piracy.


# Unhandled use cases



*   **Micro payments**: we may soon need a service to facilitate quick payments, for example to quickly purchase an in-game feature. We don’t want to wait several minutes to get mainchain confirmations for this. So we need something more usable in this case. And we will need a scheme command to initiate such payments. Not handled in the version of the specification.


# Detailed use cases


## Website authentication



*   Desktop website user clicks a “sign in with elastos button”.
*   Web back end generates a QR code with a **credentials** request, and displays it to the user, alonrs with 2 pictures “download on google play” and “download on itunes”..
*   First time experience (no elastos wallet app and no user DID):
    *   Case 1: user scans the QR code with a mobile app scanner (not the elastos wallet):
        *   The scheme.elastos.org url opens in the mobile app browser which gets redirected to google play because we are on an android phone.
        *   User downloads the elastos wallet app and runs it
        *   Wallet app creates a user ID at first launch with a few self signed information such as name and phone number.
    *   Case 2: user clicks “download on google play”:
        *   User asks to install the elastos wallet app to his mobile
        *   Mobile OS installs the app and user launches the wallet.
        *   Wallet app creates a user ID at first launch with a few self signed information such as name and phone number.
*   User scans the QR code with his elastos wallet app
*   The wallet app handles the credentials request and prompts the user to share his email address with the website.
*   The wallet app sends a response including a signed JWT with user’s credentials, to the website back-end
*   Website back-end verifies the JWT, informs its front-end and redirects user to his account page.
*   The JWT token is passed to all further http requests to secure web pages access.
*   When the JWT is expired, user has to sign in again.



<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Elastos-Scheme2.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Elastos-Scheme2.png "image_tooltip")



## Storing an encrypted file on hive



*   Store a private file on hive. File should be encrypted with a key derived from user’s did. What is the flow?


## Recording asset ownership



*   User wants to upload one of his music creations to the DMA platform so his ownership is proven forever.
*   User uploads his MP3 file in the DMA-based application. 
*   The DMA-based application sends a **sign** request to the wallet application.
*   The wallet application prompts user to pick an identity to sign his work.
*   The wallet application returns a response that includes a hash of the MP3 file, and the same hash signed using user’s DID private key.
*   The DMA platform stores the file on Hive, and records the hash and the signed hash on a specific assets blockchain. 


## Accepting a diploma credential issued by the university



<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Elastos-Scheme3.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Elastos-Scheme3.png "image_tooltip")



# Register as a potential CR member

Here is the flow to register any user as a proposed member to be a CR council member. Votes can then be cast on this registered entry.



<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Elastos-Scheme4.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Elastos-Scheme4.png "image_tooltip")



# Tips for this document


## Generate JSON syntax highlighting



*   Go to [http://hilite.me/](http://hilite.me/)
*   Language: JSON
*   Style: Autumn

<!-- Docs to Markdown version 1.0β19 -->
