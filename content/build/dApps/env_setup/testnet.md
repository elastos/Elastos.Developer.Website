+++
title = "Test Net Setup"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

To connect to the Test Net, we'll add a new network to the `truffle-config.js`, and to make things simple we'll use
the mnemonic passphrase from your local Ganache.

The example repo for this section is at: 

{{< rawhtml >}}
<a href="https://github.com/crregions/ela-eth-sidechain-doc" target="_blank" onclick="event.stopPropagation();">https://github.com/crregions/ela-eth-sidechain-doc</a>
{{< /rawhtml >}}

### 1. Get Your Mnemonic Passphrase

This isn't real crypto of any value so don't worry about security for now. When you started Ganache you should see:

```
HD Wallet
==================
Mnemonic:      word1 word2 ...
``` 

Copy paste that mnemonic into a `secrets.json` file and add it to the top of the `truffle-config.js`. 

`secrets.json`
```
{
  "mnemonic": "word1 word2 word3 ..."
}
```

**Remember to `npm install --save @truffle/hdwallet-provider` the HDWallet Provider too.**

```javascript
const secrets = require('./secrets.json')
const HDWalletProvider = require('@truffle/hdwallet-provider');
const mnemonic = secrets.mnemonic
```

Basically now you should have the same addresses on the TestNet as you had locally.

{{< spacer 1 >}}

### 2. Add the Elastos ETH Sidechain Testnet Network Config

Now in the `networks` section you want to add the `elaethTest` network:

```javascript
elaethTest: {
  host: 'https://rpc.elaeth.io',
  port: 8545,
  network_id: '*',
  provider: () => new HDWalletProvider(
    mnemonic, 'https://rpc.elaeth.io'
  ),
  gasLimit: 8000000,
  gasPrice: 1000000000
}
```

#### You can double check the example repo here: https://github.com/crregions/ela-eth-sidechain-doc 

{{< spacer 1 >}}

### 3. Test the Connection, Check Addresses and Get Test ELAETHSC

Test with the console again, this time ensure you specify the correct network.
```
| => truffle console --network elaethTest
truffle(elaethTest)> accounts
[ '0x243C7B804a1CB650c3f584FaC5e33FdB61Cd26CE',
  '0x44D58Be55097AcbBD491dcc3C33e147cA65CA4b0',
  '0x1779DE893120808720E30763fc3E8043c30bAb5d',
  '0x13222ADfae02b6bE1A90C67C47137cE44774D185',
    ...
```
 
You should notice your accounts are the same too since we used the same mnemonic. In my case I have my first address 
ending in **"...26CE"**, this is what I want to send test cryptocurrency to, but all of the listed addresses are yours
and linked to the mnemonic passphrase.

#### On Elastos we call ETH by ELAETHSC

For Elastos ETH Sidechain, as a EVM network we are designated as chain ids 20 & 21, with the short name ELAETHSC - https://chainid.network.

This works the same as ETH does on Ethereum, which means it's also used for gas. Therefore we need to have ELAETHSC
in order to deploy smart contracts and send transactions. 

For the testnet you can get free "test" ELAETHSC. 

**Go to: https://faucet.elaeth.io, enter your address and it will send you 1 ELAETHSC for testing.** 

Note this is just the TestNet so it's not real cryptocurrency.

{{< spacer 1 >}}

### 4. Deploy a Simple Storage Smart Contract

Now let's create a very basic smart contract which we'll build on in the next two tutorials.

`contracts/Storage.sol`

```solidity
pragma solidity >=0.4.22 <0.7.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Storage {

    uint256 number;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}
```

This simple smart contract allows you to `store` and `retrieve` a number. 

{{< notice note >}}
    Notice how the <b>store</b> function doesn't return anything.<br/>
    <br/>
    Changing state on the chain requires that the transaction gets accepted and confirmed, this means that these methods
    act like Javascript asynchronous functions, but can have no return. Although we can await the "sendTransaction" it
    will only return the transaction hash.<br/>
    <br/>
    <b>Read more here:<b/> <a href="https://web3js.readthedocs.io/en/v1.3.0/web3-eth-contract.html#methods-mymethod-send" target="_blank">https://web3js.readthedocs.io/en/v1.3.0/web3-eth-contract.html#methods-mymethod-send</a> 
{{< /notice >}}

Now hopefully you've learned how Truffle works, if not please read up here:

{{< rawhtml >}}
<a href="https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations" target="_blank">https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations</a>.
{{< /rawhtml >}}

You'll be adding a second step to the migration:

`migrations/2_deploy_storage.js`
```javascript
const Storage = artifacts.require("Storage");

module.exports = function(deployer) {
  deployer.deploy(Storage);
};
```

Now assuming you have test ELAETHSC, you should be able to deploy it to the Elastos ETH Sidechain TestNet.

```javascript
| => truffle migrate --network elaethTest

Compiling your contracts...
===========================
> Compiling ./contracts/Migrations.sol
> Compiling ./contracts/Storage.sol

...

Migrations dry-run (simulation)
===============================

...

Starting migrations...
======================

...

Migrating 'Storage'
   -------------------
   > transaction hash:    0x246068657b7c4aa079fca053f98ac8db72c4fc7c9573568e5933a47b9c0a072a
   > Blocks: 0            Seconds: 9
   > contract address:    0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671


Summary
=======
> Total deployments:   2
> Final cost:          0.000340896 ETH
```

All of this should take a minute or two, when it's done you can verify it worked by checking the TestNet explorer:

{{< rawhtml >}}
<a href="https://testnet.elaeth.io" target="_blank">https://testnet.elaeth.io</a>.
{{< /rawhtml >}}

Where you should see your most recent contract deployments and transactions.

{{< figure src="/build/dapps/env_setup/testnet_explorer.png" >}}

### But what does this really mean?

Your smart contract is now on-chain at the contract address shown under the `'Storage'` contract address. 

Now search for that contract address and you should see something like this:

{{< figure src="/build/dapps/env_setup/testnet_contract.png" >}}

This shows your smart contract on the testnet accessible at that smart contract address.

### 5. Interacting with your Smart Contract

There are three general ways to interact with your smart contract:

#### 1. A Command Line Tool (CLI) like `truffle console` 

#### 2. Via a programmatic script or process, usually this is used by tests

#### 3. A client-side dApp that works with your smart contracts   

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem title="Tutorial 1: Interacting with Smart Contracts" link="/build/dapps/tutorials/interaction/cli" rightArrow="true">}}
        Let's walkthrough these <b>3</b> general ways to connect with your newly created Storage contract.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 5 >}}
