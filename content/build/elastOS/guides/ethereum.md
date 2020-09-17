+++
title = "Ethereum smart contracts"
weight = 145
chapter = false
pre = ""
alwaysopen = false
+++

## About Ethereum in Elastos

Elastos runs its own Ethereum sidechain that works together with mainchain, DID sidechain and all the Elastos SDKs. **Regular Ethereum smart contracts can be deployed to the Elastos ETH sidechain**, and client application can **use existing libraries such as web3.js without any change**.

## About Ethereum in elastOS

elastOS provides a homogenous experience to end users by enabling all the Elastos components to run in a single location. This is also true for everything about Ethereum. **Developers can deploy smart contracts and call them easily from elastOS**. When payments have to be done to execute smart contracts, the elastOS wallet is automatically triggered (similar to metamask on the web) to let users pay for transactions. All of this happens in a few screen touch.

## Using Ethereum in elastOS

Here is how to quick start to use Ethereum smart contracts from a elastOS angular capsule. Here we assume that you already have created a capsule using the trinity-cli.

The only difference here is the use of a **custom Web3 provider** for elastOS, named "TrinityWeb3Provider", available in the trinity-dapp-sdk npm package.

#### Install the standard web3 library

```
npm install --save web3
```

#### Install the Trinity dAPP SDK library

```
npm install --save @elastosfoundation/trinity-dapp-sdk
```

#### Prepare your contract

* Compile your solidity smart contract using your favorite tool and get the ABI.
* Store the ABI file in your capsule, for example in *src/assets/ethereum/contracts/myContract.json*.

#### Load your contract

Load your contract ABI as usual using web3, and start calling read-only APIs:

````typescript
import Web3 from 'web3';
import * as TrinitySDK from "@elastosfoundation/trinity-dapp-sdk";

yourInitMethod() {
    let provider = new TrinitySDK.Ethereum.Web3.Providers.TrinityWeb3Provider();
    this.web3 = new Web3(provider);
    let contractAbi = require("./path/to/your/myContract.json");

    this.contract = new this.web3.eth.Contract(contractAbi, contractAddress);
}
````

#### Call a read-only method

````typescript
let yourResult = await this.contract.methods.yourMethod().call();
````

#### Call a transactional method

````typescript
let gasPrice = await this.web3.eth.getGasPrice();

let transactionParams = {
    from: this.selfAccountAddress,
    gasPrice: gasPrice,
    gas: 1000000,
    value:'0'
};

this.contract.methods.yourWriteMethod(name).send(transactionParams)
    .on('transactionHash', (hash) => {})
    .on('receipt', (receipt) => {})
    .on('confirmation', (confirmationNumber, receipt) => {})
    .on('error', (error, receipt) => {});
````

This code will trigger a special intent from the trinity web3 provider in order to publish the transaction. The elastOS wallet will open and ask the end user to check and enter his payment password to finalize the transaction.

#### Retrieve current user's Ethereum account address

Many methods require to use current user's ethereum account address. In order to get this address, the elastOS wallet must be queried to let use decide if he wants to share his ethereum account address with your capsule or not.

````typescript
// At the beginning of your file
declare let appManager: AppManagerPlugin.AppManager;

type EthAddressIntentResult = {
	walletinfo: [
		{ ethaddress: string }
	]
}
````

````typescript
// In a method
appManager.sendIntent("walletaccess", {
    "ethaddress": true
}, null, (ret: { result: EthAddressIntentResult })=>{
    if (ret.result.walletinfo && ret.result.walletinfo.length > 0) {
        this.selfAccountAddress = ret.result.walletinfo[0].ethaddress;
    }
});
````