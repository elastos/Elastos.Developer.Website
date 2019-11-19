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

### Specific Trinity intents

| Intent action | Description |
| ------------- | ----------- |
| /a/[appid] | Open a given DApp if installed, or open the DApp page on a DApp store to install it first. |
| registerapplicationprofile | Register user as using a given DApp, on his DID profile. |
| connectapplicationprofile | Launch the given DApp with the purpose of connecting to a given friend in that app, using his DID. |
