+++
title = "Quick start"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

## Create your elastOS capsule

As a first step, check {{< internallink "how to create, run and debug a elastOS capsule" "build/elastOS/setup/_index.md" >}} using the trinity-cli.

**Note**: Even if all guides explain how to build and run **inside elastOS**, you are free to **never actually run your dApp inside elastOS** and directly build it and develop it as a native app.

## Get the Trinity native tool

Make sure to always get the latest script because there may be changes put in between the last time you downloaded it to today.
```
wget -O build https://raw.githubusercontent.com/elastos/Elastos.Trinity.ToolChains/master/native/bin/build && chmod +x build
```

You can learn more about what the script does and some helpful commands with:
```
./build -h
```

## Configure your dApp for Trinity native

The Trinity native tool chain requires a configuration file in your elastOS dApp, with a few information inside:

**File location**: [Your dApp folder]/trinitynative.json

**Content**:

    {
        "build": {
            "out": "./native-out"
        },
        "application": {
            "name": "Elastos DID Demo",
            "nativepackageid": "org.elastos.trinity.dapp.diddemo",
            "icon": "./src/assets/images/logo.png",
            "splashscreen": "./native/splash.png",
            "intentscheme": {
                "scheme": "https",
                "path": "diddemo.trinity-tech.io"
            },
            "version": {
                "code": 12346,
                "name": "1.2.3"
            }
        }
    }

**Description**:

| Field | Description |
| ----- | ----------- |
| build.out | Folder in which all native projects will be generated. Relative to the config file. |
| application.name | App name as it will appear on android and iOS devices. |
| application.nativepackageid | Native package ID on android and iOS. **Important**: you cannot change this package id in the future, otherwise you won't be able to update your native app on native app stores. |
| application.icon | App icon as is will appear on android and iOS devices. Please run trinity-native tooling to get more info about the expected format. |
| application.splashscreen | Main splash screen shown when the app starts. Please run trinity-native tooling to get more info about the expected format. |
| application.intentscheme | **See below.** |
| application.version | Version code (number) and version name (user friendly) to be used on native stores. |

## About the intent scheme

Trinity native dApps are decentralized and run in the Elastos ecosystem. This means that end users have a decentralized identity (DID), a decentralized wallet, etc.

The **elastOS** application contains all those capsules and must be **used as a toolbox** to provide those identity, wallet, hive and other services.

This means that most likely, your application will need to **depend on end users having elastOS or elastOS Essentials installed on their device**, because **your native app will call elastOS** to let users sign in (if it requires sign in), and get responses from elastOS.

**Note:** In case elastOS is not installed, users are redirected to a web page that recommends them to get elastOS first. This is similar to when users want to use ethereum / smart contracts, they need the metamask plugin in their browser.

**So what are intent schemes?**

A intent scheme is a base url, that your native application can catch on the native platform, in order to execute actions. For example, elastOS itself handles a **did.elastos.net** scheme in order to receive "DID sign in" requests from other apps. Similarly, your native app can choose to provide actions for others.

Let's take the Hyper IM dApp for example. If this dApp is built as native and wants to share invitation links with other users on traditional social networks, it may share links such as https://app.hyper.org/invitefriend?friendid=.

For this, Hyper must define a intent scheme like this:

    "intentscheme": {
        "scheme": "https",
        "path": "app.hyper.org"
    }

* When a user clicks such link on telegram, if hyper IM native is not installed, this will open the hyper.org web page and hyper developers can recommend end users to download hyper IM first.
* If Hyper IM native is installed, then this directly opens the Hyper IM application, and the Hyper IM ionic dApp contained inside the Hyper IM native app receives the "invitefriend" intent and can proceed to the necessary action.

## Registering the application DID

For security reasons, when elastOS needs to handle sign in, payments or hive authentication requests, it needs to ensure to send responses back to the right native application.

When calling appManager.sendIntent() from a trinity native dApp, the trinity runtime defines a "redirecturl" to receive the intent response from elastOS. That redirecturl is composed with the "intentscheme". This way, elastOS (or another trinity-native dApp) will send the response back to your application to the intent scheme defined earlier.

To make this flow more secure, some steps are necessary (only the very first time):

* Open the elastOS **dApps developer tools dApp** and create a new app.
* Set the **native redirect url** field to match your intent scheme. In the Hyper IM example above, that would be: https://app.hyper.org
* Publish the application DID on the DID sidechain
* Copy your application DID and update your dApp's manifest.json with a "did" entry like this:

```json
{
    ...
    "did":"did:elastos:yourappdid"
    ...
}
```

The trinity runtime will get this DID from your application and make sure that the redirecturl used for intent responses match the redirect url configured in your application DID on chain.

## Configuring your domain for iOS apps

In order to be activated/opened from a URL link (including intent responses sent by elastOS after a sign in or payment), you need to upload a special file on your web domain. This file must reference the APP ID of your application created on the apple developer portal, in order to proove that you own both the application and the domain. Without this, iOS will not let your application open urls, and your application won't be able to receive intent responses from elastOS. Application identifiers can be created and managed at https://developer.apple.com/account/resources/identifiers/list and are a mandatory step before publishing the applicaiton on the iOS app store.

Here is a sample file. The file must be named **apple-app-site-association** and be uploaded at the root or your configured **redirect url** (ex: https://app.hyper.org/apple-app-site-association):

```json
{
    "applinks": {
        "apps": [],
        "details": [
            {
                "appID": "X3ZZSKA63E.org.hyper.app",
                "paths": ["*"]
            }
        ]
    }
}
```

## Build your native app

It is very easy to build your native app. You can either pass an absolute or relative path to the location of where your elastOS capsule is located:
```
./build -p ../Elastos.Trinity.DApps.Demo.DID
```
or
```
./build -p /home/user/github.com/elastos/Elastos.Trinity.DApps.Demo.DID
```

If you would like to first update your system before running the script, you can pass -u flag to the script:
```
./build -p ../Elastos.Trinity.DApps.Demo.DID -u yes
```

By default, Elastos.Trinity repository(that is involved in the build process) is saved to your ${HOME}/.trinity-native directory. If you want to get the latest changes from Elastos.Trinity before building your script, you can pass -t flag to the script:
```
./build -p ../Elastos.Trinity.DApps.Demo.DID -t yes
```

NOTE: You can combine multiple flags too. If you would like to update your system and update Elastos.Trinity repository before building your script, you would execute:
```
./build -p ../Elastos.Trinity.DApps.Demo.DID -u yes -t yes
```

## Open and run your native projects

At the end of the build command, the trinity-native tools tells you where the projects have been generated. Open them and run them as for any other native app in Android Studio, XCode or other tools.