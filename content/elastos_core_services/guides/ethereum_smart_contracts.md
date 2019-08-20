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

{{< pleasetranslate >}}
# 配置ETH侧链开发环境

## 方式1，连接远程侧链节点：

### 服务器信息
```
Server IP: 52.205.30.16
Port: 8545
```
### 使用网页钱包部署合约
* 登录[myetherwallet](https://www.myetherwallet.com)钱包
* 右上角网络点击change按钮
* 点击添加自定义网络/节点
* ETH Node Name随便填写，选择ETH，URL填写测试服务器地址 `http://52.205.30.16/`，port填写rpc端口: `8545`
* 使用配置合约来部署合约，合约交互来调用合约


## 方式2，搭建本地节点运行环境

* 本地搭建[ETH侧链节点](https://github.com/elastos/Elastos.ELA.SideChain.ETH)，使用dev分支编译，进入`build/bin`目录，使用命令连接testnet节点: 

```
./geth  --rpcaddr "127.0.0.1" --rpccorsdomain "*" --rpc --rpcapi "personal,db,eth,net,web3,txpool,miner" --testnetc` 
```


* 使用dev分支编译[ela-cli](https://github.com/elastos/Elastos.ELA.Client)，配置文件 `cli-config.json` 修改如下:

```
{
  "LogToFile":false,
  "Host": "127.0.0.1:10016",
  "DepositAddress":"EEmfgnrDLQmFPBJiWvsyYGV2jzLQY58J6G"
}
```


### 将测试币ela充值到eth侧链
* 创建充值交易: `./ela-cli wallet -t create --deposit eth_address(充值以太坊地址) --amount recharge_value(充值金额) --fee recharge_fee(充值消耗手续费)`
* 签名交易: `./ela-cli wallet -t sign --file to_be_signed.txn -p yourpassword(密码)`
* 发送交易: `./ela-cli wallet -t send --file ready_to_send.txn`





{{< todo "@BPI Add link to the ETH sample when ready (see beijing 2019 hackathon)" >}}

{{< todo "@BPI replace links to ela-cli or other github links, with internal in-doc links" >}}

## Writing a ETH smart contract

### 合约语言

我们使用`solidity`开发ETH智能合约，以太坊侧链支持语言的版本不高于0.5.0.

更多信息:[solidity wiki](https://solidity.readthedocs.io/en/v0.4.5/)

### 环境

1. python3
2. web3.py

    ```bash
    pip3 install web3
    ```

3. 安装solc

    ```bash
    sudo add-apt-repository ppa:ethereum/ethereum
    sudo apt-get update
    sudo apt-get install solc
    ```

### 合约示例

#### 合约内容

创建合约Coin.sol, 内容如下:

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

该合约是一个简化版的代币合约，主要方法：

* `mint(...)` 合约创建者给其他用户发代币。

* `send(...)` 代币的用户也可以给之外的用户转移代币。

#### 编译合约

执行solc， 编译命令。

    solc  --bin --abi -o output --optimize Coin.sol

* `--o`: 输出目录`output`文件夹。
* `--bin`: 编译输出合约的 `bytecode` 使用`hex`编码。
* `--abi`: 编译输出合约的`abi`。
* `--optimize`: 对`bytecode`进行优化。

编译后在`output`文件夹下会有两个文件：

* `Coin.abi`: 合约的`abi`。
* `Coin.bin`: 合约的`bytecode`。

#### 账户准备

部署合约的账户必须有足够ETH以支持部署合约，至少需要100000000000000Wei。

#### 发布合约

在合约的同级目录下创建Python文件，deploy_contract.py，内容如下：

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

执行该文件 deploy_contract.py

    python3 deploy_contract.py

输出结果：

    We create contract. txHash: 0x512e04bcf4c8b09422c49a1b09b4682a639166745b9df4212c9f42cfc81e382e
    contractAddress 0x16BBc426C15F1f869F10701411939FebC5F76f6F

获取合约地址

`0x16BBc426C15F1f869F10701411939FebC5F76f6F`

## 调用合约

调用合约方法`mint(...)`， 向随机账户发送10000个代币。

在合约的同级目录下创建Python文件，call_contract.py，内容如下：

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

填入上步骤中获取的合约地址。

执行该文件 call_contract.py

    python3 call_contract.py

输出结果：

    We call contract method. txHash: 0xa41c54b8c76757ae303d8847a3397e65d25f418a5084b7af5d7d74fe2987feaf
    0xc9449257fCA9c05ea647705351a8da1ccF0Bd746 10000

结果显示我们向随机账户 `0xc9449257fCA9c05ea647705351a8da1ccF0Bd746` 发送了`10000`代币。

## 其他方式部署合约

* [使用Remix部署合约](https://remix-ide.readthedocs.io/en/latest/run.html)

* 使用Web3其他语言版本（js, java, swift）部署合约, 和使用python大同小异，就不再重复。

{{< /pleasetranslate >}}