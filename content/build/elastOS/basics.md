+++
title = "Basics"
weight = 5
chapter = false
pre = ""
alwaysopen = false
+++

##  The elastOS native application

The Elastos browser, also know as elastOS, is for now a native **Android or iOS application** that has to be launched to enter the whole Elastos ecosystem of capsules and services.

This browser can run capsules independently and securely, and provides access to all of the Elastos modules such as:
 
- Hive
- Carrier
- Ethereum Sidechain
- DID sidechain (Identity)
- DMA

{{< rawspan fontweight="400" >}}<i>Usually through cordova/ionic plugins</i>{{< /rawspan >}}

**The development codename for elastOS is Trinity.**

You will notice a lot of the tools and repos are named "trinity", this is analagous to {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}}.

### Capsules inside elastOS

**elastOS** capsules are dApps, we call them **"capsules"**.

Similarly to android and iOS home screens, elastOS provides a way to browse installed capsules, find and install new capsules, uninstall them. 

Capsules also have several ways to interact with each other while keeping their content secure. 

All together, this creates a great user experience from inside the elastOS browser.

- use our included **trinity-cli** tool to easily package and deploy your capsules  

- {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} capsules must be written in {{< externallink title="Ionic 4.0 using React or Angular" >}}https://ionicframework.com{{< /externallink >}}

    {{< notice note >}}
        {{< rawspan fontweight="400" >}}There is a bug in the React template right now{{< /rawspan >}}, temporarily you must import <b>appManager</b>:
        <code>declare const appManager: AppManagerPlugin.AppManager</code><br/>
        <br/>
        Then ensure we set visibility to show on App mount (within React.Component Parent App):
        <code>
            useEffect(() => {
                appManager.setVisible("show")
            }, [])
        </code>
    {{</ notice >}}

- by default external requests are blocked, you must whitelist URLs in the `manifest.json` and even then users will be prompted to approve the connection through a native pop-up

- your capsule can access a **suite of plugins** to use native features such as the:
    
    - camera
    - fingerprint reader
    - QR scanner
    - storage and other common Cordova plugins
    
- {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} provides a set of custom plugins to access the Elastos ecosystem

    - Hive Storage
    - DID Sidechain
    - ETH Sidechain - **Coming Soon**

{{< hero >}}
    {{< heroitem link="https://developer.elastos.org/references/trinity_plugins/index.html" linkBlank="true" >}}
        <h5>Preview the Plugins API Here</h5>
    {{< /heroitem >}}

    {{< heroitem link="/build/elastos/setup/environment_setup" rightArrow="true" >}}
        <h5>Let's Setup Your Environment First</h5>
    {{< /heroitem >}}
{{< /hero >}}

