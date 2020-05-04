+++
title = "Nucleus Console setup"
date = 2020-01-14
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++ 

## Details about the Nucleus Console
- Repo: [https://github.com/cyber-republic/elastos-nucleus](https://github.com/cyber-republic/elastos-nucleus)
- Note: Always use the latest tag instead of master branch for a stable release
- For the following setup, we'll be using v1.0.0 tag at [https://github.com/cyber-republic/elastos-nucleus/tree/v1.0.0](https://github.com/cyber-republic/elastos-nucleus/tree/v1.0.0)

## Prerequisites
- Install Docker. Refer to [https://docs.docker.com/install/](https://docs.docker.com/install/)
- Check out the code from github:

```
git clone https://github.com/cyber-republic/elastos-nucleus;
cd elastos-nucleus;
git checkout v1.0.0
```

## Setup
This will setup the Nucleus Console(a website written using Django Python web framework) that interacts with the Elastos Smartweb Service(which in turn interacts with Elastos Private Net) on localhost to provide a nice web interface for various services. In addition, the website also provides support for various elastOS tools, has browsers available for mainchain and all the sidechains for GMUnet, testnet(COMING SOON) and mainnet(COMING SOON).
```
cp .env.example .env;
./run.sh
```
For detailed info, please visit [https://github.com/cyber-republic/elastos-nucleus/tree/v1.0.0](https://github.com/cyber-republic/elastos-nucleus/tree/v1.0.0)


