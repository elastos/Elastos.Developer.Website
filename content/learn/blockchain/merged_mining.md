+++
title = "ELA Merged Mining"
date = 2019-05-24T21:15:52+02:00
weight = 15
chapter = false
pre = ""
alwaysopen = true
+++

Elastos implements the same merged mining specification as {{< externallink title="Namecoin" >}}https://www.namecoin.org{{< /externallink >}}. 

#### As an auxiliary chain, the chain id of ELA is `1224`.

### For an In-Depth Intro Watch This Video:

{{< youtube rBhk93MSOV4 >}}

The merged mining of ela node is mainly implemented through the following two interfaces:

- {{< externallink title="createauxblock" >}}https://github.com/elastos/Elastos.ELA/blob/master/docs/jsonrpc_apis.md#createauxblock{{< /externallink >}}

- {{< externallink title="submitauxblock" >}}https://github.com/elastos/Elastos.ELA/blob/master/docs/jsonrpc_apis.md#submitauxblock{{< /externallink >}}

1. Get the auxblock hash and chain id through `createauxblock` interface.
2. Write the auxblock hash into the coinbase of bitcoin. if there are multiple auxiliary chains, write the merkle root which generated with their auxblock hashes instead. Refer to the merged mining specification.
3. Check if the bitcoin block header which contains the auxblock hash meets the ela difficulty.
4. Send the proof of work (auxpow) to ela node which meets the ela difficulty through `submitauxblock` interface.

Ela node does not implement a real-time notification of the task updates by ZMQ, so `createauxblock` needs to be periodically rotated from the mine pool, such as every 10 seconds.

##### Merged mining specification： https://en.bitcoin.it/wiki/Merged_mining_specification

{{< spacer 8 >}}
