+++
title = "Wallets"
weight = 50
chapter = false
pre = "<i class='fa ela-page'></i>"
alwaysopen = false
+++

Wallets in the Elastos ecosystem are used of course for financial transactions, but not only. They are also **users passeport for everything related to using personal signature/identification**. For example, a wallet app is needed to **authorize payments** from third party apps, but also to **authenticate** users, **give authorizations** to read or edit users profiles and credentials.

There are currently **3 official wallets** in the Elastos ecosystem. Their features and differences are described below:

### Web Wallet at wallet.elastos.org
This was the first web wallet released by EF and to this date it remains the wallet that can be accessed from any web browser. People can continue to use the web wallet for sending, receiving, and storing ELA. With that said, **the web wallet will get fewer updates in the future as the new mobile wallet becomes the main focus** going forward.

### Elephant wallet (for android and iOS)
This is a popular wallet because **it can not only store ELA**, but also BTC, ETH, ERC20 tokens, ioeX in the future, and eventually **any other token** generated via the Elastos token sidechain, Ethereum sidechain, and NEO sidechain. It also **integrates DID (authorization)** and provides a set of APIs other developers can interact with. Third party apps can make use of the Elephant wallet into their app without actually building a wallet themselves. Instead, they talk to the Elephant API for wallet related interfaces so anytime someone wants to send, receive, or store ELA from a different app, they’re redirected to Elephant wallet where the actual transaction takes place. This is the same with decentralized ID. Apps can **authenticate users** through Elephant wallet automatically. In short, this wallet makes it easy for developers to integrate ELA and DID and other features of ELA easily.

### Elastos wallet (for android and iOS)
This is the new official mobile wallet from Elastos Foundation for both android and iOS. This is also a type of SPV wallet so it’s decentralized and open source. Elastos Wallet uses backend infrastructure and its UI is user friendly and provides a wide array of features. This wallet is the official wallet that is dedicated to only ELA. In the future, if there are any new features that are supported by the Elastos blockchain, **this wallet will be the first one to receive updates**. As an example, when the supernode election begun, this new wallet was the first to implement voting and registration features. Any other wallet is free to integrate supernode elections, but that’s up to its developers. As for Ledger and voting, maybe some community member can integrate supernode elections too whenever it’s available.

### Comparing Elephant wallet and Elastos wallet
- The Elephant wallet uses its own Elephant node to talk to the blockchain while the new Elastos Mobile Wallet is an SPV wallet. This means that when the mainnet is upgraded or goes into maintenance, Elephant wallet may not work until the upgrade of its node is complete while the new Elastos Mobile Wallet will continue to work because it's an SPV wallet so it connects to multiple nodes instead of just one
- Elephant Wallet has very different functionality compared to new Elastos Mobile Wallet because Elephant wallet will have the ability where devs can create H5 apps and can run inside it. So, it's more of an ecosystem wallet while Elastos Mobile Wallet is just for Elastos and nothing else.
