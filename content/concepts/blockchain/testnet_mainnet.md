+++
title = "Mainnet, Testnet, Privnet"
weight = 40
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++

### Types of Blockchain Networks
There are currently three types of networks that developers can interact with: Private Net, Testnet and Mainnet. Each one serves a very specific purpose and it is our hope that developers use the network suited for their purpose. Mainnet requires the use of real ELA that has to be purchased first so it involves real life assets. Testnet is the exact replica of what's available on mainnet with the difference being that there are far fewer blocks on testnet than on the mainnet but the code that runs on the mainnet also runs on testnet. Testnet is used by developers to quickly develop their apps interacting with the blockchain without the headache of setting any nodes themselves. Due to the nature of how testnet works, you can only request a limited number of ELA as the number of ELAs are limited on testnet. Private net is the most customizable of all three as it is also a testnet of sorts but it runs on the local machine of a developer. In other words, all the appropriate nodes are automatically setup in their own local computer which is completely isolated and doesn't require internet access once downloaded. This is great for someone who want to develop apps and customize it to the fullest to suit their needs.

Usually, this is how the flow works. If you're a developer and want to work with as much ELA as you want in your apps or want to customize the blockchain data to suit your needs, use private net. If you're a developer who wants to just connect to some nodes that are already up and running for testing purposes, use testnet. If you want to deploy your application to production, use mainnet.

Remember that if you would like to deploy your app on mainnet, it means one of two things:
1) You need to setup a local node that's connected to the mainnet while your app is connected to your local node for various services. This is a hybrid centralized-decentralized model. Any sort of service can be accessed using this method as all the services are exposed from your local node.
2) If you're using services that are available in the form of SPV services, you do not need to setup a local node as the SDK already connects to the already existing bootstrap nodes automatically. However, the services that are offered as part of SPV are very limited so there's not a lot of flexibility there. This is a 100% decentralized solution but this may not always be the best solution as decentralized solutions are usually slow and such is the case with these services. Some of the services that are available as part of SPV are creation of wallets and trading of digital assets.

### Mainnet services
- ELA Main chain
- DID Sidechain
- Token Sidechain
- Ethereum Sidechain
- NEO Sidechain

### Testnet services
- ELA Main chain
- DID Sidechain
- Token Sidechain
- Ethereum Sidechain
- NEO Sidechain

### Private net services
- ELA Main chain
- DID Sidechain
- Token Sidechain
- Ethereum Sidechain
- NEO Sidechain
- CRC Arbitrators
- ELA Main chain DPoS Supernodes
- Wallet Service
- Sidechain Service(includes DID, token, ethereum, etc)
- MISC API Service
