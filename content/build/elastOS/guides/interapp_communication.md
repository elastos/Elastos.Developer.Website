+++
title = "Inter-app communication"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

{{< todo "Need to refine all of this - more details and examples (JWT encoding/decoding) when more mature" >}}

## elastOS intents

Similarly to Android that provides a great architecture, elastOS has a **intent** mechanism that allows DApps to communicate with each other. Intents are needed for various kind of actions, such as requesting user to make a purchase, sign with his email address, handle a scanned QR code, rating a DApp through the DApp store app, and much more.

### elastOS intents and Elastos scheme

{{< todo "Link to the elastos scheme API reference" >}}

elastOS conforms to the Elastos scheme. Most standard commands are handled by built-in DApps. For example, the /pay command will be handled by the wallet DApp to start a payment, or /credaccess will be handled by the DID DApps to request user to share credentials with the requesting DApp.

In addition, elastOS has a few custom scheme commands, specific to elastOS itself, such as opening DApp details pages in the DApp store in order to rate it.

### Sending intents

Sending intents is done through the AppManager plugin. Here is an example:

    declare let appManager: AppManagerPlugin.AppManager;

    appManager.sendUrlIntent("elastos://schemecommand/JWT", (response: any) => {
        // Intent was handled by another app and response data is returned
    }, (err) => {
        // Something wrong happened
    })

    // or

    appManager.sendIntent("action", {mydata: datavalue}, null, (response: any) => {
        // Intent was handled by another app and response data is returned
    }, (err) => {
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

In order to do the proper UI routing when your app starts, you can also use the following method to know if your app was started by clicking on its main icon, or by and intent request:

    appManager.hasPendingIntent((hasPendingIntent)=>{
        // Route your app to the right screen here: home screen, or intent screen.
    }, (err:any)=>{
        // Error case.
    });
    
{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem link="/build/elastos/guides/available_intents" rightArrow="true" >}}
        <h5>Supported Intents</h5>
    {{< /heroitem >}}
{{< /hero >}}
