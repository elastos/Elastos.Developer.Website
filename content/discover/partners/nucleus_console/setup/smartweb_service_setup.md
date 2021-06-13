+++
title = "Elastos Smartweb Service setup"
date = 2020-01-14
weight = 20
chapter = false
pre = ""
alwaysopen = true
+++ 

## Details about the Elastos Smartweb Service
- Repo: [https://github.com/cyber-republic/elastos-smartweb-service](https://github.com/cyber-republic/elastos-smartweb-service)
- Note: Always use the latest tag instead of master branch for a stable release
- For the following setup, we'll be using v1.0.0 tag at [https://github.com/cyber-republic/elastos-smartweb-service/tree/v1.0.0](https://github.com/cyber-republic/elastos-smartweb-service/tree/v1.0.0)

## Prerequisites
- Install Docker. Refer to [https://docs.docker.com/install/](https://docs.docker.com/install/)
- Check out the code from github:

```
git clone https://github.com/cyber-republic/elastos-smartweb-service;
cd elastos-smartweb-service;
git checkout v1.0.0
```

## Setup
This will setup the Elastos Smartweb Service(a gRPC server written in python) that interacts with the private net setup on localhost. More specifically, it interacts with the mainchain node, DID sidechain node, Token sidechain node, ETH sidechain node and Hive IPFS node and creates an entirely new set of API endpoints that can be interacted with from any clients written in multiple languages such as Python, Golang, etc. 
Some of the client libraries that are available as of today are:
- Python: [https://github.com/cyber-republic/python-grpc-adenine](https://github.com/cyber-republic/python-grpc-adenine)
NOTE: Nucleus Console uses the Python client library to interact with Elastos Smartweb Service.
```
cp .env.example .env;
./run.sh
```
For detailed info, please visit [https://github.com/cyber-republic/elastos-smartweb-service/tree/v1.0.0](https://github.com/cyber-republic/elastos-smartweb-service/tree/v1.0.0)
