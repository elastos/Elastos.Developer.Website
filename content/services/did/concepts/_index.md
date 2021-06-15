
+++
title = "Concept / Use cases"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

This is a light introduction to the unique **"decentralized identifiers" (DID)** that follows the W3C DID Specification: https://w3c.github.io/did-core.
This specification allows any platform to interoperate and use each others identity systems.

*Before we get to our example of a "Decentralized Proof of Age" system, let's start with the basics:*

##### Usually a DID has the following properties:

- It is tied to a unique physical real world entity, including inanimate objects but may also refer to abstract entities.

- DIDs alone are useless, they must be verifiable, which is they must have a way to prove they are tied to a certain entity.

- A key consideration is that users are still free to use a centralized whitelist of verifiers they trust, which is essential to
    allow DIDs to gain mass adoption, but does not match the ideals of decentralization.

    {{< rawspan fontweight="400" >}}Therefore initially a DID may not be as global as we hope, but over time we do hope some KYC providers gain
    international acceptance.{{< /rawspan >}}

    To do it properly we need an **Autonomic Identity System (AIS)** which can be further explored at: https://arxiv.org/abs/1907.02143

##### DIDs must be verifiable by anyone, anywhere and at anytime {{< rawspan fontweight="400" >}}(ambient verifiability){{< /rawspan >}}.

- A person or unique entity can have more than one DID, this is a realistic approach as people may want to have anonymous personas,
    or different personas for work, virtual worlds and more.

    Of course the most intuitive use of DIDs is for a global decentralized official identity that is recognized by
    multiple countries and goes beyond a passport with additional verifiable data such as credit worthiness, education,
    skills and security clearances.

- For a person, they should have full control over their identity and what they choose to share. This is related to the
    {{< rawspan fontweight="400" >}}self-sovereign identity (SSI){{< /rawspan >}} movement - https://sovrin.org/faq/what-is-self-sovereign-identity.

- You can find other design decisions by the W3C DID Working Group here: https://www.w3.org/TR/vc-data-model/#use-cases-and-requirements

### Use Case: Proof of Age at the Foo Bar

In this example we will introduce a simple use case where a person `Alice` wants to prove they are over a certain age
**"X"** to a bartender `Bob` who works at Foo Bar.

- Alice and Bob are strangers and do not need to trust each other.

- In this scenario we assume that both Alice and Bob have a mobile application on their phone that supports {{< rawspan fontweight="400" >}}DID verification and resolution.{{< /rawspan >}}

- Alice and Bob both live in a stable society and they both trust the verification service provided by company **"V"**.

- We make the strong assumption that both know the {{< rawspan fontweight="400" >}}public key and DID{{< /rawspan >}} of company **"V"** and
    they trust it.

- Alice only wants to share the minimal amount of personal information with Bob.

- For the purposes of this example her name is publicly published on her DID Document.

*This example is also an exercise in showing how we can improve on traditional photo IDs which can also be forged.*

##### Several things must happen here:

1. Alice doesn't want her digital identity photo or birth date on the public blockchain, so it must be stored in a secure private location.

    - Bob needs to be able to access this private identity photo and query a trusted source if her age is greater than **"X"**

    - Alice needs a way to permit Bob to access the identity photo data for the specific purpose the in person identity verification

2. Bob doesn't trust the mobile application on Alice's phone, since she could easily display "any" information on her phone.
    Therefore he will resolve data from one or more trustworthy decentralized data sources.

3. Bob expects to scan a QR code on Alice's phone which is a **Verifiable Presentation** that will allow his mobile app to
    retrieve the public name on her DID, her private photo identity and a verifiable claim that she is over **"X"** age.

### Key Actors and Diagram

In our example we use the basic actors: **issuer, subject, verifier**. For more info refer to: https://www.w3.org/TR/vc-data-model/#ecosystem-overview

{{< figure src="./did_1.png" >}}

### Bob Verifying Alice's DID and Age is greater than **"X"**

{{< figure src="./did_2.png" >}}

#### Some key things to help explain why this works:

 - Bob can hash the digital photo provided by Alice and verify it matches the signed hash provided by company <b>"V"</b>.

 - Bob can visually compare the same digital photo with Alice in person.

 - Company <b>"V"</b> can pre-emptively sign a "claim" that Alice is over a certain age.
    {{< rawspan fontweight="300" >}}Other possibilities are that she can simply share her birth date with a signed proof by company <b>"V"</b> or use
    a secure decentralized service that both trust to compute her age and return a boolean result.{{< /rawspan >}}

### Potential Improvements

- **Biometrics** - we can use more biometric data than an identity photo, which would be harder to impersonate.

    But this is a double-edged sword, it is virtually impossible to guarantee a nefarious verifier wouldn't save the biometric data
    they collect. {{< rawspan fontweight="400" >}}By default we should use the minimal amount of information to satisfy the verifier's request.{{< /rawspan >}}

- **Trusted Claim Verification** - there is a distinction between sharing your birth date and proving you are over a certain age.
    Ideally Bob and Alice can agree on a 3rd party verifier they both trust, Alice could expose a Verifiable Credential with
    her actual birth date to the 3rd party only, which would sign a Verifiable Presentation to Bob that Alice is over a certain age.

    *By doing this Alice doesn't need to share her full birth date with Bob.*

{{< hero >}}
    {{< heroitem link="/services/did_sidechain/tutorial" rightArrow="true" >}}
        <h5>Now Let's Put This Into Practice by Building It</h5>
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 8 >}}


