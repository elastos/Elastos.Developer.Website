+++
title = "Disconnecting and Status"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

For a better user experience we want to allow users to have control over connecting or disconnecting their Metamask.

{{< figure src="/build/dapps/tutorials/accounts/connecting_1.png" width="50%">}}

A savvy user will know that the Metamask plugin will show a **"connected"** green status icon if it's connected to the current
site however it's better UX to show it on the app itself.

We could check the Metamask's injected ethereum accounts array, since this would be empty if there is no account 
connected. `ethereum.isMetaMask` also tells us if we're dealing with Metamask, after all there could be other
popular extensions in the future.

**But good developers don't try to reinvent the wheel**

{{< spacer 1 >}}

### There's a library for this, like all things

The **web3-react** library provides a context with all the Metamask info
{{< rawhtml >}}
<a href="https://github.com/NoahZinsmeister/web3-react" target="_blank">https://github.com/NoahZinsmeister/web3-react</a>
{{< /rawhtml >}}

#### Using Web3 React

We can use web3-react to have more fine-grained control over the connection to Metamask, but as you can see things 
are going to get a whole lot more complicated:

{{< rawhtml >}}
You can access the code here at the tag: **"metamask-mgmt"**: <a href="https://github.com/crregions/ela-eth-sidechain-doc/tree/metamask-mgmt" target="_blank">https://github.com/crregions/ela-eth-sidechain-doc/tree/metamask-mgmt</a>
{{< /rawhtml >}}


#### Let's go through the code and explain it all
`App.js`

**Imports should be self-explanatory, there's some standard hooks you should use as-is.**

This is a simple helper function which is passed in to the `Web3ReactProvider`, which is a React Context Provider
```javascript
function getLibrary(provider) {
  const library = new Web3Provider(provider)
  library.pollingInterval = 12000
  return library
}
```

Now instead of returning the <App> directly we wrap it in the `Web3ReactProvider` so the context we'll be using later is available.
```javascript
export default function() {
  return (
    <Web3ReactProvider getLibrary={getLibrary}>
      <App />
    </Web3ReactProvider>
  )
}

const App = () => {
```

Now we'll start setting up the Ethereum connection
```javascript
  /*
  **************************************************************************************************
  * Ethereum Connection Setup
  **************************************************************************************************
   */

  const [ web3, setWeb3 ] = useState()
```


`useWeb3React` is imported and part of `@web3-react/core`, this returns a struct as you can see below with the members:
- `connector` = the connector object, in our case we only have one type which is the `injectedConnector` Metamask
- `library` = the Web3Provider, note this only exposes the signer, you still need to import Web or Ethers.js
- `chainId` = this is temporarily set to the `networkId`, 1 for mainnet and 3 for testnet, Elastos chainIds are supposted to be 20 and 21 respectively
- `account` = for metamask there should only be the accounts that the user selected, this can be multiple
- `activate` = function called to connect Metamask
- `deactivate` = function called to disconnect Metamask, note this only disconnects the webapp from Metamask but Metamask will still show it as "connected".
- `active` = boolean that represents if the connection is active or not
- `error` = error if any, otherwise undefined

```javascript
  // Web3React provides all current state info in this context
  const context = useWeb3React()

  // these are the variables that tell us about the state
  const { connector, library, chainId, account, activate, deactivate, active, error } = context
```

This allows us to show when we are in a temporary activating (connecting state)
`activatingConnector` is really just undefined or the connector (obj), when we activate we set `activatingConnector`
to the string, and while it does not match `connector` we are in a transient "connecting" state.
```javascript
  const [activatingConnector, setActivatingConnector] = useState()
  useEffect(() => {

    // clear activatingConnector after activation is successful
    if (activatingConnector && activatingConnector === connector) {
      setActivatingConnector(undefined)
    }
  }, [activatingConnector, connector, library])

  // handle logic to eagerly connect to the injected ethereum provider, if it exists and has granted access already
  const triedEager = useEagerConnect(injectedConnector)

  // handle logic to connect in reaction to certain events on the injected ethereum provider, if it exists
  useInactiveListener(injectedConnector, !triedEager || !!activatingConnector)
```

If you run the application with `yarn start` you'll see that this is a simple interface that allows you to
store a number on the smart contract.

There is also button in the top-right that allows you to connect/disconnect Metamask. 

It's interesting to note how the interface updates based on the connection state. 

```javascript
  /*
  **************************************************************************************************
  * Application Setup
  **************************************************************************************************
   */
  const inputEl = useRef(null)
  const [loading, setLoading] = useState(false)

  const [ storageInstance, setStorageInstance ] = useState()

  // connect toggle
  const [connectOpen, setConnectOpen] = useState(false);
  const toggleConnect = () => setConnectOpen(prevState => !prevState);

  // this will have the value in the Storage contract
  const [storedNumber, setStoredNumber] = useState()

  const balance = useBalance()
```

