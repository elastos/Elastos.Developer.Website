+++
title = "Wallet API"
date = 2019-05-24T21:15:46+02:00
weight = 10
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++

Welcome to the React Native Elastos Wallet Bridges! You can use our bridges in javascript to access Elastos Wallet Core RPC endpoints, which can interact with Elastos Blockchain.




{{< apititle "CreateMultiSignMasterWallet">}}

{{< apidescription >}}
Creates a multi-signature wallet.
{{< /apidescription >}}

{{< apiparams >}}
| Parameter | Description |
| --------- | ----------- |
| masterWallet | One of masterWallet which is participated in Multi-Sign | 
| privKey | masterWallet privKey |
{{< /apiparams >}}

{{< highlight typescript>}} 
import RNElastosMainchain from 'react-native-elastos-wallet-core';

RNElastosMainchain.CreateMultiSignMasterWallet(
    masterWallet, 
    privKey, 
    payPassword, 
    coSigners, 
    requiredSignCount, 
    (err, res) => {
        console.log(res); //expect "success"
    }
);
{{< /highlight >}}

{{< apireturns >}}
Returns a cool struct 
{{< /apireturns >}}