+++
title = "Client dApps"
weight = 30
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
    
    {{< heroitem title="Scripting & Test Interaction" link="/build/dapps/tutorials/interaction/tests">}}
        From a secure environment where you can safely expose your private keys you can script or write tests for
        your local PrivNet, TestNet or even MainNet. 
    {{< /heroitem >}}
    
    {{< heroitem title="Client-Side dApps" active="true">}}
        For deployed client-side dApps, all your code is public so the expectation is that users bring their own
        private keys via a secure browser extension such as Metamask. You would also use your own Metamask to
        test the experience.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 1 >}}

### Client-Side dApps

When you connect a typical client-side web application with a smart contract and other decentralized services you
essentially have a dApp. 

Though you may incorporate centralized services initially, this is actually quite common as it allows development to
progress much more quickly.

{{< notice note >}}
    For example, by simply importing a JS library from a web URL, you are violating the principle of decentralization 
    because your dApp would cease to function if that single centralized endpoint were to go down. A fully decentralized
    application would instead try to import from a hash reference on IPFS. But this is unlikely to be a concern for
    early applications.<br/>
    <br/>
    Perhaps you can include the hash of the file you expect in your dApp and do the comparison on import, this will be
    enough to cover anyone maliciously trying to serve you an altered file.  
{{< /notice >}}

{{< spacer 1 >}}

#### Your Smart Contracts Are Your Back-End Server 

Instead of how you used to make back-end calls to an API using AJAX or something similar, the main difference in dApp
development is that you should not use a centralized API. Having a dApp rely on a server that you control is not
decentralized since you can turn off or change the functionality of the server at any time. 

**Let's see what this looks like:**

You can probably imagine this if you've ever built a web application, using React as an example you probably have some
`useEffect` hooks that call your back-end APIs. 

So instead you'd be replacing those with a web3 call to the back-end.

Let's initialize a React application, just calling it "client":

```
npm install -g create-react-app
create-react-app client
```

Then navigate to the `client` directory and set up the required web3 libraries:

```
cd client
npm run start
```

This should open the client at `http://localhost:3000` just to verify it works.

##### Add the web3 package

```
npm install --save web3
```

##### Copy the compiled smart contract `Storage.json` from `/build/contracts`

Because React can't access files outside of `src` we need to copy the compiled contract 
over. For this we'll create a new folder called `contracts` and copy it over.

**Note:** *As you develop you'll probably want to automate the copy of the compiled contract in your build process.* 

`client/App.js`

```javascript
import React, { useState, useEffect } from 'react';
import Web3 from 'web3'
import logo from './logo.svg';

import './App.css';

import storageCompiledJSON from './contracts/Storage.json'

const web3 = new Web3('https://rpc.elaeth.io')

// ELAETHSC testnet
const storageContractAddress = '0x654Ff88970F04B8C2A75dfeEB0B133dE8024c671'

const storageInstance = new web3.eth.Contract(storageCompiledJSON.abi, storageContractAddress)

function App() {

  // this will have the value in the Storage contract
  const [ storedNumber, setStoredNumber ] = useState()

  // initial load
  useEffect(() => {
    (async () => {
      const result = await storageInstance.methods.retrieve().call()

      setStoredNumber(parseFloat(result))
    })()
  }, [])

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Stored Number: {storedNumber}
        </p>
      </header>
    </div>
  );
}

export default App;
```

This simple example show contract interaction, but to actually send transactions which require gas involves a bit more work. 

**You can find the initial respective code here:**

{{< rawhtml >}}
<a href="https://github.com/crregions/ela-eth-sidechain-doc/releases/tag/client-initial" target="_blank">https://github.com/crregions/ela-eth-sidechain-doc/releases/tag/client-initial</a>
{{< /rawhtml >}}

Remember that this is a client-side application which is public and you'd likely distribute to users. Therefore you can't simply
include your mnemonic or private key, otherwise a malicious user would simply drain your wallet address of all its funds.

So it would be grave mistake to try to copy the code you have in `store_number_web3.js` because that depends on your mnemonic.

**There are two solutions here:**

1. The typical solution here is that your users connect their own wallet, which we'll cover in the next tutorial. If you've
    heard of Metamask, you may already know how this works.
    
2. Another new solution by OpenZeppelin which creates many libraries and tools for Ethereum is using their Gas Station Network (GSN) tool.
     This tool allows you to create smart contracts where you can load some pre-paid gas fees for your users. To prevent your smart contract's
     reserve of gas from being completely drained you can implement strategies such as limiting the number of daily calls or 
     pre-approving which addresses can use your smart contract.


{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem title="Tutorial 2: Connecting Users" link="/build/dapps/tutorials/accounts" rightArrow="true">}}
        First let's start with the typical solution where users bring their own wallets using Metamask.<br/>
        <br/>
        <span class="text-normal">And soon for the Elastos network we'll have our own version of Metamask called ElaMask.</span>
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 5 >}}
