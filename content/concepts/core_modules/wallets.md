+++
title = "Wallets"
weight = 40
chapter = false
pre = "<i class='fa ela-page'></i>"
alwaysopen = false
+++

### Web Wallet at wallet.elastos.org
This was the first web wallet released by EF and to this date it remains the wallet that can be accessed from any web browser. People can continue to use the web wallet for sending, receiving, andstoring ELA. With that said, the web wallet will get fewer updates in the future as the new mobile wallet becomes the main focus going forward.

### Elephant wallet (for android and iOS)
This was released a couple of months ago and is a popular wallet because it can not only store ELA, but also BTC, ETH, ERC20 tokens, ioeX in the future, and eventually any other tokens generated via the Elastos token sidechain, Ethereum sidechain, and NEO sidechain. It also integrates DID and provides a set of APIs other developers can interact with. This means that in the future, an app like Hyper can integrate Elephant wallet into their app without actually building a wallet themselves. Instead, they talk to the Elephant API for wallet related interfaces so anytime someone wants to send, receive, or store ELA from a different app, they’re redirected to Elephant wallet where the actual transaction takes place. This is to make it easy for developers. This is the same with DID. Other apps can directly use Elephant wallet DIDs that users already have to integrate DID without having to implement their own complete DID login. Instead, from Elephant wallet, they scan the barcode on some other app and they can login to any other apps using Elephant app because they’re using their same DID from their Elephant wallet to login to other apps. An example of this would be the new developer portal that is being developed and maybe the CR DID login, too. In short, this wallet makes it easy for developers to integrate ELA and DID and other features of ELA easily.

### Elastos Wallet (for android and iOS)
This is the new official mobile wallet from Elastos Foundation for both android and iOS. This is also a type of SPV wallet so it’s decentralized and open source. Elastos Wallet uses backend infrastructure and its UI is consumer friendly and provides a wide array of features.  This wallet is the official wallet that is dedicated to only ELA. In the future, if there are any new features that are supported by the Elastos blockchain, this wallet will be the first one to receive updates. As an example, the supernode election has begun and this new wallet was the first to implement voting and registration features. Any other wallet is free to integrate supernode elections, but that’s up to its developers. As for Ledger and voting, maybe some community member can integrate supernode elections too whenever it’s available.

### Some things to note
- The Elephant wallet uses its own Elephant node to talk to the blockchain while the new Elastos Mobile Wallet is an SPV wallet. This means that when the mainnet is upgraded or goes into maintenance, Elephant wallet may not work until the upgrade of its node is complete while the new Elastos Mobile Wallet will continue to work because it's an SPV wallet so it connects to multiple nodes instead of just one
- Elephant Wallet has very different functionality compared to new Elastos Mobile Wallet because Elephant wallet will have the ability where devs can create H5 apps and can run inside it. So, it's more of an ecosystem wallet while Elastos Mobile Wallet is just for Elastos and nothing else

