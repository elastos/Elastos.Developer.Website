+++
title = "Wallet API"
date = 2019-05-24T21:15:46+02:00
weight = 10
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++

C++ version of the API


{{< apititle "CreateMultiSignMasterWallet">}}

{{< apidescription >}}
Creates a multi-signature wallet. 

**THIS IS JUST AN EXAMPLE. FEEL FREE TO ADD/REMOVE SECTION IF NEEDED, BUT STICK ON THE "API"xxx SHORTCODES**
{{< /apidescription >}}

{{< apiheader "Parameters" >}}

{{< apiparams >}}
| Parameter | Description |
| --------- | ----------- |
| masterWallet | One of masterWallet which is participated in Multi-Sign | 
| privKey | masterWallet privKey |
{{< /apiparams >}}

{{< apiheader "Returns" >}}

{{< apireturns >}}
Returns a cool structure.
{{< /apireturns >}}

{{< apiheader "Function call" >}}

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

{{< apiheader "Example response" >}}

{{< highlight "json" >}}
    {
        "result":{
            "vsize":346,
            "locktime":0,
            "txid":"62637968e72b06e4fa1de91542a3b71bd2462ba1d29e9c14c2ecfd042d1937ab",
            "confirmations":6756,
            "type":8,
            "version":0,
        }
    }
{{< /highlight >}}
