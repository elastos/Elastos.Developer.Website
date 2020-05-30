
+++
title = "Typical Use Case"
weight = 15
chapter = false
pre = ""
alwaysopen = false
+++


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

{{< spacer 1 >}}

##### Several things must happen here:

1. Alice doesn't want her digital identity photo or birth date on the public blockchain, so it must be stored in a secure private location.

    - Bob needs to be able to access this private identity photo and query a trusted source if her age is greater than **"X"** 
    
    - Alice needs a way to permit Bob to access the identity photo data for the specific purpose the in person identity verification
    
2. Bob doesn't trust the mobile application on Alice's phone, since she could easily display "any" information on her phone. 
    Therefore he will resolve data from one or more trustworthy decentralized data sources.
    
3. Bob expects to scan a QR code on Alice's phone which is a **Verifiable Presentation** that will allow his mobile app to
    retrieve the public name on her DID, her private photo identity and a verifiable claim that she is over **"X"** age.

{{< spacer 1 >}}

### Key Actors and Diagram

In our example we use the basic actors: **issuer, subject, verifier**. For more info refer to: https://www.w3.org/TR/vc-data-model/#ecosystem-overview

{{< figure src="/services/did_sidechain/did_1.png" >}}

{{< spacer 1 >}}

### Bob Verifying Alice's DID and Age is greater than **"X"**

{{< figure src="/services/did_sidechain/did_2.png" >}}

#### Some key things to help explain why this works:
 
 - Bob can hash the digital photo provided by Alice and verify it matches the signed hash provided by company <b>"V"</b>.
 
 - Bob can visually compare the same digital photo with Alice in person.
 
 - Company <b>"V"</b> can pre-emptively sign a "claim" that Alice is over a certain age. 
    {{< rawspan fontweight="300" >}}Other possibilities are that she can simply share her birth date with a signed proof by company <b>"V"</b> or use 
    a secure decentralized service that both trust to compute her age and return a boolean result.{{< /rawspan >}}

{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem link="/services/did_sidechain/tutorial" rightArrow="true" >}}
        <h5>Now Let's Put This Into Practice by Building It</h5> 
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 8 >}}


