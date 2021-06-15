
+++
title = "Verifiable DID Structure"
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++

#### 1. Structure of a Verifiable DID Document

Elastos stores DID data on a publicly always available blockchain which is its DID Sidechain. 

**A DID is represented as a DID Document, which is saved to the blockchain.**

##### Here we have Alice's DID Document showing her public name and DID: `did:elastos:ibweLVLmG...` 

```json
{
  "id": "did:elastos:ibweLVLmG......wX5Xob",
  "publicKey": [
    {
      "id": "#primary",
      "publicKeyBase58": "zma16hi......5YYXNY"
    }
  ],
  "authentication": [
    "#primary"
  ],
  // these verifiable credentials are public and are optional
  "verifiableCredential": [
    {
      "id": "#name",
      "type": [
        "BasicProfileCredential",
        "SelfProclaimedCredential"
      ],
      "issuanceDate": "2020-01-21T11:41:34Z",
      "expirationDate": "2020-02-05T11:41:34Z",
      "credentialSubject": {
        "name": "Alice"
      },
      "proof": {
        "verificationMethod": "#primary",
        "signature": "vcc_QC7ocBJk13KhDuagm2......C7kJQLaiksrgLupZRmG1Bscgg"
      }
    }
  ],
  "expires": "2025-01-21T11:41:34Z",
  "proof": {
    "created": "2020-01-21T11:41:59Z",
    "signatureValue": "emjXAi1EH4bg5RF1QYEU10pmXEJM......raDWeiFAxGxzwUW_xUYhnVdi4rK_ug"
  }
}
```

##### The above DID is only signed by the DID Subject themselves.

However a `SelfProclaimedCredential` by itself is difficult to trust, we need a **"trust substrate"**, which is a 
system that all parties trust, typically this is the society and its governments and businesses that provide
third-party identity verification (KYC).

#### _In our case we take the easy way out and assume to trust company **"V"**._

{{< spacer 1 >}}

In future we can build autonomous roots of trust, a good treatment is here https://arxiv.org/abs/1907.02143 but for now
as the world transitions we would still rely on a government entity or third-party KYC verifiers.

{{< spacer 1 >}}

##### Adding a Verifiable Credential to Support the Identity of a DID

What we need is a signed proof that Alice's DID is associated with some information relating to her (the subject).

In our case, we want a Verificable Credential signed by company **"V"** that verifies in person with existing identification that:

- Alice is who she says she is

- Alice's birth date matches her existing government documentation

- The provided digital photo match her likeness
    
- *Any other data Alice wants to submit for verification*

{{< notice todo >}}
    Under Development
{{< /notice >}}
    
{{< spacer 8 >}}
