


+++
title = "Intro"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

This is a light introduction to the unique **"decentralized identifiers" (DID)** that follows the W3C DID Specification: https://w3c.github.io/did-core. 
This specification allows any platform to interoperate and use each others identity systems.

#### *Before we get to our example of a "Decentralized Proof of Age" system, let's start with the basics:*

{{< spacer 1 >}}

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

{{< notice note >}}
    Think of it like a {{< rawspan fontweight="400" >}}NFT (non-fungible token){{< /rawspan >}} that has a standard way 
    of describing the entity that it is tied to.
{{< /notice >}}

{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem link="/services/did_sidechain/use_case_example" rightArrow="true" >}}
        <h5>Typical Use Case - Example</h5> 
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 8 >}}
