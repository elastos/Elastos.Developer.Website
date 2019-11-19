+++
title = "Inter-app communication"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

{{< todo "Need to refine all of this - more details and examples (JWT encoding/decoding) when more mature" >}}

## Trinity intents

Similarly to Android that provides a great architecture, Trinity has a **intent** mechanism that allows DApps to communicate with each other. Intents are needed for various kind of actions, such as requesting user to make a purchase, sign with his email address, handle a scanned QR code, rating a DApp through the DApp store app, and much more.

### Trinity intents and Elastos scheme

{{< todo "Link to the elastos scheme API reference" >}}

Trinity conforms to the Elastos scheme. Most standard commands are handled by built-in DApps. For example, the /pay command will be handled by the wallet DApp to start a payment, or /credaccess will be handled by the DID DApps to request user to share credentials with the requesting DApp.

In addition, Trinity has a few custom scheme commands, specific to Trinity itself, such as opening DApp details pages in the DApp store in order to rate it.

### Sending intents

Sending intents is done through the AppManager plugin. Here is an example:

    declare let appManager: any;

    appManager.sendUrlIntent("elastos://schemecommand/JWT", function() {
        // Intent was handled by another app
    }, (err)=>{
        // Something wrong happened
    })

    // or

    appManager.sendIntent("action", {mydata: datavalue}, function() {
        // Intent was handled by another app
    }, (err)=>{
        // Something wrong happened
    })


### Handling intents

Your DApp must declare which intents it can handle in its manifest.json:

    "intent_filters": [
        {
            "action": "pay" // Example of Elastos scheme action handled by the wallet DApp
        }       
    ]

Then in your app code, register an intent listener to know when an intent is received:

    appManager.setIntentListener(function(intent){
        // intent.action, intent.params, intent.fromId

        switch (ret.action) {
            case "pay":
                // Do something
        }
    });
