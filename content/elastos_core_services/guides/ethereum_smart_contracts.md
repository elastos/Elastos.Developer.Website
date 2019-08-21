+++
title = "Ethereum smart contracts"
date = 2019-05-24T21:15:40+02:00
weight = 50
chapter = false
pre = ""
alwaysopen = false
+++

{{< ownership "BenjaminPiette NiuJingyu BoCheng" >}}

{{< todo "@BPI @BoCheng Many parts still unclear. Need to check the setup phase (local node used?), translate, write android/ios client source code, and make sure python is the most useful language for deployment (ethereum developers habits?)" >}}

## Connect the ELA mainchain with the ETH sidechain

{{< todo "@BPI @NiuJingyu @BoCheng Is this really what is explained here?" >}}
{{< todo "@BPI @NiuJingyu @BoCheng Introduction to explain why we want to do this" >}}

## Preparing development environment

### Running a full node on the testnet

#### Getting geth

##### Building the source

Building geth requires both a Go (version 1.9 or later) and a C compiler. You can install them using your favourite package manager. Once the dependencies are installed, run

    make geth

or, to build the full suite of utilities:

    make all

##### Downloading the binary

[Link](https://download.elastos.org/elastos-eth/)

#### Running geth

```
./geth  --rpcaddr "127.0.0.1" --rpccorsdomain "*" --rpc --rpcapi "personal,db,eth,net,web3,txpool,miner" --testnet
```

### Getting testnet coins

{{< todo "@Bocheng Add the faucet's link of eth-sidechain" >}}


{{< todo "@BPI Add link to the ETH sample when ready (see beijing 2019 hackathon)" >}}

{{< todo "@BPI replace links to ela-cli or other github links, with internal in-doc links" >}}

## Writing a ETH smart contract

### Language for implementing smart contracts

We use `solidity` to develop ETH smart contracts, and the version of the Ethereum sidechain support language is no higher than 0.5.0.

More information: [solidity wiki](https://solidity.readthedocs.io/en/v0.4.5/)

### Environment

- python3
- Dependency package
  1. web3.py
  2. solc no higher than 0.5.0

    ```bash
    pip3 install web3
    wget https://github.com/ethereum/solidity/releases/download/v0.4.26/solidity-ubuntu-trusty.zip
    sudo unzip solidity-ubuntu-trusty.zip -d /usr/local/solidity
    echo 'PATH="/usr/local/solidity:$PATH"' >> .profile
    source .profile
    ```

### Example

#### Contract content

Create Coin.sol:

    pragma solidity ^0.4.22;
    contract Coin {
      address public minter;
      mapping (address => uint) public balances;

      event Sent(address from, address to, uint amount);

      constructor() public {
          minter = msg.sender;
      }

      function mint(address receiver, uint amount) public {
          if (msg.sender != minter) return;
          balances[receiver] += amount;
      }

      function send(address receiver, uint amount) public {
          if (balances[msg.sender] < amount) return;
          balances[msg.sender] -= amount;
          balances[receiver] += amount;
          emit Sent(msg.sender, receiver, amount);
      }
    }

The contract is a simplified version of the token contract, the main method:

* `mint(...)` The contract creator sends token to other users.

* `send(...)` Token users transfer token to users outside.

#### Compiling smart contract

Use solc to compile smart contract:

    solc  --bin --abi -o output --optimize Coin.sol

* `--o`: Creates the contract at the specified directory `output`.
* `--bin`: Binary of the contracts in `hex`.
* `--abi`: ABI specification of the contracts.
* `--optimize`: Enable bytecode optimizer.

After compilation, there will be two files in the `output` folder:

* `Coin.abi`: The contract's `abi`.
* `Coin.bin`: The contract's `bytecode`.

#### Account Preparation

The account for the deployment contract must have enough ETH to support the deployment contract, at least 100000000000000Wei.

#### Deploying contract

Create a Python file in the same directory as the contract, deploy_contract.py, as follows:

    #!/usr/bin/env python
    # -*- coding: utf-8 -*-
    import binascii, time
    from web3 import Web3, HTTPProvider, Account
    
    
    def deploy_contract(keystore, password):
        # Load contract bytecode
        with open("./output/Coin.bin") as contract_bin_file:
            contract_bytecode = '0x' + contract_bin_file.read()
        private_key = Account.decrypt(keystore, password)
        acc = Account.privateKeyToAccount(private_key)
        #Connect to local node
        url = "http://{host}:{port}".format(host='127.0.0.1', port='20636')
        provider = HTTPProvider(url)
        w3 = Web3(provider)
        nonce = w3.eth.getTransactionCount(acc.address)
        # Create transaction
        transaction = {
            'data': contract_bytecode,
            'nonce': nonce,
        }
        # Estimate gas
        gas = w3.eth.estimateGas(transaction)
        transaction['gas'] = gas
        transaction['gasPrice'] = w3.eth.gasPrice
        # Signing transaction
        signed = acc.signTransaction(transaction)
        result = w3.eth.sendRawTransaction(signed.rawTransaction)
        print("We create contract. txHash:", "0x" + str(binascii.b2a_hex(result), encoding='utf-8'))
        # Waiting tx be putted into block
        time.sleep(20)
        receipt = w3.eth.getTransactionReceipt(result)
        print("contractAddress", receipt['contractAddress'])
    
    
    if __name__ == "__main__":
        # Your keystore
        keystore = "" 
    
        # Password of keystore
        password = ""
        deploy_contract(keystore, password)

Execute the file `deploy_contract.py`

    python3 deploy_contract.py

Result:

    We create contract. txHash: 0x512e04bcf4c8b09422c49a1b09b4682a639166745b9df4212c9f42cfc81e382e
    contractAddress 0x16BBc426C15F1f869F10701411939FebC5F76f6F

Get contract address:

    0x16BBc426C15F1f869F10701411939FebC5F76f6F

## Calling a smart contract

Call the contract method `mint(...)` to send 10,000 token to the random account.

Create a Python file in the same directory as the contract, `call_contract.py`, as follows:

    #!/usr/bin/env python
    # -*- coding: utf-8 -*-
    import json, binascii, time
    from web3 import Web3, HTTPProvider, Account
    
    
    def call_mint(keystore, password):
        # Load accout
        private_key = Account.decrypt(keystore, password)
        acc = Account.privateKeyToAccount(private_key)
    
        # A rand recharge account
        acc_dest = Account.create()
        # Recharge account
        amount = 10000
    
        # Connect to local node
        url = "http://{host}:{port}".format(host='127.0.0.1', port='20636')
        provider = HTTPProvider(url)
        w3 = Web3(provider)
    
        # Load contract abi, bytecode
        with open("./output/Coin.abi") as contract_abi_file:
            contract_abi = json.load(contract_abi_file)
        with open("./output/Coin.bin") as contract_bin_file:
            contract_bytecode = '0x' + contract_bin_file.read()
        # Input your contract address"
        contract_addr = w3.toChecksumAddress(str("input your contract address").lower())
        mcontract = w3.eth.contract(address=contract_addr, abi=contract_abi, bytecode=contract_bytecode)
    
        # Call function mint(...)
        data = mcontract.encodeABI(fn_name="mint", args=[acc_dest.address, amount])
        nonce = w3.eth.getTransactionCount(acc.address)
    
        transaction = {
            'to': contract_addr,
            'data': data,
            'nonce': nonce
        }
        gas = w3.eth.estimateGas(transaction)
        transaction['gas'] = gas
        transaction['gasPrice'] = w3.eth.gasPrice
        signed = acc.signTransaction(transaction)
        result = w3.eth.sendRawTransaction(signed.rawTransaction) 
        print("We call contract method. txHash:", "0x" + str(binascii.b2a_hex(result), encoding='utf-8'))
        # Waiting tx be putted into block
        time.sleep(20)
        # Check result
        amount_res = mcontract.functions.balances(acc_dest.address).call()
        print(acc_dest.address, amount_res)
    
    
    if __name__ == "__main__":
        # Your keystore
        keystore = ""
    
        # Password of keystore
        password = ""
        call_mint(keystore, password)

Fill in the contract address obtained in the previous step.

Execute the file `call_contract.py`

    python3 call_contract.py

Result:

    We call contract method. txHash: 0xa41c54b8c76757ae303d8847a3397e65d25f418a5084b7af5d7d74fe2987feaf
    0xc9449257fCA9c05ea647705351a8da1ccF0Bd746 10000

The result shows that we sent the 10000 token to the random account `0xc9449257fCA9c05ea647705351a8da1ccF0Bd746`.

## Other methods to deploy contracts

* [Remix](https://remix-ide.readthedocs.io/en/latest/run.html)

* Deploying contracts in other language versions of Web3 (js, java, swift) is similar to using Python and will not be repeated.
