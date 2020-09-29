+++
title = "Oracles and Calling Other Contracts"
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++

Calling other smart contracts from your smart contract is extremely important, and also fundamental to how your 
smart contracts can use external data. 

#### Another thing to wrap your head around is how blockchains need to be deterministic and therefore external data needs to be written first to the blockchain and then referenced by your smart contract.

{{< notice todo >}}
    We'll add a diagram here to explain it better, but for now the written explanation to understand is that 
    in a blockchain all the nodes must reach consensus, so if some external data is reported differently to
    a subset of nodes, then they will not be able to reach consensus.<br/>
    <br/>
    Therefore to ensure that the external data is the same, we need to have the data exist on-chain on a previous
    block. 
{{</ notice >}}

{{< spacer 1 >}}

### Calling another Smart Contract from your Smart Contract

#### You need 2 things to call a smart contract from your smart contract:

1.  You need to know the **contract address**, which is the address that the smart contract was deployed to.

2.  You need the smart contract's ABI (Application Binary Interface), this is the specification of all the methods on the smart contract **or at least know the method names of the contract**.

	The most straightforward way of getting the ABI is to have the source code of the smart contract and compile it. Truffle and Open Zeppelin both will produce the ABI in the `build` directory.
	
### You can call existing smart contracts you didn't deploy directly from the client-side application. But you should evaluate why you're doing it.

The thing to understand with oracles is that they represent a more trustworthy, but not real-time source of external data. However if you already have an existing traditional API endpoint that you trust you could use that too.

But if you do use a traditional centralized endpoint the issue is then that your dApp loses its decentralization. This may 

### Calling a smart contract from your smart contract

This is the real intended use case of oracles, since within a smart contract there is no way to call out to any external
API or endpoint. 

#### The recommended way to do this is with a **"function signature"** of the contract you wish to call.

Since Ethereum smart contract methods are mapped to their hash in binary, when we overwrite the address of the function
signature it'll work as intended.

{{< rawhtml >}}
You can access the example code here: <a href="https://github.com/crregions/vulcanlink-test" target="_blank">https://github.com/crregions/vulcanlink-test</a>
{{< /rawhtml >}}

{{< notice note >}}
	As you can see we are only exposing the <b>latestAnswer</b> function on the Aggregator contract.
{{< /notice >}}

```solidity
pragma solidity 0.4.24;

import "./oz/Initializable.sol";

contract Aggregator {
    function latestAnswer() external view returns (int256);
}

contract ElaToUsd is Initializable {

    Aggregator oracleAggregator;

    function initialize(address aggregatorAddr) public initializer {
        oracleAggregator = Aggregator(aggregatorAddr);
    }

    function calcUsd(int256 elaAmt) external view returns (int256) {
        int256 elaValueUsd = oracleAggregator.latestAnswer();

        return elaAmt * elaValueUsd;

    }

    function() external payable {}
}
```

**We are also using Open Zeppelin's Initializable smart contract so we can initialize the smart contract with the address of the existing smart contract address of the deployed Aggregator.**

By referencing https://www.notion.so/Elastos-Oracles-8a44498a815a46eaa382774c91dbcbf1 you can see that the contract address
of the Aggregator is: `0xA64267e44af675498310620418c8F08A9dAeB1eb`.

Therefore in the migrate scripts you need to ensure to initialize the smart contract with this address after it is
deployed:

```
await elaToUsdInstance.initialize('0xA64267e44af675498310620418c8F08A9dAeB1eb')
```

Now deploying this smart contract and calling initialized should be all you need to demonstrate that you can call the oracle smart contract.

```
| => NODE_ENV=testnet truffle test --network vulcanlinkTest
Using network 'vulcanlinkTest'.


Compiling your contracts...
===========================
> Compiling ./contracts/ElaToUsd.sol
> Artifacts written to /var/folders/g2/sjmmz3w13q54sgwfbwnxjh_00000gn/T/test-2020828-46045-pyf6ko.22er
> Compiled successfully using:
   - solc: 0.4.24+commit.e67f0147.Emscripten.clang

aggregatorAddr = 0xA64267e44af675498310620418c8F08A9dAeB1eb


  Contract: ElaToUsd
<BN: a9374f4>
TESTNET returned ELA Price: 1.77435892
    ✓ Should return the fake result 221000000 in dev or print the ELA price on testnet (3431ms)


  1 passing (6s)
```

Here you can see the answer returned of 1.774 USD per ELA which is correct at the time.

{{< spacer 1 >}}

{{< notice todo >}}
    Coming soon the next tutorial is on how to use GSN (Gas Station Network) to pre-fund your
    smart contracts. That way new users don't need to have ELAETHSC to start using your dApp!
{{</ notice >}}

{{< spacer 5 >}}