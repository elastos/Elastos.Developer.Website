+++
title = "Cross-chain ELA Transfer"
date = 2020-05-10T21:15:40+02:00
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++

In order to utilize the Elastos ETH Sidechain on {{< rawspan fontweight="400" >}}mainnet{{< /rawspan >}} of course
you need to transfer ELA from the mainchain to the ETH sidechain.

There are a few ways to do this, but the most straightforward is using the `ela-cli` tool.

1. Use the `ela-cli` tool bundled with the mainchain ELA full-node repository, this CLI tool has cross-chain functions 
    you can use to send ELA to and from the ETH sidechain. 
    
2. `./ela-cli wallet buildtx crosschain --from [your address] --saddress XVbCTM7vqM1qHKsABSFH4xKN1qbp7ijpWf --to [your ELAETHSC address] --amount 5 --fee 0.001`
    
    Where --saddress is the crosschain genesis address found by getting the gensis hash (block 0) and then running `/ela-cli wallet crosschainaddr [genesis hash]`
    
3. Then sign and send this as usual.

    `./ela-cli wallet signtx --file to_be_signed.txn`
    
    `./ela-cli wallet sendtx --file ready_to_send.txn`


 


