+++
title = "Ethereum Web3 provider"
weight = 30
chapter = false
pre = ""
alwaysopen = true
+++

## Purpose

This is **a Web3 provider**, customized for elastOS, **for the frequently used web3 javascript library**. This provider is mostly a HTTP provider, that sends elastOS intents when necessary, for example to publish ethereum smart contract transactions in a decentralized way.

## Creation and usage

```javascript
import Web3 from 'web3';

let provider = new TrinitySDK.Ethereum.Web3.Providers.TrinityWeb3Provider();
let web3 = new Web3(provider);
let contractAbi = require("path/to/your/contract.json");
let contractAddress = "0xcontractaddress";
let contract = new web3.eth.Contract(contractAbi, contractAddress);
let gasPrice = await web3.eth.getGasPrice();

let transactionParams = {
    from: userEthAccountAddress,
    gasPrice: gasPrice,
    gas: 1000000,
    value:'0'
};

contract.methods.testMethod(10000).send(transactionParams);
```


## Get the active user's ethereum account address

In order to **get a user's ethereum account address**, an intent must be sent to the wallet capsule to let the user authorize this operation.

```javascript
private getEthAddress() {
    appManager.sendIntent("walletaccess", {
        "ethaddress": true
    }, null, (ret: { result: {walletinfo: [{ethaddress: string}] } })=>{
        if (ret.result.walletinfo && ret.result.walletinfo.length > 0) {
            userEthAccountAddress = ret.result.walletinfo[0].ethaddress;
        }
    });
  }
```