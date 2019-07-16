+++
title = "Deployment"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}

When your application is ready for deployment, you need to go live to the mainnet. Be aware that once on the mainnet, all transactions in ELA become use real money, so make sure that your app is ready for that.

## Checklist before going live

{{< todo >}}

## Switching from testnet to mainnet

While **testnet** provides you with everything you need to start building your app quickly, running your app on **mainnet** requires to have your own local node running as part of the ecosystem and act as a trust zone. 

For this, there are a few steps you need to do:

### Get your own server ready

You have to run your own server/VPS on AWS or any hosting service you want. That server will run all the necessary nodes Elastos needs, and your app will connect to that server that will act as a bridge to the whole Elastos/blockchain ecosystem.

### Install the Elastos ecosystem on your server

{{< todo "Explain how to install and configure everything needed on a private server, so that all client libraries in the client app can work" >}}

### Switch your app to use your server

Now it's time to let your app use **mainnet**. For this, it will go through your private server.

{{< todo "Explain how to configure the cli to use private server's ip address and switch to that mainnet" >}}
