+++
title = "Nucleus Console"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

### Learn Blockchain by Interacting
The console will effectively lower the barrier to entry for new developers entering the blockchain space as it will allow them to easily experiment with Elastos services directly on the browser before deciding to develop their decentralized applications.

### Vision
- **Integrated Playground**: Developers can directly write code on the browser and be able to test and execute their functions using various Elastos technologies.
- **Interactive Services**: Each service has a different page with full interactivity, documentation and samples of code in various languages that developers can easily “plug-and-play” into their own applications to quickly get started in integrating Elastos technology.
- **Elastos in a Box**: The goal is to make it very easy to deploy a private network for the entire Elastos infrastructure so other universities and third parties can also use the same image to deploy their own net.

### What is Nucleus Console?
Simply put, Nucleus Console is a website built using Django Python Web Framework that exposes various services and tools utilizing Elastos Infrastructure such as Elastos Mainchain, DID Sidechain, Token Sidechain, Ethereum Sidechain, NEO Sidechain, Elastos Hive and elastOS framework. This website is currently live at https://www.nucleusconsole.com, the code is completely open source and anyone can contribute to it by going to https://www.github.com/cyber-republic/elastos-nucleus. In order to run this website, you'll need to run the following first:
- Have Elastos Private Net running somewhere. You can find more info at https://www.github.com/cyber-republic/elastos-privnet
- Have Elastos Smartweb Service running somewhere. This is an API Service that is built using gRPC technology. You can find more info at https://www.github.com/cyber-republic/elastos-smartweb-service

### What is our goal?
Our initial goal is to aggregate all the different kinds of services that can be built using Elastos Infrastructure and expose them via client libraries in multiple languages such as Python, Golang, etc. Some of these services include but are not limited to:
1. Upload and Sign Service: This uses Elastos Hive IPFS and DID Sidechain to upload any kind of file to Elastos Hive encrypted and use DID Sidechain to sign the content of the message and store the IPFS Hash of the file on DID Sidechain for easy retrieval later
2. Verify and Show Service: This uses Elastos Hive IPFS and DID Sidechain to verify the signature that was used to sign the content via Upload and Sign Service using DID Sidechain and then decrypt the file from IPFS and show to the user
3. Create Wallet Service: This creates a wallet in Elastos mainchain and all the sidechains simultaneously with a single method
4. Request ELA Service: This is used to request some test ELA from GMUnet and testnet for Elastos mainchain address or any of the addresses on the sidechains
5. Deploy ETH Contract Service: This is used to deploy a smart contract code written in Solidity to ETH Sidechain and then store the contents of the smart contract on Elastos Hive
6. Watch ETH Contract Service: This is used to show details about a particular smart contract that was previously deployed to ETH Sidechain and then show the contents of the smart contract from Elastos Hive
And many more to come later

These services can be interacted with from a simple web interface from Elastos Console website and has sample code on how one can start utilizing the client libraries into their own applications. 

### What do we need help with?
We need help from every developer from Cyber Republic teams and projects to build on top of Elastos Smartweb Service and Elastos Nucleus so that we can have numerous services and tools on one website instead of spreading it too thin and have it be available on many many websites. The goal of the Nucleus Console is to aggregate all these different kinds of services that are available on one site. Some of the other applications and tools that can be integrated onto the Nucleus console are:
- elastOS Tools and Services: Services such as dApp Store dashboard, deploying an elastOS dApp via the Console, etc
- Blockchain Browser: Browser for mainchain and all the sidechains that can interact with different kinds of networks such as GMUnet, testnet and mainnet. For example, the ETH Sidechain Task Force can integrate their browser for ETH Sidechain onto the Nucleus Console so it's readily available for everyone to use
- Many more kinds of tools and applications are also possible
