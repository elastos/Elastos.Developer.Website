+++
title = "Private Network setup"
date = 2020-01-14
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++ 

## Details about the Elastos Private Network
- Repo: [https://github.com/cyber-republic/elastos-privnet](https://github.com/cyber-republic/elastos-privnet)
- Note: Always use the latest tag instead of master branch for a stable release
- For the following setup, we'll be using v0.6 tag at [https://github.com/cyber-republic/elastos-privnet/tree/v0.6](https://github.com/cyber-republic/elastos-privnet)

## Prerequisites
- Install Docker. Refer to [https://docs.docker.com/install/](https://docs.docker.com/install/)
- Install Docker Compose. Refer to [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
- Check out the code from github:

```
git clone https://github.com/cyber-republic/elastos-privnet;
cd elastos-privnet;
git checkout v0.6
```

## Setup
This will setup the entire elastos private net on your local machine that includes: 5 mainchain nodes, 1 DID sidechain node, 1 Token sidechain node, 1 ETH sidechain node, 1 ETH sidechain oracle node, 4 arbitrator nodes, 1 wallet service(with mainchain-did cross chain transfer), 1 wallet service(with mainchain-token cross chain transfer), 1 sidechain service(for DID sidechain), 1 Misc Service for mainchain, 1 Misc Service for DID Sidechain and 1 Mysql database that interacts with both of the Misc Services. 
Note: You only need mainchain nodes, arbitrator nodes and sidechain nodes to setup the Elastos Private Network however, the other services are also setup to provide an easy interface to the blockchain and sidechain nodes. 
```
cd blockchain;
mkdir /data/volumes;
sudo tools/copy_freshdata_docker.sh
docker-compose up --remove-orphans --build --force-recreate -d
```
For detailed info, please visit [https://github.com/cyber-republic/elastos-privnet/tree/v0.6/blockchain](https://github.com/cyber-republic/elastos-privnet/tree/v0.6/blockchain)

## Verify the private network is running successfully
- Check foundation mainchain wallet:
    
    ```
    curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"method":"getreceivedbyaddress","params":{"address":"ENqDYUYURsHpp1wQ8LBdTLba4JhEvSDXEw"}}' http://localhost:10014
    ```
    Should return 
    ```
    {
        "error": null,
        "id": null,
        "jsonrpc": "2.0",
        "result": "17001663.81432852"
    }
    ```
- Check Pre-loaded DID Sidechain Address:
    ```
    curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"method":"getreceivedbyaddress","params":{"address":"EKsSQae7goc5oGGxwvgbUxkMsiQhC9ZfJ3"}}' http://localhost:30113 
    ```

    Should return
    ```
    {
      "id": null,
      "jsonrpc": "2.0",
      "result": "100000",
      "error": null
    }  
    ```
- Check Pre-loaded Token Sidechain Address:
    ```
    curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"method":"getreceivedbyaddress","params":{"address":"EUscMawPCr8uFxKDtVxaq93Wbjm1DdtzeW"}}' http://localhost:40113
    ```

    Should return
    ```
    {
      "id": null,
      "jsonrpc": "2.0",
      "result": {
        "a3d0eaa466df74983b5d7c543de6904f4c9418ead5ffd6d25814234a96db37b0": "99999.99990000"
      },
      "error": null
    }
    ```

- Check Pre-loaded ETH Sidechain Address:
    ```
    curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x4505b967d56f84647eb3a40f7c365f7d87a88bc3", "latest"],"id":1}' localhost:60112
    ```
    
    Should return something like:
    ```
    {
      "jsonrpc": "2.0",
      "id": 1,
      "result": "0x152cf383e51ef1920000"
    }
    ```
    0x152cf383e51ef1920000 is 99998900000000000000000 in decimal format which is the unit in wei. This equals to 99998.9 ETH ELA