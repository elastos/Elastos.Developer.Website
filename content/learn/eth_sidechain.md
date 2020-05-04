

+++
title = "Elastos ETH Sidechain"
date = 2020-05-04T01:15:40+02:00
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++


#### The Elastos ETH Sidechain serves to provide execution of smart contracts written in Solidity for the Elastos ecosystem. As the most ubiquitous smart contract language in the world, Solidity was chosen to maximize compatibility and improve the learning curve for blockchain developers wishing to build on Elastos.

Additionally, if there is an existing smart contract dApp that currently runs on Ethereum, it can be easily ported to run on Elastos as well. The Elastos ETH Sidechain uses a fully compatible Ethereum Virtual Machine (EVM) that can run identical smart contracts compiled for the Ethereum network on Elastos.

##### However, there are a pair of distinct advantages that the Elastos ETH Sidechain has over Ethereum:

1. **Elastos ETH Sidechain uses DPoS Consensus, which is much faster than PoW** and allows for an increased per block gas limit. Gas is a concept in Ethereum-based systems that acts as a unit of value to pay for computer operations; the same is used by Elastos. Since the miners do not have to do expensive PoW computations, it frees up resources to technically allow more transactions per block. Therefore, Elastos is able to increase its TPS for Ethereum transactions by many orders of magnitude.

2. **The Elastos ETH Sidechain uses gas fees will inherently be lower than Ethereum**

   There is a 1-to-1 exchange ratio between ELA and **ELAETHSC**, which is the equivalent of ETH for the Elastos ETH Sidechain and registered at https://chainid.network with **EVM chainIds 20 and 21**. Because the Elastos ETH Sidechain uses DPoS and PBFT, only the Elastos Supernodes that participate need to be incentivized to run the Ethereum process. Therefore the total rewards for DPoS participation can be a minimum fixed value and we can adjust the gas fees to maintain the rewards.
   
   In general as the cost of ELA increases we can decrease the gas fees to keep the DPoS rewards at roughly the same value. Also if the Elastos ETH Sidechain experiences more usage and volume, we can decrease the gas fees for the same reason, thus benefiting the users by spreading out the DPoS Supernode incentives across more transactions. The resulting dynamic is that usage costs for the Elastos ETH Sidechain will be consistently far lower than Ethereum currently is, and could become even lower as usage grows.
   
   By having a lower gas cost while retaining at least the same level security, developers can use smart contracts for more functions that were previously cost prohibitive. 
   
   Also, Elastos’ flexible sidechain architecture can potentially allow for more parallel sidechains if demand requires them. This means Elastos infrastructure could be expanded to have not one ETH sidechain but multiple ETH sidechains with similar or different functionalities or even different consensus mechanisms.


{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem link="https://elaeth.io" rightArrow="true" linkBlank="true" >}}
        <h5>You can access the Elastos ETH Sidechain now at www.elaeth.io</h5>
    {{< /heroitem >}}
{{< /hero >}}
