+++
title = "Inter-App Communication"
weight = 30
chapter = false
pre = ""
alwaysopen = true
+++

{{< todo "Need to refine all of this - more details and examples (JWT encoding/decoding) when more mature" >}}

## elastOS intents

Intents are a way to **let capsules communicate with each other** without really knowing each other. For example, a capsule can send a "pay" intent request, that follows the elastos scheme standardized definition, and another capsule can catch this intent to handle the payment. 

But the initiating capsule doesn't really know which capsule will realize this operation. As a consequence, several applications being able to handle the pay intent (wallet capsule in our case) could exist in elastOS, and the user could choose which of them he wants to use to proceed to the payment.

## What can you do with those intents?

You can either:

* **Send intents** to request other capsules to do something (ex: pay, if you want to let your users purchase something)
* Or **handle intents** (using intent filters in your manifest) to handle actions requested by other capsules (ex: handle "handlescannedcontent_did" if you want to do something when a end user scans a QR code in elastOS).

### elastOS intents and Elastos scheme

{{< hero >}}
    {{< heroitem link="/build/elastos_scheme" rightArrow="true" >}}
        <h5>Elastos Scheme</h5>
    {{< /heroitem >}}
{{< /hero >}}

elastOS conforms to the Elastos scheme. Most standard commands are handled by built-in capsules. For example, the /pay command will be handled by the wallet capsule to start a payment, or /credaccess will be handled by the DID capsule to request user to share credentials with the requesting capsule.

In addition, elastOS has a few custom scheme commands, specific to elastOS itself, such as opening capsule details pages in the capsule store in order to rate it.

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

Your capsule must declare which intents it can handle in its manifest.json:

    "intent_filters": [
        {
            "action": "pay" // Example of Elastos scheme action handled by the wallet capsule
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
    {{< heroitem link="/build/elastos/guides/interapp_communication/available_intents" rightArrow="true" >}}
        <h5>Supported Intents</h5>
    {{< /heroitem >}}
{{< /hero >}}
