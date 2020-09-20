+++
title = "Scripting & Tests"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

## Contract Interaction

There are 3 general ways to interact with your smart contracts:

#### Navigation

{{< hero >}}
    {{< heroitem title="CLI Console Interaction" link="/build/dapps/tutorials/interaction/cli">}}
        Developing locally, a console is a quick way to connect to your smart contracts and manually initiate any 
        functions on the smart contract. 
    {{< /heroitem >}}
    
    {{< heroitem title="Scripting & Test Interaction" active="true">}}
        From a secure environment where you can safely expose your private keys you can script or write tests for
        your local PrivNet, TestNet or even MainNet. 
    {{< /heroitem >}}
    
    {{< heroitem title="Client-Side dApps" link="/build/dapps/tutorials/interaction/client">}}
        For deployed client-side dApps, all your code is public so the expectation is that users bring their own
        private keys via a secure browser extension such as Metamask. You would also use your own Metamask to test the experience.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 1 >}}

### Scripting and Tests

Now for any developer, tests are paramount, in smart contract development we need a quick way to deploy and run tests
on our smart contracts locally.

#### First we definitely want to be running our local PrivateNet (PrivNet)

This was the `Ganache` we set up earlier here: 

{{< rawhtml >}}
<a href="/build/dapps/env_setup/privnet" target="_blank">Environment Setup / Private Net Setup</a>.
{{< /rawhtml >}}

Here's the command again, you'll want to run this in a separate console/command line window so you can watch its progress.

```
npx ganache-cli --deterministic --gasLimit 8000000 --gasPrice 1000000000 --db ganache-db --hardfork byzantium
```

Now Truffle should have created a `test` folder, if not create this.

You can interact with smart contracts similar to how the Truffle console works, this is because the Truffle console is just a Javascript environment.

{{< spacer 2 >}}

### Your First Test

Let's add a basic test script: https://github.com/crregions/ela-eth-sidechain-doc/blob/master/test/storage.js

```javascript
const BN = require('bn.js')

const Storage = artifacts.require('Storage')

contract('storage', (accounts) => {

  let storageInstance

  before(async () => {
    storageInstance = await Storage.deployed()
  })

  // smart contract variables are always initialized to 0
  it('Should verify that the initial value is 0', async () => {

    const result = await storageInstance.retrieve()

    assert(new BN(0).eq(result))
  })

  it('Should store and verify number', async () => {

    await storageInstance.store(5)
    const result = await storageInstance.retrieve()

    assert(new BN(5).eq(result))
  })

})
```

- *Note: Solidity returns "BigNumbers" since we're using 256bit numbers, so we are using the BN.js library too*

#### Run the Test with `truffle test`

This defaults to the local development network which would be your Ganache, which you should have running.

```
| => truffle test
Using network 'development'.

Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.

  Contract: storage
    ✓ Should verify that the initial value is 0
    ✓ Should store and verify number (46ms)

  2 passing (100ms)
```

There you have it, your first working test.

{{< spacer 2 >}}

### Running Scripts Locally

There are two ways to run scripts in Javascript, we'll start with the simpler way which is using Truffle. 

However after we'll cover how to use the basic Javascript libraries to import a wallet and execute any transactions
against your smart contracts.

{{< spacer 1 >}}

#### Truffle Scripts

{{< rawhtml >}}
<a href="https://github.com/crregions/ela-eth-sidechain-doc/tree/master/scripts" target="_blank">https://github.com/crregions/ela-eth-sidechain-doc/tree/master/scripts</a>.
{{< /rawhtml >}}

Using Truffle we can easily ask it retrieve the correct deployed contract for the corresponding network, however as you 
see the Web3 provider still needs to be manually connected to your mnemonic:

```javascript
const Web3 = require('web3')
const BN = require('bn.js')
const _ = require('lodash')
const Storage = artifacts.require('Storage')
const HDWalletProvider = require('@truffle/hdwallet-provider')

const secrets = require('../secrets.json')
const mnemonic = secrets.mnemonic

const walletAddress = '0x243C7B804a1CB650c3f584FaC5e33FdB61Cd26CE'

const runProcess = async function (){
  let web3 = new Web3(new HDWalletProvider(mnemonic, 'https://rpc.elaeth.io'))

  // if your mnemonic was imported correctly it should match the walletAddress you sent test ELAETHSC
  if (web3.currentProvider.addresses[0] !== walletAddress.toLowerCase()){
    console.error('expected wallet address does not match')
    return
  }

  const numberToStore = new BN(_.last(process.argv))

  console.log(`Storing the number ${numberToStore}`)

  // Truffle automatically fetches the correct deployed contract from the corresponding network
  const storageInstance = await Storage.deployed()

  await storageInstance.store(numberToStore)

  console.log('Number stored sucessfully')
}



module.exports = function (callback) {
  return runProcess().then(
    () => {
      return callback()
    },
    (err) => {
      return callback(err)
    }
  )
}
```

#### Where the corresponding command to run the script is:

```
npx truffle --network elaethTest exec scripts/store_number.js 90
```

**Where 90 is the number I am storing,** and you should know the expected wallet address you used for the testnet.
Remember you sent test ELAETHSC to it from the faucet before. One of the headaches of blockchain development is 
keeping track of the various addresses, private keys and mnemonics across different networks.

Now consulting the script (link to repo is above) you can also call the script: `get_number.js`

