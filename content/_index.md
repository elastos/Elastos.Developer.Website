+++
title = "Home"
date = 2019-05-24T21:15:40+02:00
weight = 5
chapter = false
pre = ""
alwaysopen = false
+++

# Elastos documentation

{{< youtube vaJ5Pguxd4M  >}}

Welcome! You are probably here because you heard about Elastos and want to know what this is about, or you already know Elastos and you're looking for more advanced answers or APIs.

Here is where you can start:

## Discover

Just arrived? Not sure what Elastos is yet? Make sure to read {{< internallink "what is Elastos?" "discover_elastos/what_is_elastos/_index.md" >}} to get some background.

## Start with Elastos

* App developer
    * {{< internallink "Setup Elastos core services" "elastos_core_services/setup/_index.md" >}} first, then try a few {{< internallink "samples" "elastos_core_services/samples/_index.md">}} and start reading our {{< internallink "core services guides" "elastos_core_services/guides/_index.md" >}}.
* Miner
    * {{< internallink "Mine ELA" "elastos_blockchain/connect_to_elastos/mine_and_secure/merged_mining.md" >}}
    * {{< internallink "Run your own supernode" "elastos_blockchain/connect_to_elastos/mine_and_secure/supernode.md" >}}
* Crypto exchange
    * {{< internallink "Connect to the ELA main chain" "elastos_blockchain/connect_to_elastos/exchanges/_index.md" >}}

## Contribute
So you love Elastos and would like to bring your best skills to make it even better? Here is how to {{< internallink "contribute to the platform" "contribute/_index.md" >}}  with hundreds of other great developers.

## Modules status

Elastos is being actively developed. You may wonder what you can actually do yet with each module. Here is a brief list (not exhaustive):

(**Updated**: 2019-08-15)

### Blockchains

| Module | Status |
| ------ | ------ |
| ELA mainchain | Fully operational. Used directly by wallet apps or low level projects, but not by application developers. |
| DID sidechain | Rework in progress to match W3C specifications on DID and verifiable credentials. |
| Ethereum sidechain | Available on testnet/mainnet, but can only be used by a small list of early testers (ex: DMA). RPC API only for now, not helper library. |
| Token sidechain | Almost ready on testnet and mainnet. RPC API available. |

### Core services

| Module | Status |
| ------ | ------ |
| Hive | Available for C++, android, ios, trinity. Ability to write and read files on both IPFS and Onedrive. Developments on going. |
| Carrier | Available and rather stable for C++, android, ios, trinity. |
| Elastos scheme | Not available yet. The Elephant wallet currently provides a scheme that can temporarily be used for tests, but this is not the final scheme. |
| Trinity | DApps can run in sandboxed processes. Deployment and debug tools under construction. Android and iOS. Not published on app stores yet. Hive and carrier plugins available. |

### Solutions

| Module | Status |
| ------ | ------ |
| DMA | Alpha version available for a small set of developers. Demo apps Choosit and Uptick available. |
