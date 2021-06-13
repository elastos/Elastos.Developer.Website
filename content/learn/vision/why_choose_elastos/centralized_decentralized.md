+++
title = "Centralized vs Decentralized"
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++

### Differences between centralized and decentralized apps
The difference between a centralized and a decentralized app is that a decentralized app, once deployed, cannot be shut down by anyone. If we use this definition, there is not a single application out there today that can considered to be truly decentralized. Ethereum claims to be a dApp(Decentralized App) platform but if we apply the earlier definition to any of the Ethereum apps, they cannot be considered fully decentrlized because of the mere fact that the backend logic and the actual server running these apps(that run on mobile devices or web browser) are controlled by a third party. So, if that said third party were to ever go out of business, even if the corresponding smart contract exists on the ethereum blockchain(which cannot be tampered with), the app on the mobile device, or the browser would not work anymore. So, if that's the case, can there truly be 100% decentralized applications? 

An example of a centralized app is Facebook app while an example of a partially decentralized, partially centralized app is Cryptokitties where the logic of the app is coded in the form of smart contracts in the Ethereum blockchain while the running of the apps is being done in a centralized server that is owned by the Cryptokitties authors/developers. An example of a decentralized app is an app that is built for elastOS Browser(Trinity). Such an app has the following features:
1) App can only be run inside Elastos Browser so it cannot access the internet directly. Even http/https(basic protocols) are disabled. Instead, elastOS Browser uses Elastos Carrier for any and all communication which is considered to be a decentralized communication network that relays data from one node to another without going through any intermediaries
2) App is deployed directly on the Elastos Blockchain(more specifically, the digital assets sidechain - which has yet to be created). The metadata of the app is stored on this sidechain while the actual data for the app is stored on Hive(which is a decentralized storage network). So, using this method, even the content of the app and the deployment service are done in a completely decentralized manner
3) Once App is deployed using elastOS toolchain and put on the blockchain, anyone can download that app onto any device and access it from anywhere in the world. The app will keep on working as long as the blockchain itself and carrier itself and hive itself keeps on working. And since the elastos blockchain, carrier and hive are decentralized by nature, they will theoretically keep on running forever

### Should you go 100% decentralized?
Short answer: Only if it makes sense for you and your users of the app you're building and if you're willing to sacrifice some speed in favor of more decentralization

Long answer: Centralized apps will always be superior to decentralized apps when it comes to speed. That is something you need to accept when trying to build a decentralized application. Maybe a compromise is to build a partially centralized, partially decentralized application so the user experience is not sacrificed as that is the most important part of any application. 

### How to choose between using blockchain, carrier and hive
- If you want to implement a secure payment system, authentication system, or implementing smart contracts for your autonomously running apps, choose blockchain and use the blockchain SDKs that are available
- If you want to build secure chat apps, or any apps that requires the transfer of data from one node to another, or for IoT related devices and apps, choose carrier and use the carrier SDKs that are available
- If you want to store big data, or user data or app data in a decentralized manner, choose Hive
- You can also choose to combine any of these 3 components or use all 3 to make sophisticated real world applications that utilize the entire Elastos infrastructure

### Should you choose to do everything on the blockchain?
No you should not do everything on the blockchain because blockchain is not designed to solve every problem. In fact, it's not feasible to store large amounts of data as it's very slow to store something like movies and music on the blockchain. Blockchain is really just a way to preserve data that can not be tampered with and to facilitate peer to peer payments and to build various applications using smart contracts. For everything else like storing large amounts of data, use Hive. For secure communication between users, use Carrier instead of the traditional internet protocols. 
