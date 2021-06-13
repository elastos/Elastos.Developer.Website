+++
title = "Ecosystem Architecture"
date = 2019-05-24T21:15:33+02:00
weight = 30
chapter = false
pre = ""
alwaysopen = true
+++

### Brief Summary

* Through the merged mining with Bitcoin, the safety and reliability are ensured by strong Bitcoin computing power through Proof of Work. This mining strategy saves resources and avoids repeated consumption.
* Because Elastos structure is built by having a main chain and sidechains, it avoids main chain being overloaded, and leads to easy routing and flexible extension, increasing the possibility for the Elastos to become basis for future internet applications.
* The blockchain is a trust zone and a reliable internet database. Smart contracts are merely the saving process of this reliable database. Only the valuable data that needs to be notarized is recorded on the blockchain; only the data processing that needs computation reliability requires smart contracts.
* Elastos infrastructure is an ecosystem where blockchain is one component. There are two other components: Elastos Carrier that is a decentralized peer to peer end to end encrypted communication protocol and Elastos Hive that is a decentralized storage platform that is based on IPFS(Inter Planetary File System)

### Smartweb OS
Elastos provides a complete ecosystem that acts sort of as an operating system that operates over the network - a network operating system of sorts. For storage, Apps can use local disk drive or cloud drive such as dropbox, google drive, or they can also choose to use Elastos Hive - a decentralized storage file system. All of these services are available and can be used over carrier. Carrier acts as a bus of this network operating system that does the relay of messages from one device to another in a peer to peer manner without going through any intermediate servers. In other words, Apps can talk to devices and to each other via an end-to-end encrypted decentralized friend-based communication protocol. And for CPU of this network operating system, different devices act as different cores of the operating system. For example, an android device or an ios device can be considered one core while windows or Amazon instance can be considered another core and a smart TV and routers can be consdered another core.
In this way, Elastos aims to build an operating system for the internet itself that is completely autonomous running without any third parties and goods are traded in a decentralized manner using carrier and blockchain for payments and such.

{{< figure src="../architecture_images/smartweb_os.png" >}}

### Blockchain as a Trust Zone
A blockchain is really a blockchain computer. The computation power is less than that of a single node because blockchain is based around the idea of duplicated computing in order to decentralize the ledger. It's still one ledger and no matter what, one ledger could never be decentralized. The peer to peer network of the blockchain is decentralized but it's merely an internal bus of this so called blockchain computer. Public blockchain builds trust and hence, that's the main purpose of the Elastos blockchain. The main chain builds trust, DID sidechain provides decentralized IDs and authentication services, Token sidechain provides token creation services while Ethereum and NEO sidechain provide a platform to write smart contract logic.

{{< figure src="../architecture_images/blockchain_trustzone.png" >}}

### Merged Mining

{{< figure src="../architecture_images/merged_mining.png" >}}

The Elastos blockchain utilizes merged mining with Bitcoin, the process by which consensus is reached on both chains simultaneously. In this case, the Bitcoin blockchain works as the parent blockchain to Elastos, with the Elastos chain as its auxiliary blockchain. The mining pools will deploy merged mining code and miners will submit proof of work to both blockchains at the same time. Energy consumption does not increase with merged mining, and will be equal to the energy consumed for mining either alone. Through this mechanism, the Elastos blockchain has an extremely strong guarantee of computing power and will then be able to provide blockchain innovations at a global scale. It makes full use of existing Bitcoin computing resources in addition to being environmentally friendly.

Elastos implements merged mining with Bitcoin. The strategy of merged mining saves resources and avoids repeated consumption. Miner submits Proof of Work(PoW) to both Bitcoin and Elastos and enjoys profits of mining competition without extra consumption of computing power. The consensus mechanism for Elastos is AuxPoW+DPoS where the mining reward distribution is 70% for AuxPoW + DPoS(miners + stakers) and 30% for Ecosystem Application Reward(aka Cyber Republic Fund). Tokens for apps built on Elastos can be published on sidechains. These tokens may participate in two-way asset transfer across the main chain and sidechains.

