+++
title = "Connecting Users"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

Introducing dApps to new users is difficult! Even if they already have used Metamask, Elastos introduces another
layer of complexity by being a separate network. 

**That's why we are hard at work building ElaMask**, but until then you may have to instruct your users to add
the Elastos network.

Here's a good tutorial on connecting Web3 to Metamask so that users can use their own wallets and a link to a handy
guide on the UX side of smart contract interaction:

{{< rawhtml >}}
<a href="https://medium.com/@awantoch/how-to-connect-web3-js-to-metamask-in-2020-fee2b2edf58a" target="_blank">https://medium.com/@awantoch/how-to-connect-web3-js-to-metamask-in-2020-fee2b2edf58a</a>
{{< /rawhtml >}}

## Using the Metamask Web3

1. Install Metamask - https://metamask.io - then set up a new account

2. Add the Network, by default you should be connected to the **"Main Ethereum Network"**, go to the Settings page
    and there should be a menu item for **Networks**. In the top right there is an "Add Network" button, click that
    and add the RPC URL for the Elastos ETH Sidechain TestNet as follows:
    
{{< figure src="/build/dapps/tutorials/accounts_1.png" >}}

3. After adding the network, switch to it by clicking the rounded button showing **"Main Ethereum Network"** in the
    very top right, and selecting your new **"ELAETH Testnet"** network in the dropdown.
    
4. You should have a new wallet address created by Metamask, send some ELAETHSC which you got from the faucet to 
    this address, in a moment you should see the balance updated. Now we're ready to update the client-side app
    to use this Metamask.
    
{{< spacer 1 >}}
    
### Connecting Your Web App to Metamask

Metamask actually injects an object into the `window` for you which you can reference at `window.ethereum`.

Since your Metamask is already connected to 'https://rpc.elaeth.io' you'll notice that this code no longer specifies 
the RPC port. This actually makes sense because a dApp is not something you have control once deployed and it should
work on any network as long as the contracts are deployed there.

`client/App.js`

```javascript
import React, { useState, useEffect } from 'react';
import Web3 from 'web3'
import logo from './logo.svg';

import './App.css';

import storageCompiledJSON from './contracts/Storage.json'

// ELAETHSC testnet
const storageContractAddress = '0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671'


function App() {

  let web3, storageInstance

  // this will have the value in the Storage contract
  const [ storedNumber, setStoredNumber ] = useState()

  if (window.ethereum){
    web3 = new Web3(window.ethereum)

    // this triggers the Metamask permission request
    window.ethereum.enable()

    storageInstance = new web3.eth.Contract(storageCompiledJSON.abi, storageContractAddress)
  }

  // initial load
  useEffect(() => {
    if (!window.ethereum) {
      return
    }

    (async () => {
      const result = await storageInstance.methods.retrieve().call()

      setStoredNumber(parseFloat(result))
    })()
  }, [])

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo"/>
        {window.ethereum ?
          <p>
            Stored Number: {storedNumber}
          </p> :
          <p>No Ethereum Extension Detected!</p>
        }
      </header>
    </div>
  );
}

export default App;
```

**If this worked properly you should still see the correct stored number displayed.**

{{< figure src="/build/dapps/tutorials/accounts_2.png" width="50%">}}

{{< spacer 1 >}}

### Sending a Transaction

The next step is actually issuing a transaction that requires gas! 

So let's add an actual action and button that does this, we've added a Loading spinner so ensure you get the latest code,
`npm install` and add the new files (Loading.js, styles/bootstrap.min.css).

Code is here: https://github.com/crregions/ela-eth-sidechain-doc/blob/master/client/src/App.js

`App.js`

```javascript
import React, { useState, useEffect, useRef } from 'react';
import Web3 from 'web3'
import logo from './logo.svg';
import { LoadingOverlay } from './Loading'

import './App.css'
import './styles/bootstrap.min.css'

import storageCompiledJSON from './contracts/Storage.json'

// ELAETHSC testnet
const storageContractAddress = '0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671'

let web3, storageInstance

function App() {

  const inputEl = useRef(null)
  const [ loading, setLoading ] = useState(false)

  // this will have the value in the Storage contract
  const [ storedNumber, setStoredNumber ] = useState()

  // initial load
  useEffect(() => {
    if (!window.ethereum) {
      return
    }

    web3 = new Web3(window.ethereum)

    // this triggers the Metamask permission request
    window.ethereum.enable()

    storageInstance = new web3.eth.Contract(storageCompiledJSON.abi, storageContractAddress)

    ;(async () => {
      const result = await storageInstance.methods.retrieve().call()

      setStoredNumber(parseFloat(result))
    })()
  }, [])

  const storeNumber = async () => {

    setLoading(true)

    const numberToStore = parseFloat(inputEl.current.value)

    if (isNaN(numberToStore)){
      alert('Please enter a number!')
      return
    }

    const accounts = await web3.eth.getAccounts()

    await storageInstance.methods.store(numberToStore).send({
      from: accounts[0], // metamask only has one address for now
      gasPrice: 1000000000
    })

    // of course we can use the value directly, but let's retrieve it as an exercise
    const result = await storageInstance.methods.retrieve().call()

    setStoredNumber(parseFloat(result))

    inputEl.current.value = ''

    setLoading(false)
  }

  return (
    <div className="App">
        <img src={logo} className="App-logo" alt="logo"/>
        {window.ethereum ?
          <p>
            Stored Number: {storedNumber}
          </p> :
          <p>No Ethereum Extension Detected!</p>
        }

      <div>
        {loading && <LoadingOverlay/>}
        <input type="number" ref={inputEl}/>
        <button className="btn btn-info" onClick={storeNumber}>Store Number</button>
      </div>
    </div>
  );
}

export default App;

```

#### There are some important changes here:

1. We now need to initialize web3 inside the React.FC component, we wrap this in a `useEffect` since it only needs to run once. The call to
    `window.ethereum.enable()` actually triggers the Metamask extension window to pop-up and verify the connection.

2. We assume the `window.ethereum` variable is injected by Metamask, if it's not installed we can definitely do a better job at directing the user 
    to where they need to go to get it.
    
3. The transaction does take a while, 15 seconds now on the testnet and soon around 5 seconds on our next ETH Sidechain update.

4. When you test this you'll discover that when you click the **"Store Number"** button that Metamask will pop-up again and verify the transaction. 
    This is intended behavior because you are actually spending ELAETHSC, which on MainNet is real money. This is to protect the user from
    spending their actual funds inadvertently.

{{< spacer 2 >}}

### Coming Soon:

Tutorials on Oracles (Calling existing smart contracts that are on-chain) and Gas Station Network (GSN) contracts that are pre-funded with gas fees so that users can more easily use them without Metamask or signing up.* 

{{< spacer 5 >}}
