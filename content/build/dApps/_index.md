
+++
title = "Browser dApps"
weight = 20
chapter = false
pre = ""
alwaysopen = true
draft = true
+++

#### **The first thing you need to know is what a dApp is**, if you come from a traditional development background a lot of these concepts may seem foreign and unintuitive.

**This is understandable, blockchain and decentralized applications (dApps) are a relatively new concept.**

For a quick review or if you're new to dApps, go to this tutorial to learn about dApps.

{{< hero >}}
    {{< heroitem title="What's a Decentralized App (dApp)?" link="/build/dapps/dapps_what" rightArrow="true">}}
        Click here if you need a deep dive into what a dApp is, and what are the pros and cons.
    {{< /heroitem >}}

    {{< heroitem title="Ethereum Overview" link="https://www.trufflesuite.com/tutorials/ethereum-overview" linkBlank="true" rightArrow="true">}}
        If you're new to Ethereum we also recommend you read this quick overview.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 1 >}}

### Overview of Elastos dApp Architecture

{{< figure src="/build/dapps/elastos_dapp_1.png" >}}

#### Elastos ETH Sidechain

This is the main blockchain you'll likely interact with, our Elastos ETH Sidechain is based on the Ethereum EVM,
but is a completely separate network.

Basically it is compatible with any Ethereum dApps or code, so all the tutorials and concepts from Ethereum applies to us as well.
This makes it easy to develop on the Elastos platform.

{{< spacer 1 >}}

#### Elastos Hive

Our Elastos Hive technology is an intermediate layer that lets you use different storage solutions from traditional
centralized services like Microsoft OneDrive, Amazon Web Services S3 or decentralized solutions like IPFS.

Currently the only interface/SDKs are in Java/Swift because of elastOS support, however we will be releasing a
Javascript SDK soon for Browser dApps.

{{< spacer 1 >}}

#### Elastos DID Sidechain

The DID in Elastos DID Sidechain stands for **"Decentralized Identifiers"**, this is a global standard for identities
and credentials by W3C, you an read more at <a href="https://w3c.github.io/did-core/" target="_blank" onclick="event.stopPropagation();">https://w3c.github.io/did-core</a>.

This is basically Elastos' version of user accounts, for users their DID is their profile/identity which they use to
access all Elastos applications and services.

{{< spacer 1 >}}

### Ready to Get Started?

{{< hero >}}
    {{< heroitem title="First Let's Setup the Dev Environment" link="/build/dapps/env_setup" rightArrow="true">}}
        Click here to get started on how to setup your dev environment from scratch.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 5 >}}

 <!--
##### **elastOS** is convenient because it:

- Enforces a set of security principles to **better protect user's data and privacy**

- Promotes using decentralized services over centralized ones

- Offers a standardized plugin architecture and tools to make development easier

##### But it does have its restrictions, namely:

- All external data requests/connections must be whitelisted and approved by users

- All capsules/dApps must be written using the Ionic Framework

- Users need to download the elastOS app first and your dApp exists within another app

##### What if you only want to use some components of Elastos?

#### {{< rawhtml >}}<u>By all means we would love that!</u>{{< /rawhtml >}}

Elastos is non-profit and its ecosystem is an open-source platform developed for the public with a common goal to
create a better digital economy and world.

### Feel free to explore the Elastos ecosystem and figure out what works for you:

{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem title="Elastos Core Services" link="/services/" colspan="6" >}}
     A set of useful decentralized services for dApps, including <b>storage, payment, P2P and identity solutions.</b>
    {{< /heroitem >}}

    {{< heroitem title="Elastos ETH Sidechain" link="https://elaeth.io" linkBlank="true" colspan="6" rightArrow="true">}}
     This Elastos EVM-compatible combines the security of Bitcoin merge-mining with Ethereum's Solidity smart
     contracts. <b>Click here to learn how to connect and use it just as you would with Ethereum.</b>
    {{< /heroitem >}}

    {{< heroitem title="elajs [ALPHA]" link="/discover/tools/elajs" linkBlank="true" colspan="6" >}}
     A pre-built decentralized storage smart contract and Javascript SDK to get started on Elastos.
    {{< /heroitem >}}

 {{< /hero >}}
-->

{{< spacer 5 >}}
