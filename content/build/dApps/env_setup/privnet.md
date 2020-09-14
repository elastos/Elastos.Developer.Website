+++
title = "Private Net Setup"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

To setup an Elastos ETH Sidechain private net you'll be using the popular Ethereum tool called **Ganache**
which is a locally running blockchain, albeit with some minor modifications to ensure it matches the Elastos environment.

#### A quick overview of all the tools we'll be using:

1. **Ganache** - a locally running blockchain for development.

2. **Truffle** - a CLI tool and smart contract management tool to interact with the blockchain.

3. **OpenZeppelin** - (optional) this is a powerful and in some ways more well designed tool similar to Truffle, however it's a bit more advanced and there are trade-offs - more on this later.

4. **React** - you can use any front-end framework, but here I'll be using React.

### 1. Set up your workspace

We need a new folder to contain all your blockchain related configuration files, smart contracts
and your client side front-end web application.

Of course as your project grows the client side application can be moved to its own repository/project, but
for the purposes of this guide we'll keep everything in one place. 

So first I will create a new folder, initialize it, install **Truffle** and then initialize Truffle:

```
npm init
npm install -g truffle // if not already installed
truffle init
```

Done properly you should see the message: 

```
Unbox successful, sweet!
```

And your directory should look as below:

{{< figure src="/build/dapps/env_setup/dir_struct.png" >}}

{{< spacer 1 >}}

### 1. Download and Run Ganache, Your Local Blockchain

This is an npm module, so just run: 

```
npm install -g ganache-cli
```

Now normally when you run the Ganache blockchain, the chain is transient, every time you run it, it's reset. However
we'd like to keep the contracts and state so we can pick up where we left off. 

To do this we need to save our blockchain files, this is enabled through the `--db` flag and specifying the folder to 
store the files following it.

**Finally we need to ensure that the instance version matches the current Elastos version which is "byzantium".**

Open a new terminal/command line, ensure your current directory is your workspace/folder and start Ganache as follows:

```
npx ganache-cli --deterministic --gasLimit 8000000 --gasPrice 1000000000 --db ganache-db --hardfork byzantium
```

If everything worked you should see at the end:

```
Listening on 127.0.0.1:8545
```

This is the default endpoint for connecting to the blockchain.

{{< spacer 1 >}}

### 2. Now Connect to the Ganache Blockchain with Truffle 

To connect Truffle, we need to configure the new endpoint we just got `127.0.0.1:8545`. 

Open the file that `truffle init` created called `truffle-config.js`.

You'll see a well commented file, scroll down until you see:

```
// development: {
//  host: "127.0.0.1",     // Localhost (default: none)
//  port: 8545,            // Standard Ethereum port (default: none)
//  network_id: "*",       // Any network (default: none)
// },
```

Since this is default, this should match your Ganache exactly, so just uncomment this.

However one thing we did change was the **"hardfork"** version, so at the bottom you'll need to edit the compilers section to 
match the following:

```
// Configure your compilers
compilers: {
    solc: {
        settings: {
            evmVersion: "byzantium"
        }
    }
}
```

### 3. Test the Connection

To quickly test our network, we can use `truffle console`, if it connects you should see your prompt change to:

```
truffle(development)>
```

This console is a Javascript based console.

Ganache is automatically created with some accounts for you to use, you should see the mnemonic passphrase for these accounts 
in your Ganache console, to see the addresses type `accounts`:

```
| => truffle console
truffle(development)> accounts
[ '0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1',
  '0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0',
  '0x22d491Bde2303f2f43325b2108D26f1eAbA1e32b',
    ...
```

To check the balance of one of these accounts, you can interact with it as you would from Javascript:

```
web3.eth.getBalance(accounts[0]).then((x) => web3.utils.fromWei(x))
```

This should return 100 ETH, all accounts initially get 100 ETH locally.

{{< spacer 1 >}}

### 4. Learn Solidity and Ethereum if you don't already know it

A good starting point is the Truffle - Pet Shop Tutorial. 

You can find the installation guide and tutorial here: 
{{< rawhtml >}}
<a href="https://www.trufflesuite.com/boxes/pet-shop" target="_blank" onclick="event.stopPropagation();">https://www.trufflesuite.com/boxes/pet-shop</a>.
{{< /rawhtml >}}


{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem title="TestNet Setup and Interaction" link="/build/dapps/env_setup/testnet" rightArrow="true">}}
        We're going to keep things super simple though, so follow along to the next page where we will setup
        a simple storage contract, that allows you to store numbers on the blockchain.
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 5 >}}
