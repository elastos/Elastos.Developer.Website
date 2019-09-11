+++
title = "Setup Develap Tool"
date = 2019-09-10T21:15:33+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++ 

A tool called "Develap" is available that helps in setting up a local environment to connect to main chain, did sidechain, eth sidechain, token sidechain, neo sidechain, etc to either mainnet, testnet or private net

### Prerequisites
- Install Docker Engine
    - [Install Docker Engine for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
    - [Install Docker Engine for Mac](https://docs.docker.com/docker-for-mac/install/)
    - [Install Docker Engine for Windows](https://docs.docker.com/docker-for-windows/install/)
    - For other platforms, check out [https://docs.docker.com/install/](https://docs.docker.com/install/)
- Start docker after installation

### Download develap tool
Download the latest release specific to your platform from [https://github.com/cyber-republic/develap/releases](https://github.com/cyber-republic/develap/releases). This guide will use linux_amd64 however, the process is the same for darwin_amd64 and windows_amd64. For more info about the code repository, please visit [https://github.com/cyber-republic/develap](https://github.com/cyber-republic/develap)

### Extract the zip file
```
unzip linux_amd64-*.zip
```
The develap tool and associated config files should be unzipped to the directory linux_amd64

### Interact with develap tool
- Change directory

    ```bash
    cd linux_amd64
    ```
- Get a more detailed list of commands and parameters

    ```bash
    ./develap --help
    ```
- Run a testnet environment with mainchain, did, token and eth nodes

    ```bash
    ./develap blockchain run -e testnet -n mainchain,did,token,eth
    ```
- Run a testnet environment with mainchain node

    ```bash
    ./develap blockchain run -e testnet -n mainchain
    ```
- Run a mainnet environment with did node

    ```bash
    ./develap blockchain run -e mainnet -n did
    ```
- Kill token node on mainnet environment
    
    ```bash
    ./develap blockchain kill -e mainnet -n token
    ```
- Kill all the nodes on testnet environment
    
    ```bash
    ./develap blockchain kill -e testnet`
    ```
- Show all the nodes currently running in mainnet environment
    
    ```bash
    ./develap blockchain list -e mainnet
    ```