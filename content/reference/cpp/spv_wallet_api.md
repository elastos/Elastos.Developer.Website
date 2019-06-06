+++
title = "SPV Wallet API"
date = 2019-05-24T21:15:46+02:00
weight = 0
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++

{{< todo "This is just an example. Feel free to add/remove sections for each API, but use the api shortcodes to keep the documentation style consistent." >}}

C++ version of the API.

{{< apitocin >}}
# CreateMultiSignMasterWallet
{{< apitocout >}}
{{< apititle "CreateMultiSignMasterWallet" >}}

{{< apidescription >}}
Creates a multi-signature wallet. With the wallet you can this and that. In case or error, the returned value may be non significant. And sometimes it will also do that.
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



{{< apitocin >}}
# AnotherApi
{{< apitocout >}}
{{< apititle "AnotherApi" >}}

{{< apidescription >}}
Does something else.
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