```
| => npx truffle --network elaethTest exec scripts/get_number.js 
Using network 'elaethTest'.

90
```

And it should retrieve the number.

{{< notice note >}}
    You'll notice that <b>get_number.js</b> doesn't need a wallet or consume gas.<br/>
    <br/>
    Now is an important type to introduce the difference between Ethereum <b>call and send</b> transactions.<br/>
    <br/>
    The short answer is that directly "calling" a read-only "external" method on a smart contract does not need gas.
    Whereas if you need to change state somehow such as the <b>store</b> method then it's actually a "sendTransaction" and 
    does need gas.</br>
    <br/>
    You can read more here: <a href="https://blog.b9lab.com/calls-vs-transactions-in-ethereum-smart-contracts-62d6b17d0bc2" target="_blank">https://blog.b9lab.com/calls-vs-transactions-in-ethereum-smart-contracts-62d6b17d0bc2</a>
    <br/>
    <br/>
    Or in-depth at the official Solidity docs: <a href="https://solidity.readthedocs.io/en/v0.5.0/contracts.html" target="_blank">https://solidity.readthedocs.io/en/v0.5.0/contracts.html</a>
{{</ notice >}}

#### Pure Javascript Scripts

Truffle is convenient because it takes care of the contract instance for you, but we don't always have Truffle and it's 
better to understand how to call your smart contracts directly without any helper libraries. 

In this case we'll be calling these Javascript scripts directly with **"NodeJS"**

This exercise will also help make the difference between **contract "calls" and "sendTransaction** more clear.

{{< spacer 1 >}}

##### Rewriting the `store_number.js`

First we'll need to gather two pieces of information:

1. The smart contract's ABI or Application Binary Interface, this is created when you first compiled your smart contract.
    You can find this in the `build/contracts` directory for each of your smart contracts.

2. You need to know the contract address of the deployed contract for the network in question.

`store_number_web3.js`

Putting these together we can manually construct the contract instance as follows:

```javascript
const Web3 = require('web3')
const BN = require('bn.js')
const _ = require('lodash')

const HDWalletProvider = require('@truffle/hdwallet-provider')

const secrets = require('../secrets.json')
const mnemonic = secrets.mnemonic

const walletAddress = '0x243C7B804a1CB650c3f584FaC5e33FdB61Cd26CE'

// ELAETHSC testnet
const storageContractAddress = '0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671'

const storageCompiledJSON = require('../build/contracts/Storage.json')

// self-executing function to wrap async - makes it easier to use await
;(async () => {

  const web3 = new Web3(new HDWalletProvider(mnemonic, 'https://rpc.elaeth.io'))

  // if your mnemonic was imported correctly it should match the walletAddress you sent test ELAETHSC
  if (web3.currentProvider.addresses[0] !== walletAddress.toLowerCase()){
    console.error('expected wallet address does not match')
    return
  }

  const numberToStore = new BN(_.last(process.argv))

  /*
  ******************************************************************************************
  * Here's where it's different, we need to instantiate the contract instance ourselves
  * instead of relying on Truffle's "artifacts.require".
  *
  * For this we need the ABI, which requires the compiled JSON from the build directory
  * and the address where we deployed it. This is network specific and you'll need
  * your own way to handle this if you intend to run this on multiple networks.
  ******************************************************************************************
   */
  const storageInstance = new web3.eth.Contract(storageCompiledJSON.abi, storageContractAddress)

  await storageInstance.methods.store(numberToStore).send({
    from: walletAddress,
    gasPrice: 1000000000
  })

  process.exit()
})()
```

{{< notice note >}}
    Note how we call the contract method now, referencing the "store" method on "methods".<br/>
    <br/>
    What happens is that web3 constructs an interface using the passed in ABI and generates these functions
    which you will call. It also knows what the expected arguments are from the ABI as well.
    <br/>
    <br/>
    Also you will notice we call the <b>".send"</b> function after, this is to differentiate it from a <b>".call"</b>
    function, please read more here to fully understand the nuances: <a href="https://web3js.readthedocs.io/en/v1.3.0/web3-eth-contract.html#methods-mymethod-send" target="_blank">https://web3js.readthedocs.io/en/v1.3.0/web3-eth-contract.html#methods-mymethod-send</a>
{{< /notice >}}

**Running this script is now simple as (where we are storing the number 27):**

```
node scripts/store_number_web3.js 27
```

{{< spacer 2 >}}

##### The corresponding web3 version of `get_number_web3.js`

```javascript
const Web3 = require('web3')
const storageCompiledJSON = require('../build/contracts/Storage.json')

// ELAETHSC testnet
const storageContractAddress = '0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671'

;(async () => {

  const web3 = new Web3('https://rpc.elaeth.io')

  const storageInstance = new web3.eth.Contract(storageCompiledJSON.abi, storageContractAddress)

  console.log(await storageInstance.methods.retrieve().call())

  process.exit()
})()
```

This is quite simple and incorporates the same concepts as you saw in `store_number_web3.js`, but notice we can just
use `.call` and there is no need to specify a wallet for gas fees because this operation is free.

Now that you know how to interact with your smart contracts programmatically, the rest should be a lot easier!

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem title="Contract Interaction: Client dApps" link="/build/dapps/tutorials/interaction/client" rightArrow="true">}}
        Finally let's connect a front-end client side dApp to your smart contract.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 5 >}}
