+++
title = "ELA main chain"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

### Overview
The Elastos Blockchain is composed of main chain and sidechain structure. As such, main chain is one blockchain, DID sidechain is another blockchain, Token sidechain is another blockchain, ETH sidechain is another blockchain and NEO sidechain is another blockchain, etc. As such, each chain is only responsible for one specific purpose so in this way, the entire Elastos Blockchain can be easily horizontally scaled by supporting additional sidechains suited to additional needs. However, compared to all the sidechains of Elastos, the main chain serves one very important purpose that no other sidechain has and that is to protect the entire Elastos Blockchain network. When you want to use DID sidechain, you need to send ELA from main chain to DID sidechain and use the DID ELA to do your transactions there. When you want to run ETH smart contracts, you need to send ELA from main chain to ETH sidechain and use the ETH ELA as gas fees for your smart contracts. The opposite is equally as true. When you transfer ELA from main chain to any of the sidechains, the ELA is locked on the main chain while the same number of ELA(minus transaction fess) is unlocked on a sidechain. Once ELA is in one of the sidechains, you can only use that ELA on that specific sidechain. If you would like to trade ELA with other digital assets, you need to first send the ELA back from a sidechain back to the main chain and only then can you take those ELA out of the Elastos ecosystem. 

Because of this, the main chain acts as the mediator that is responsible for the main currency used in the entire Elastos ecosystem. As such, the security of the sidechains is also tied to how secure the Elastos main chain is. Elastos main chain is merged mined with BTC which means it has an enormous hash rate to secure the network and this same hashpower can be thought of as securing all the sidechains as well because of this very reason. In this way, the entire Elastos Ecosystem is secured by the hashpower of BTC. The trust is recursively passed on from the main chain to all of the sidechains. So, even if main chain has a block time of 2 minutes, a sidechain such as ETH sidechain can have a block time of 5-15 seconds and still be secured by the hashpower of BTC.

### Utilities of the Mainchain
1. ELA on the main chain is used for peer to peer payments from one person to another
2. ELA is used to pay for any transaction fees incured during the peer to peer payments
3. ELA is used to register for a supernode that takes part in the DPoS consensus of the Elastos Blockchain
4. ELA is used to vote for different supernodes
5. ELA is used to vote for different CR council members that take part in the CR consensus of the Elastos Blockchain
