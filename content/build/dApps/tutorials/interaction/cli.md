+++
title = "CLI Console"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

## Contract Interaction

There are 3 general ways to interact with your smart contracts:

#### Navigation

{{< hero >}}
    {{< heroitem title="CLI Console Interaction" active="true">}}
        Developing locally, a console is a quick way to connect to your smart contracts and manually initiate any 
        functions on the smart contract. 
    {{< /heroitem >}}
    
    {{< heroitem title="Scripting & Test Interaction" link="/build/dapps/tutorials/interaction/tests">}}
        From a secure environment where you can safely expose your private keys you can script or write tests for
        your local PrivNet, TestNet or even MainNet. 
    {{< /heroitem >}}
    
    {{< heroitem title="Client-Side dApps" link="/build/dapps/tutorials/interaction/client">}}
        For deployed client-side dApps, all your code is public so the expectation is that users bring their own
        private keys via a secure browser extension such as Metamask. You would also use your own Metamask to
        test the experience.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 1 >}}

### CLI Console Interaction

In our previous example we deployed a TestNet contract at: `0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671`

We also compiled this contract and the associated metadata about the contract is now within your `build` folder. 
It's important to understand how these components are interconnected.

{{< spacer 1 >}}

### 1. Anatomy of Your Compiled Contracts

Now let's take a look at your `storage.json` located at `/build/contracts/storage.json`.

{{< figure src="/build/dapps/tutorials/interaction/cli_build_1.png" >}}

If you look under `networks` you can see that Truffle tracks all the previously deployed addresses for each network. 
In this case network refers to the different PrivNets, TestNets and MainNets you may connect to.

For us the network ID `3` is the TestNet and network ID `1` is the mainnet. You can differentiate PrivNet local networks
by Ganache because they are timestamps, for example `1600465249948`.

{{< figure src="/build/dapps/tutorials/interaction/cli_build_2.png" >}}

Here you can see it knows that your last TestNet contract was deployed at `0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671`. 
If you did a `truffle migrate --network elaethTest --reset` it would overwrite this.

{{< spacer 1 >}}

### 2. The Contract ABI or Application Binary Interface

To interact with your contract and know what the pertinent methods are Truffle and later your client web3 libraries will
all expect the ABI. This tells the tools you are using to interact with the smart contract what the associated arguments,
return values and methods are.

**For our `Storage` smart contract you can see the methods and arguments:**

{{< figure src="/build/dapps/tutorials/interaction/cli_build_3.png" width="50%">}}

{{< spacer 1 >}}

### 3. The Truffle Console

Truffle's console CLI tool uses this ABI to create an accessible object, let's jump into our console environment:

```
truffle console --network elaethTest
```

Now if you simply typed `Storage` you'll see that Truffle has created an accessible class for your smart contract already.
You can also instantiate your previously deployed contract:

```
truffle(elaethTest)> const storageDeployed = await Storage.deployed()
```

Now inspecting `storageDeployed` you can see that you can directly interact with the methods, here's a compact version of 
what you should see in the specially created "TruffleContract":

```javascript
{
  ...
  methods: {
    store: [
      Function
      :
      bound
      _createTxObject
    ],
    '0x6057361d': [
      Function
      :
      bound
      _createTxObject
    ],
    'store(uint256)': [
      Function
      :
      bound
      _createTxObject
    ],
    retrieve: [
      Function
      :
      bound
      _createTxObject
    ],
    '0x2e64cec1': [
      Function
      :
      bound
      _createTxObject
    ],
    'retrieve()': [
      Function
      :
      bound
      _createTxObject
    ]
  },
  ...
  _address: '0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671',
  _jsonInterface: [
    [
      Object
    ],
    [
      Object
    ]
  ]
  ...
}
```

{{< spacer 1 >}}

### 4. Calling the Truffle Instance 

You can call any contracts you deployed locally by just invoking the method on it, note that this consumes a small
amount of gas, so you need to double-check that you have ETH first.

```
truffle(elaethTest)> web3.eth.getBalance(accounts[0]).then((x) => web3.utils.fromWei(x))
'4.494265373809000001'
```

**Note" Truffle will call it ETH, but this is really ELAETHSC on the Elastos ETH Sidechain TestNet**

Here we can store the number "5":

```
truffle(elaethTest)> await storageDeployed.store(5)
{ tx:
   '0x62ddf08b4dff901c445b42c731447c344bbfc37bfed8859b78caef0af313fefd',
  receipt:
   { blockHash:
      '0x7d1270244984817fe31b948594c1269289fdf7d421d4aebecdef83695996e9b1',
     blockNumber: 2272099,
     contractAddress: null,
     cumulativeGasUsed: 41711,
     from: '0x243c7b804a1cb650c3f584fac5e33fdb61cd26ce',
     gasUsed: 41711,
     logs: [],
     logsBloom:
      '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000000000000001000000000000000',
     status: true,
     to: '0x654ff88970f04b8c2a75dfeeb0b133de8024c671',
     transactionHash:
      '0x62ddf08b4dff901c445b42c731447c344bbfc37bfed8859b78caef0af313fefd',
     transactionIndex: 0,
     rawLogs: [] },
  logs: [] }
```

And if you search for the transaction on the testnet explorer you will actually see
the transaction: `0x62ddf08b4dff901c445b42c731447c344bbfc37bfed8859b78caef0af313fefd`.

{{< rawhtml >}}
<a href="https://testnet.elaeth.io/tx/0x62ddf08b4dff901c445b42c731447c344bbfc37bfed8859b78caef0af313fefd/internal_transactions" target="_blank">https://testnet.elaeth.io/tx/0x62ddf08b4dff901c445b42c731447c344bbfc37bfed8859b78caef0af313fefd/internal_transactions</a>.
{{< /rawhtml >}}

Retrieving the value is easy and free (reading data from the chain is free from an external source):

```
truffle(elaethTest)> storageDeployed.retrieve()
<BN: 5>
```

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem title="Contract Interaction: Scripts & Tests" link="/build/dapps/tutorials/interaction/tests" rightArrow="true">}}
        As cool as it is to interact directly with your smart contracts, normally we'd want to write tests to ensure and verify that
        the contracts work as they should.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 5 >}} 
