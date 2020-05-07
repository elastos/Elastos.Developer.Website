+++
title = "Deploy a Smart Contract"
date = 2019-07-09T21:15:40+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

{{< todo "This guide is out of date, you can connect to elaeth.io's provided RPC ports" >}}

## Introduction

Working with Ethereum smart contracts in Elastos is quite similar as doing it on the main Ethereum blockchain. You can use usual tools such as **solc**, **remix**, **truffle**, RPC API calls, **web3** library...

There are some specificities though, which are mostly:

- A different RPC address for the Elastos Ethereum sidechain.
- A different way to get ELA or transfer ELA (from the Elastos mainchain) to the ETH sidechain.

Here are a few easy steps to help you deploy your smarts contracts on the Elastos ETH sidechain.

## Language for implementing smart contracts

We use `solidity` to develop ETH smart contracts. Currently, Elastos Ethereum sidechain supports solidity versions not higher than 0.5.0.

More information: [solidity wiki](https://solidity.readthedocs.io/en/v0.4.5/)

## Setup Truffle

For our deployment we are going to use **truffle**, which is the most used tool among ethereum developers. You are free to use other tools such as **remix** or manual deployment as long as your understand the main deployment flow.

    npm install -g truffle solc truffle-hdwallet-provider

## Run a local node

**Develap** (installed during the setup phase of this guide) must be used to run at least the ETH sidechain:

    # First stop any running node
    develap blockchain kill 
    # Start mainchain and ETH sidechain nodes on for testnet
    develap blockchain run -e testnet -n mainchain,eth 
    # Make sure everything is ok
    develap blockchain list

## Generate your first contract

From the folder in which you want to store your smart contracts, type the following command. Truffle will initialize an empty default contract, a migration script, and truffle configuration file.

    truffle init

## Configuration truffle

Truffle needs to know more about your ETH node location. This node is the one you have started with develap. It runs on localhost at a specific port. Please note that on testnet, this port is different form the mainnet port.

Open truffle-config.js to edit it:

     development: {
        host: "localhost",             
        port: 21636,           
        network_id: "*",               
        gas: 2000000
      }

## Get an ELAETH wallet address

In order to deploy a smart contract you have to pay gas using your ELAETH account. This is a different address than your ELA address (mainchain). Use the following command to generate a new address:

    truffle console --network development
    truffle(development)> web3.eth.personal.newAccount("YOUR_PASSWORD")

Your new ELAETH address is returned. Save it for later:

    0xEEbd9e4e52eC7f9f766084d858eFb565e8397838

{{< notice note >}}
You can always retrieve your addresses later running web3.eth.getAccounts()
{{< /notice >}}

## Getting some test ELA

By default, your new ELAETH address doesn't have any ELA. Deploying a contract costs a little bit of gas, therefore ELA.

Go to [faucet.elaeth.io](http://faucet.elaeth.io) and request some test ELA.

After this is done, you have a to wait a few seconds to receive funds.

## Check your account balance

    truffle console --network development
    truffle(development)> web3.eth.getBalance("0xEEbd9e4e52eC7f9f766084d858eFb565e8397838")

## Unlock your account for deployment

Your created account is encrypted using your password. In order to let your ETH node access your account private key to sign the deployment transaction, you must give it a temporary access. This is unlocking. Note that **your account is only unlocked during a limited time**, after which is will be locked again.

    truffle console --network development
    truffle(development)> web3.eth.personal.unlockAccount("0xEEbd9e4e52eC7f9f766084d858eFb565e8397838", "YOUR_PASSWORD")

## Add your account address to truffle configuration

Now that you have an account with some ELA inside, you have to edit truffle-config.js in order to let truffle know which account should pay transaction fees:

     development: {
        host: "localhost",             
        port: 21636,           
        network_id: "*",               
        from: "0xEEbd9e4e52eC7f9f766084d858eFb565e8397838",
        gas: 2000000
      }

## Deploy your contract

Everything is ready to deploy your smart contract.

    truffle deploy –-network development

If things go well, you will get a contract address. Save it for later:

    0x595f4Ef7A7cBCA1709a4B10CFa67C4c3e1240923

## Done

Done! Not that hard after all. Your smart contract is now available on the ETH sidechain.


{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem link="/services/eth_sidechain/guides/calling_smart_contract" rightArrow="true" >}}
        <h5>Next: Calling Smart Contracts</h5>
    {{< /heroitem >}}
{{< /hero >}}
