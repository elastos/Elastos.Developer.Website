+++
title = "Elastos schemes"
date = 2019-05-24T21:15:40+02:00
weight = 9
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++

{{< ownership "SongShiJun" >}}

{{< todo "explain what are schemes, how to call a scheme (for each platform), how to get response, and specific use cases for each platform" >}}

## Introduction

The Elastos wallet scheme is the way for DApps to request operations to be completed by an Elastos wallet, on behalf of the user. For example, if your DApp wishes to request a payment from a user, it will call the payment scheme, which will open the installed wallet app, which will proceed to the payment (because it's the only one to know private user information), and send the payment confirmation to your app.

Schemes and parameters are the sames for all programming environments. Nevertheless, the way to call them and get response changes. 

The full reference is available {{< internallink "here" "/reference/wallet_scheme.md" >}}.

Here is how to manage schemes calls in your programming environment:

## Call a scheme

{{< todo >}}

{{< tabs >}} 
    {{< tab name="Kotlin" codelang="kotlin" >}} 
Explain how to use an intent to launch the scheme url
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
Explain how to launch an url
    {{< /tab>}}
{{< /tabs >}}

## Handle response

{{< todo >}}

{{< tabs >}} 
    {{< tab name="Kotlin" codelang="kotlin" >}} 
Explain how to receive response after coming back to the app
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
Explain how to receive response after coming back to the app
    {{< /tab>}}
{{< /tabs >}}
