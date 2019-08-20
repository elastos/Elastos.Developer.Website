+++
title = "Elastos scheme"
date = 2019-05-24T21:15:40+02:00
weight = 9
chapter = false
pre = ""
alwaysopen = false
+++

{{< ownership "BenjaminPiette" >}}

{{< todo "@BPI info about appid generation - refer to the appid setup page" >}}

## Introduction

The Elastos wallet scheme is the way for DApps to request operations to be completed by an Elastos wallet, on behalf of the user. For example, if your DApp wishes to request a payment from a user, it will call the payment scheme, which will open the installed wallet app, which will proceed to the payment (because it's the only one to know private user information), and send the payment confirmation to your app.

Schemes and parameters are the same for all programming environments. Nevertheless, the way to call them and get response changes. 

The full reference is available {{< internallink "here" "elastos_core_services/reference/wallet_scheme.md" >}}.

## Pick a wallet app that implements schemes

Currently, only the Elephant wallet implements the Elastos scheme and provides features for payment, signing, and more. You (and your users) must install it on your mobile device (if you are building a mobile app) in order to be able to handle elastos scheme calls.

## Call a scheme

{{< todo "@BPI @SongSJun" >}}

{{< tabs >}} 
    {{< tab name="Kotlin" codelang="kotlin" >}} 
Explain how to use an intent to launch the scheme url
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
Explain how to launch an url
    {{< /tab>}}
{{< /tabs >}}

## Handle response

{{< todo "@BPI @SongSJun" >}}

{{< tabs >}} 
    {{< tab name="Kotlin" codelang="kotlin" >}} 
Explain how to receive response after coming back to the app
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
Explain how to receive response after coming back to the app
    {{< /tab>}}
{{< /tabs >}}
