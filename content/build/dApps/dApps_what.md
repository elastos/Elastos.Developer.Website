+++
title = "What is a dApp?"
weight = 5
chapter = false
pre = ""
alwaysopen = false
+++

## A decentralized application - also called a dApp - has no **"central"** control. 

#### Or put in another way, once deployed even you as the developer should not have the ability to turn it off.

How is this possible? Firstly there is no back-end! If you've ever built a web app before typically you have a server
running PHP, NodeJS, Java or another popular back-end service. In the decentralized world however the blockchain 
replaces the server.

`This makes sense because if there was a hardcoded endpoint, then you'd be able to turn it off there.`

The key here is that the **blockchain is NOT owned by you**. If you write smart contracts and do not include admin functions
or roles, then those smart contracts will always run as they are written and nor can you request that the blockchain deletes
your smart contract.   

{{< spacer 1 >}}

### Basic Architecture of a dApp

{{< figure src="/build/dapps/dApps_1.png" >}}

#### The blockchain acts as both your server and potentially your database as well. 

**However storage on a blockchain is expensive, fortunately there is a solution called IPFS.**

#### What is IPFS?

**IPFS** stands for **Interplanetary File Storage**, this is a decentralized file storage solution where files are referenced
by their hash. To learn more about IPFS visit their website at <a href="https://ipfs.io/" target="_blank" onclick="event.stopPropagation();">https://ipfs.io</a>.
But basically the deterministic nature of the file reference works perfectly with the immutable properties of the blockchain.

{{< spacer 2 >}}

### Putting Everything Together

The blockchain is an immutable ledger, therefore data written to it will always be there. You can imagine it as a database 
where you can only append new data but never edit old data. **It can also handle logic through smart contracts, so in essence
it acts like an always "on" server.**

Which makes sense if you take a step back and think about it, if your server never had any risk of failure you could 
technically store all your data in memory or on disk. Nor would you need to worry about backups, well blockchain is backed up
by every node, **each full node holds the full history of the entire blockchain.**

This is also extremely expensive and inefficient though which you can imagine, that's also why storage is so expensive. 
In fact computations are also costly, therefore dApp development requires a new set of skills and awareness for computational
and storage costs.

#### Ok so now you know a bit about dApps, let's go back and build a simple dApp.

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem title="Back" link="/build/dapps" leftArrow="true" colspan="6">}}
        Click here to return to the dApps homepage and read more about the Elastos dApp architecture.
    {{< /heroitem >}}
{{< /hero >}}