Additional benefits of merged mining include:

* The transfer of trust over multiple chains. The Elastos main chain is merged mined along with the Bitcoin main chain. This merged mining characteristic can be extended to Elastos sidechains as long as the sidechain adopts the same Proof of Work consensus. Thus, layers of chains can be merged mined recursively, which establishes a hierarchy of trust among chains.
* Isolated nodes. An auxiliary blockchain, or sidechain, dependent on merged mining does not need a consensus of multiple nodes. In the extreme case, one chain only needs one node and does not diminish the reliability of the ledger information on the main chain or other chains. No other blockchain consensus algorithm has this kind of advantage.

{{< figure src="../architecture_images/mainchain_sidechain.png" >}}
{{< figure src="../architecture_images/top_miners.png" >}}

### Overview of Main chain and Sidechains in the elastos ecosystem

One of the highlights of the design is that it makes use of a blend of mainchains and sidechains to improve the computational ability of blockchain technology. The mainchain only executes simple transactions and payment transfers while the sidechain handles smart contracts to support services and applications. With this, structure scalability and security can be accomplished.

Similar to the Operating System on a mobile device, users need a trustworthy location to store important data. The Elastos blockchain works as this trust zone for the entire network Operating System. The Elastos blockchain applies main and sidechain solutions to facilitate the smart economy and a healthy decentralized application environment. This means that every application can create individual sidechains. The Elastos blockchain provides built-in, complete, easy-to-use sidechain support. They will also be customizable, allowing clients to pick a different consensus method depending on the use case.

Any system built with blockchain technology has less computing power than a traditional computer, and so will not be able to meet the various requirements of internet applications (such as video games or streaming a high-definition movie). This is a fundamental reason why blockchains still cannot be applied on the internet at a large scale. The Elastos team recognizes this fact, and therefore believes that blockchain development should not rely solely on the main chain for computation. Elastos aims to scale their blockchain system by providing support for sidechains, which will help meet requirements for running applications with high IOPS(Input Output Operations Per Second). The Elastos main chain will be responsible for the small but very important role of trading and transferring ELA, thus providing stability to the blockchain system. Elastos wants to avoid bloating the main chain with unnecessary smart contracts. Instead, only major infrastructure upgrades will take place on the main chain. All other smart contracts can be implemented on sidechains, enabling scalability.

This kind of hierarchical and structured design philosophy will pave the way for a future blockchain paradigm, such as the aforementioned development from stand-alone computation to a distributed one. This is a key innovation in blockchain technology, and more important than the partial technology of singular consensus algorithms and chains. The team will implement basic services as sidechains for global and public use. These services include ID generation, token distribution, digital asset trading, and fast payment systems. These basic services, all important infrastructural components, are part of the Elastos Smart Web.

In addition, the team will also provide support for third-party sidechain development. Transactions are the most important part of the interface between the main and sidechains. The transaction procedure for sending tokens from the main chain to a sidechain is equivalent to sending from a user account on the main chain to a multi-signature address corresponding to the sidechain. The process automatically checks that the sidechain can identify the transaction and deposit the equivalent value of sidechain tokens to the sidechain account.

[Read Elastos Sidechain Whitepaper](https://www.elastos.org/wp-content/uploads/2018/White%20Papers/elastos_sidechain_whitepaper_v0.3.0.8_EN.pdf?_t=1526918471)

### Complete Elastos Framework
Elastos is composed of three different peer to peer or semi-decentralized networks - blockchain, carrier and hive. Each serves its own purpose in the ecosystem Elastos is building. Developers can either independently integrate individual component or service as part of their own application or work with framework layer services that provide richer functionalities. Different kinds of applications can be created using different parts of the Elastos infrastructure ecosystem.

{{< figure src="../architecture_images/complete_architecture.png" >}}
