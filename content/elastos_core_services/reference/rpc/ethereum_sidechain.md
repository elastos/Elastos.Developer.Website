+++
title = "Ethereum sidechain"
date = 2019-05-24T21:15:40+02:00
weight = 60
chapter = false
pre = ""
alwaysopen = false
+++

{{< ownership "BoCheng BenjaminPiette" >}}

{{< todo "@BPI reference the ethereum guide to let developer do the required setup at first." >}}
{{< todo "@BPI make sure all steps work flawlessly. For now if i type 'geth xxx' or 'curl xxxx' (for eth_getbalance()) both commands fail." >}}

## Introduction

Ethereum sidechain is an Elastos Sidechain based on Go Ethereum v1.8.17.

The RPC API is conformity to [the Ethereum JSON RPC specs](https://github.com/ethereum/wiki/wiki/JSON-RPC)

## JSON RPC API

[JSON](http://json.org/) is a lightweight data-interchange format. It can represent numbers, strings, ordered sequences of values, and collections of name/value pairs.

[JSON-RPC](http://www.jsonrpc.org/specification) is a stateless, light-weight remote procedure call (RPC) protocol. Primarily this specification defines several data structures and the rules around their processing. It is transport agnostic in that the concepts can be used within the same process, over sockets, over HTTP, or in many various message passing environments. It uses JSON ([RFC 4627](https://www.ietf.org/rfc/rfc4627.txt)) as data format.

## JavaScript API

To talk to an elastos-eth  node from inside a JavaScript application use the [web3.js](https://github.com/ethereum/web3.js) library, which gives a convenient interface for the RPC methods. See the [JavaScript API](https://github.com/ethereum/wiki/wiki/JavaScript-API) for more.

## JSON-RPC Endpoint

Default JSON-RPC endpoints:[http://localhost:20636](http://localhost:20636)

You can start the HTTP JSON-RPC with the --rpc flag

    geth --rpc

change the default port (20636) and listing address (localhost) with:

    geth --rpc --rpcaddr <ip> --rpcport <portnumber>

If accessing the RPC from a browser, CORS will need to be enabled with the appropriate domain set. Otherwise, JavaScript calls are limit by the same-origin policy and requests will fail:

    geth --rpc --rpccorsdomain "http://localhost:3000"

The JSON RPC can also be started from the [geth console](https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console) using the admin.startRPC(addr, port) command.

## JSON-RPC support

The elastos-eth suport: JSON-RPC 2.0, Batch requests, HTTP, IPC, WS.

## HEX value encoding

At present there are two key datatypes that are passed over JSON: unformatted byte arrays and quantities. Both are passed with a hex encoding, however with different requirements to formatting:

When encoding **QUANTITIES** (integers, numbers): encode as hex, prefix with "0x", the most compact representation (slight exception: zero should be represented as "0x0"). Examples:

* 0x41 (65 in decimal)
* 0x400 (1024 in decimal)
* WRONG: 0x (should always have at least one digit - zero is "0x0")
* WRONG: 0x0400 (no leading zeroes allowed)
* WRONG: ff (must be prefixed 0x)

When encoding **QUNFORMATTED DATA** (byte arrays, account addresses, hashes, bytecode arrays): encode as hex, prefix with "0x", two hex digits per byte. Examples:

* 0x41 (size 1, "A")
* 0x004200 (size 3, "\0B\0")
* 0x (size 0, "")
* WRONG: 0xf0f0f (must be even number of digits)
* WRONG: 004200 (must be prefixed 0x)

## Commonly used API

### eth_getBalance

Returns the balance of the account of given address.

#### Parameters

1. `DATA`, 20 Bytes - address to check for balance.
2. `QUANTITY|TAG` - integer block number, or the string`"latest"`, `"earliest"` or `"pending"`, see the default block parameter

#### Example Parameters

    params: [
        '0xc94770007dda54cF92009BFF0dE90c06F603a09f',
        'latest'
    ]

#### Returns

`QUANTITY` - integer of the current balance in wei.

#### Example

    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0xc94770007dda54cF92009BFF0dE90c06F603a09f", "latest"],"id":1}'
       
    // Result
    {
      "id":1,
      "jsonrpc": "2.0",
      "result": "0x0234c8a3397aab58" // 158972490234375000
    }

### eth_gasPrice

Returns the current price per gas in wei.

#### Parameters

none

#### Returns

QUANTITY - integer of the current gas price in wei.

#### Example

    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}'

    // Result
    {
      "id":73,
      "jsonrpc": "2.0",
      "result": "0x09184e72a000" // 10000000000000
    }

### eth_getBlockByHash

Returns information about a block by hash.

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

#### Example

    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByHash","params":["0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331", true],"id":1}'

    // Result
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

## More RPC API

[JSON-RPC](https://github.com/ethereum/wiki/wiki/JSON-RPC)