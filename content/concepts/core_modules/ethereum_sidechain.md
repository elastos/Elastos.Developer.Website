+++
title = "Ethereum Sidechain"
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

### Overview
Elastos employs a main chain and sidechain structure. As such, one of the sidechains that is deployed on the Elastos Blockchain network is an Ethereum sidechain. The Elastos Ethereum Sidechain is a fork of public Ethereum blockchain so all the functionalities that are available on the public ETH blockchain are also available on the Elastos ETH sidechain. 

The structure of the ethereum blockchain is very similar to bitcoin's in that it is a shared record of the entire transaction history. Every node on the network stores a copy of this history. The big difference with ethereum is taht its nodes store the most recent state of each smart contract in addition to all of the transactions. For each ethereum sidechain based application, the network needs to keep track of the 'state', or the current information of all of these applications, including each user's balance, all the smart contract code and where it's all stored. Contracts written in a smart contract-specific programming languages are compiled into 'bytecode', which the Ethereum Virtual Machine(EVM) can read and execute. All the nodes execute this contract using their EVMs.

### Utilities of ETH Sidechain
- Write smart contracts in Solidity or any contract programming language that can be compiled into 'bytecode' for the EVM
- Use ETH ELA to pay for all the gas fees for every single smart contracts running in the sidechain
- Create ERC20, ERC721 tokens
- Ethereum Sidechain is programmable unlike the Elastos main chain which means that developers can use it to build new kinds of applications using smart contract logic where the applications will always run as programmed
- SOme applications that can be built using Ethereum sidechain include cryptocurrency wallets, financial applications, decentralized markets, games, and much more

### Differences between Elastos ETH Sidechain and ETH blockchain
- ETH blockchain uses PoW and is currently in the process of switching to Proof of Stake(PoS) while the Elastos ETH sidechain uses DPoS
- ETH blockchain has a block time of 15 seconds while Elastos ETH sidechain may have a block time of 5-15 seconds
- As of August 9th, 2019, ETH blockchain has an average hash rate of 300,000 GH/s while Elastos ETH sidechain has an average hash rate of 40 EH/s(or 40,000,000,000 GH/s) which is roughly 133,333 times more hashpower than that of ETH blockchain. Even if it is rather difficult to compare two different consensus algorithms and their hash rate, this is especially noteworthy to developers should they decide to migrate to a more secure blockchain network
- Anything you can do on ETH blockchain, you can do on Elastos ETH sidechain with higher security, more security and it's also a lot more scalable
- Currently, there is ONE Elastos ETH sidechain that implements a DPoS consensus however, it is technically possible to spawn multiple Elastos ETH sidechains with different consensus algorithms should the need arise for such a scenario