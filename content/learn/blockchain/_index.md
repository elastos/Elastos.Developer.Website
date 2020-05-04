
+++
title = "Elastos Blockchain"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

{{< figure src="/learn/blockchain/elastosorg-blockchain.png" >}}

One of the highlights of the design is that it makes **use of a blend of mainchains and sidechains** to improve the computational ability of blockchain technology. The mainchain only executes simple transactions and payment transfers while **multiple sidechains** handle Decentralized ID solution to Apps, creating fungible and non-fungible tokens and also the execution of smart contracts compatible with popular blockchain platforms like Ethereum and NEO smart contracts. With this, structure scalability and security can be accomplished.

Similar to the Operating System on a mobile device, users need a trustworthy location to store important data. The Elastos blockchain works as this trust zone for the entire Network Operating System. The Elastos blockchain applies main chain and sidechain solutions to facilitate the smart economy and a healthy decentralized application environment. This means that every application can interact with multiple sidechains and use the services which only they require. This means an application can use ethereum sidechain to write smart contracts written in solidity or it can also use token sidechain to issue fungible and non-fungible tokens. If an application is large scale, an entire sidechain can also be dedicated to itself while other applications use other sidechains. **The Elastos blockchain provides built-in, complete, easy-to-use sidechain support**. They will also be customizable, allowing clients to pick a different consensus method depending on the use case.

For example, the mainchain employs a hybrid consensus of AuxPoW + DPoS where the blocks are packaged by merged miners while they're signed and verified by DPoS supernodes. The DID sidechain and the token sidechain employ PoW consensus while Ethereum sidechain employs DPoS consensus thereby leading to faster block time for itself. In other words, **each sidechain is independent of other sidechains** and can function independently while its **security is guaranteed by the merged miners** while transferring assets from one sidechain to another or from sidechain to mainchain or from mainchain to sidechain. In this way, the security is guaranteed by merged miners, scalibility is guaranteed by sidechains structure while the decentralization is guaranteed by the way the blockchain works. 

### ELA Mainchain Utility

The main chain acts as the mediator that is responsible for the main currency used in the entire Elastos ecosystem. As such, the security of the sidechains is also tied to how secure the Elastos main chain is. Elastos main chain is merged mined with BTC which means it has an enormous hash rate to secure the network and this same hashpower can be thought of as securing all the sidechains as well because of this very reason. In this way, the entire Elastos Ecosystem is secured by the hashpower of BTC. The trust is recursively passed on from the main chain to all of the sidechains. So, even if main chain has a block time of 2 minutes, a sidechain such as ETH sidechain can have a block time of 5-15 seconds and still be secured by the hashpower of BTC.

1. ELA on the main chain is used for peer to peer payments from one person to another
2. ELA is used to pay for any transaction fees incured during the peer to peer payments
3. ELA is used to register for a supernode that takes part in the DPoS consensus of the Elastos Blockchain
4. ELA is used to vote for different supernodes
5. ELA is used to vote for different CR council members that take part in the CR consensus of the Elastos Blockchain

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem link="/learn/blockchain/consensus" rightArrow="true" >}}
        <h5>Elastos Mainchain - Consensus Mechanism</h5>
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 2 >}}

#### Or Jump To:

{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem title="Sidechains" link="/learn/blockchain/sidechains" >}}
        
    {{< /heroitem >}}
    
    {{< heroitem title="Tokenomics of ELA" link="/learn/blockchain/tokenonmics" >}}
        
    {{< /heroitem >}}
    
    {{< heroitem title="Mainnet, Testnet" link="/learn/blockchain/testnet_mainnet" >}}
        
    {{< /heroitem >}}   
{{< /hero >}}
