+++
title = "Ethereum sidechain"
date = 2019-09-10T01:15:40+02:00
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

## Introduction

The RPC API is conform to [the Ethereum JSON RPC specs](https://github.com/ethereum/wiki/wiki/JSON-RPC).

## JSON-RPC Endpoint

Default JSON-RPC endpoints for a locally running node (launched with develap):

* Mainnet: [http://localhost:20636](http://localhost:20636)
* Testnet: [http://localhost:21636](http://localhost:21636)

## JSON-RPC support

The elastos-eth supports JSON-RPC 2.0, Batch requests, HTTP, IPC, WS.

## About HEX value encoding

Currently there are two key datatypes that are passed over JSON: **unformatted byte arrays** and **quantities**. Both are passed with a hex encoding, however with different requirements to formatting:

When encoding **QUANTITIES** (integers, numbers): encode as hex, prefix with "0x", the most compact representation (slight exception: zero should be represented as "0x0"). Examples:

* 0x41 (65 in decimal)
* 0x400 (1024 in decimal)
* WRONG: 0x (should always have at least one digit - zero is "0x0")
* WRONG: 0x0400 (no leading zeroes allowed)
* WRONG: ff (must be prefixed 0x)

When encoding **UNFORMATTED DATA** (byte arrays, account addresses, hashes, bytecode arrays): encode as hex, prefix with "0x", two hex digits per byte. Examples:

* 0x41 (size 1, "A")
* 0x004200 (size 3, "\0B\0")
* 0x (size 0, "")
* WRONG: 0xf0f0f (must be even number of digits)
* WRONG: 004200 (must be prefixed 0x)

## Commonly used API

The full Ethereum API reference can be found [here](https://github.com/ethereum/wiki/wiki/JSON-RPC). For a quick start, here are a few basic commands that can be used to make sure your Elastos ethereum sidechain runs well:

### eth_gasPrice

Returns the current price per gas in wei.

#### Parameters

none

#### Returns

`QUANTITY` - A hex representation of the current gas price in wei.

#### Request example

    curl -X POST -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}' http://localhost:21636

#### Response example 

    {
      "id":73,
      "jsonrpc": "2.0",
      "result": "0x09184e72a000" // 10000000000000
    }

### eth_getBalance

Returns the ETH balance for the given address

#### Parameters

1. `DATA`, 20 Bytes - address to check for balance.
2. `QUANTITY|TAG` - integer block number, or the string `"latest"`, `"earliest"` or `"pending"`, see the default block parameter

#### Example Parameters

    params: [
        '0xc94770007dda54cF92009BFF0dE90c06F603a09f',
        'latest'
    ]

#### Returns

`QUANTITY` - Current balance in wei.

#### Request example

    curl -X POST -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0xc94770007dda54cF92009BFF0dE90c06F603a09f", "latest"],"id":1}' http://localhost:21636

#### Response example
       
    {
      "id":1,
      "jsonrpc": "2.0",
      "result": "0x0234c8a3397aab58" // 158972490234375000
    }

### eth_getBlockByHash

Returns information about a block from its hash.

#### Parameters

1. `DATA`, 32 Bytes - Hash of a block.
2. `Boolean` - If `true` it returns the full transaction objects, if `false` only the hashes of the transactions.

#### Example Parameters

    params: [
       '0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331',
       true
    ]

#### Returns

`Object` - A block object, or `null` when no block was found:

* `number`: `QUANTITY` - the block number. `null` when its pending block.
* `hash`: `DATA`, 32 Bytes - hash of the block. `null` when its pending block.
* `parentHash`: `DATA`, 32 Bytes - hash of the parent block.
* `nonce`: `DATA`, 8 Bytes - hash of the generated proof-of-work. `null` when its pending block.
* `sha3Uncles`: `DATA`, 32 Bytes - SHA3 of the uncles data in the block.
* `logsBloom`: `DATA`, 256 Bytes - the bloom filter for the logs of the block. `null` when its pending block.
* `transactionsRoot`: `DATA`, 32 Bytes - the root of the transaction trie of the block.
* `stateRoot`: `DATA`, 32 Bytes - the root of the final state trie of the block.
* `receiptsRoot`: `DATA`, 32 Bytes - the root of the receipts trie of the block.
* `miner`: `DATA`, 20 Bytes - the address of the beneficiary to whom the mining rewards were given.
* `difficulty`: `QUANTITY` - integer of the difficulty for this block.
* `totalDifficulty`: `QUANTITY` - integer of the total difficulty of the chain until this block.
* `extraData`: `DATA` - the "extra data" field of this block.
* `size`: `QUANTITY` - integer the size of this block in bytes.
* `gasLimit`: `QUANTITY` - the maximum gas allowed in this block.
* `gasUsed`: `QUANTITY` - the total used gas by all transactions in this block.
* `timestamp`: `QUANTITY` - the unix timestamp for when the block was collated.
* `transactions`: `Array` - Array of transaction objects, or 32 Bytes transaction hashes depending on the last given parameter.
* `uncles`: `Array` - Array of uncle hashes.

#### Request example

    curl -X POST -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"jsonrpc":"2.0","method":"eth_getBlockByHash","params":["0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331", true],"id":1}' http://localhost:21636

#### Response example

    {
        "id":1,
        "jsonrpc":"2.0",
        "result": {
        "number": "0x1b4", // 436
        "hash": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331",
        "parentHash": "0x9646252be9520f6e71339a8df9c55e4d7619deeb018d2a3f2d21fc165dde5eb5",
        "nonce": "0xe04d296d2460cfb8472af2c5fd05b5a214109c25688d3704aed5484f9a7792f2",
        "sha3Uncles": "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
        "logsBloom": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331",
        "transactionsRoot": "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
        "stateRoot": "0xd5855eb08b3387c0af375e9cdb6acfc05eb8f519e419b874b6ff2ffda7ed1dff",
        "miner": "0x4e65fda2159562a496f9f3522f89122a3088497a",
        "difficulty": "0x027f07", // 163591
        "totalDifficulty":  "0x027f07", // 163591
        "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000",
        "size":  "0x027f07", // 163591
        "gasLimit": "0x9f759", // 653145
        "gasUsed": "0x9f759", // 653145
        "timestamp": "0x54e34e8e" // 1424182926
        "transactions": [{...},{ ... }] 
        "uncles": ["0x1606e5...", "0xd5145a9..."]
      }
    }

## Deprecated

{{< todo "@BPI make sure this is useless after using develap, as everything is already started. Move to the guides section if this still can be useful, but this is advanced" >}}

You can start the HTTP JSON-RPC with the --rpc flag

    geth --rpc

change the default port (20636) and listing address (localhost) with:

    geth --rpc --rpcaddr <ip> --rpcport <portnumber>

If accessing the RPC from a browser, CORS will need to be enabled with the appropriate domain set. Otherwise, JavaScript calls are limit by the same-origin policy and requests will fail:

    geth --rpc --rpccorsdomain "http://localhost:3000"

The JSON RPC can also be started from the [geth console](https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console) using the admin.startRPC(addr, port) command.