The "Connected" button has three states:

1. `!triedEager` - onload we always try to eagerly connect to an existing Metamask connection, 
    until this resolves to true we don't care about `active`.
    
2. `active === true` - if we're connected we show **Connected** with a dropdown to disconnect.  

3. `active === false` - we show a **Connect to Metamask** button.

Also notice how we update `activatingConnector` first, 

```javascript
  const connectButton = useCallback(() => {

    // let eager connect try first, show loading meanwhile
    if (!triedEager){
      return <Dropdown isOpen={connectOpen} toggle={toggleConnect}>
        <DropdownToggle>
          <Spinner color={'black'} style={{ height: '20px', marginLeft: '-1rem' }} /> Loading
        </DropdownToggle>
      </Dropdown>
    }

    if (active){
      return <Dropdown isOpen={connectOpen} toggle={toggleConnect}>
        <DropdownToggle caret>
          ✅ Connected
        </DropdownToggle>
        <DropdownMenu>
          <DropdownItem className="btn-dark" onClick={() => {
            setActivatingConnector(undefined)
            deactivate()
          }}>Disconnect</DropdownItem>
        </DropdownMenu>
      </Dropdown>
    }

    // default
    return <button className="btn btn-dark" onClick={() => {
      setActivatingConnector(injectedConnector)
      activate(injectedConnector)
    }}>
      Connect to Metamask
    </button>

  }, [triedEager, active]))
```

We use a `useEffect` hook to instantiate the `storageInstance` object which allows us to call the smart contract functions.
This only needs to change when the account or connected Metamask changes.

{{< notice note >}}
    Make sure you pass in the `library.getSigner(account)` to the `ethers.Contract` constructor, the signer account
    is the special purpose linked wallet address from Metamask which will allow you to pay for transactions.
{{</ notice >}}

```javascript
  // initial load
  useEffect(() => {
    (async () => {

      if (!active || !library){
        return
      }

      // instantiate an object to interact with the smart contract based on the ABI method spec
      const storageInstance = new ethers.Contract(
        storageContractAddress,
        storageCompiledJSON.abi,
        library.getSigner(account)
      )

      // await fetching for the current stored value by calling the "retrieve" method
      // on the smart contract

      const result = await storageInstance.retrieve()

      setStoredNumber(parseFloat(result))

      setStorageInstance(storageInstance)
    })()
  }, [active, library, account])
```

This is the actual function to store the number on the smart contract.

{{< notice note >}}
    Always set the <b>gasPrice</b> to Gwei or 10^9 (1 with 9 zeroes), this is currently the fixed gas price
    for the Elastos ETH Sidechain. 
{{</ notice >}}

For our TestNet the block time is 15 seconds temporarily, and will later be approx 5 seconds, so you should expect
that this takes at least 15 seconds. Therefore we have a "Loading" spinner to wait before retrieving the new value. 

```javascript
  const storeNumber = useCallback(() => {
    (async () => {
      if (!storageInstance){
        return
      }

      setLoading(true)

      const numberToStore = parseFloat(inputEl.current.value)

      if (isNaN(numberToStore)){
        alert('Please enter a number!')
        return
      }

      // ethers.js is more granular, it returns the transaction with a `wait()`
      const transResp = await storageInstance.store(numberToStore, {
        gasPrice: 1000000000
      })

      // this properly waits for the result to update
      await transResp.wait()

      // of course we can use the value directly, but let's retrieve it as an exercise
      const result = await storageInstance.retrieve()

      setStoredNumber(parseFloat(result))

      inputEl.current.value = ''

      setLoading(false)
    })()

  }, [storageInstance])
```

{{< rawhtml >}}
    <i>The HTML UI is not included for brevity</i> - please see the code at: <a href="https://github.com/crregions/ela-eth-sidechain-doc/tree/metamask-mgmt" target="_blank">https://github.com/crregions/ela-eth-sidechain-doc/tree/metamask-mgmt</a>
{{< /rawhtml >}} 

{{< notice todo >}}
    Coming soon is a guide on how to track data per user, obviously in this example it wouldn't work if we stored a single number for all users.
{{</ notice >}}

{{< spacer 1 >}}

*For now the next tutorial is something extremely important, how to call oracles or other smart contracts to act on external data.*



{{< hero >}}
    {{< heroitem title="Oracles and Calling Other Smart Contracts from Your Smart Contract" link="/build/dapps/tutorials/oracles" rightArrow="true">}}
        In dApps users should have full control of which accounts they want to connect to your app, instead of immediately 
        requesting a connection we should have a status indicator and allow them to connect/disconnect or change accounts as they see fit.
    {{< /heroitem >}}
{{< /hero >}}