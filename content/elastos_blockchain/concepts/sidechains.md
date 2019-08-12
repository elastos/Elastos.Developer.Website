+++
title = "Sidechains"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

### Sidechains and Scalability
Elastos offers a unique solution to the scalability problem in a far different way than other established projects in the space: it implements a main chain-sidechain architecture. Elastos uses blockchain only for its designated benefits: automated trust, authentication, and smart contract execution. For everything else, such as the transfer of data and information between apps or users which draws on Elastos Carrier’s decentralized peer-to-peer communication platform, and storage, which employs Elastos Hive’s decentralized storage network, the Elastos Ecosystem has a number of different instruments to ensure its network does not become congested.

Elastos implements a unique solution for its core blockchain technology called sidechains. Sidechains can be thought of as independent blockchains that have a very specific purpose, function independently of the main chain or other sidechains, and provide for a scalable solution for the decentralized applications of tomorrow. A sidechain is effectively a local road parallel to a highway.  Perhaps this local road has several more intersections, stop signs, and traffic moving in different directions. If these intersections and stop signs were put on the highway, things would inevitably slow to a full-blown traffic jam. By appending local roads parallel to the highway, it allows specific traffic to exit and arrive at desired locations at specific times, which keeps the grand highway of the main chain uncongested.

{{< figure src="../sidechains_images/mainchain_sidechain_architecture.png" >}}

### Elastos is not a world computer but rather a network of distributed world computers
The Elastos blockchain distinguishes itself from other projects in the space by simply refusing to take on the identity of a world computer. Rather, it is a global network of distributed world computers. Ethereum can be considered a world computer; NEO can be considered a world computer; EOS can be considered a world computer. Even most public blockchain platforms can be considered world computers. But, because Elastos has a unique structure composed of a main chain and related sidechains, the main chain is one world computer, the DID Sidechain is another world computer, the Token Sidechain is another world computer, and the Ethereum and NEO Sidechains are yet two more world computers. In such a distributed model, a network of global distributed world computers replaces a singular world computer whose resources are being overtaxed. So, while one world computer cannot solve all of the world’s problems, perhaps it can play a meaningful role within a distributed network of world computers where each sidechain handles one and only one objective.

{{< figure src="../sidechains_images/public_blockchain_v_elastos.png" >}}

### Types of Elastos Sidechains
1. **DID Sidechain**: This sidechain's sole function is to issue decentralized IDs to users, apps, and devices and to provide the capability to store data and information for each DID
2. **Token Sidechain**: This sidechain's sole function is to issue fungible and non-fungible tokens for projects and DApps
3. **Ethereum Sidechain**: This sidechain's sole function is to mimic the public Ethereum blockchain in running smart contracts written in Solidity, issuing ERC20 and ERC721 tokens to projects and other basic functions. Basically, anything a user or developer can do on the public Ethereum blockchain, they can aldo do using the Elastos Ethereum Sidechain
4. **NEO Sidechain**: This sidechain's sole function is to mimic the public NEO blockchain in running NEO smart contracts and all other basic functions of the public NEO blockchain.
5. **Elastos DApp Sidechain**: TBD
6. **Elastos Digital Assets Sidechain**: TBD

### Elastos sidechains scale horizontally and easily
If a blockchain platform is robust and more developers prefer it, it is quite simple to port that platform to Elastos as a brand new sidechain(eg. EOS sidechain, etc). This process is in the very spirit of decentralized open source projects.  

In the future, if there ever comes a time when an Ethereum DApp experiences a surge in popularity and receives an influx of users, data, and transactions, a single Ethereum Sidechain may not suffice. In that case, it is possible to create an additional Ethereum Sidechain and place the heavily trafficked DApp on that Sidechain.This process can be repeated to as many iterations as are necessary to support near-infinite DApps. With this, we could potentially see not one, not two, but perhaps five Ethereum Sidechains and five NEO Sidechains running concurrently on Elastos’ infrastructure. That is the power of the seminal architecture that Elastos has built.

{{< figure src="../sidechains_images/ethereum_sidechain_scalability_solution.png" >}}

### Flexible Consensus Mechanisms
It should be noted that a sidechain can only use Proof-of-Work(PoW) or Delegated-Proof-of-Stake(DPoS) at the moment. In the case where a sidechain uses PoW, it may merged-mined with Elastos, and thus with Bitcoin. Effectively, any sidechain of Elastos can leverage the unparalleled hashpower of the Bitcoin network and tap into the robust security it provides.

As of now, the DID Sidechain uses PoW and is presently being merged-mined with Elastos. Because decentralized IDs enable everyone to get an ID for themselves using the power of blockchain technology, the DID Sidechain must be uncompromising in its security, as it makes up the integrity of Elastos’ base infrastructure. For this reason, merged-mining does a great service to both the DID Sidechain and the Elastos ecosystem at large. In the case where a sidechain uses DPoS, it can utilize the pre-established DPoS supernodes of the Elastos main chain to run the DPoS consensus for its sidechain, thereby achieving a faster block time and superior TPS. While the public Ethereum blockchain uses PoW and is currently in the process of switching to Proof-of-Stake (PoS), the Elastos platform’s Ethereum Sidechain uses DPoS. Essentially, the consensus mechanism for any sidechain can be changed at any time. Because the NEO Sidechain uses PoW, developers can choose to write NEO smart contracts, which draw on PoW and share the hashpower of the Bitcoin network. Likewise, they can opt for Ethereum smart contracts, as the Ethereum Sidechain’s DPoS has a block time of around 5 seconds. Such versatility and flexibility make the Elastos infrastructure appealing to and powerful for developers and users alike. In the future, if having a DPoS consensus on the NEO Sidechain is desirable, developers can easily make the switch from PoW to DPoS.

{{< figure src="../sidechains_images/sidechains_consensus_types.png" >}}

### Beyond Sidechain Architecture
Sidechains aside, there are other elements of the Elastos infrastructure which serve to address the problem of scalability. On Elastos, applications need not interact with blockchains for every transaction or data exchange. Due to its lack of speed resulting from necessary consensus, the blockchain should not be used in each and every network transaction and data exchange. Elastos uses two additional instruments that make its infrastructure more scalable:
1. Elastos Carrier: A decentralized peer-to-peer network that takes over all network traffic on the Elastos ecosystem. Carrier essentially allows users, devices, and apps to talk to each other without going through any centralized servers.
2. Elastos Hive: A decentralized and distributed file storage system that saves data for users and apps in a secure manner without relying on any centralized servers.

For autonomous trust, authentication, and smart contract execution, payments processing, and achieving consensus, blockchain and sidechains are utilized. Whereas for daily communications relaying data from one point to another and storing data, other components of Elastos such as Carrier and Hive are utilized. In effect, there are multiple types of peer-to-peer networks that are drawn on to facilitate various processes in the Elastos ecosystem. In that way, Elastos’ truest identity is a massive network of distributed computers working synergistically to solve the core problems of the traditional internet infrastructure.

{{< figure src="../sidechains_images/elastos_three_networks.png" >}}