+++
title = "Basics"
weight = 5
chapter = false
pre = ""
alwaysopen = false
+++

##  The elastOS application

The Elastos browser, also know as **elastOS**, is a native **Android application** that has to be launched to enter the whole Elastos ecosystem of capsules and services. Its cousin for iOS, named **elastOS Essentials**, is a restricted version that complies with Apple guidelines. This iOS version cannot download or run third party capsules and instead, is mostly used as a super wallet for end users identity, storage space and tokens wallet. **elastOS** android is this same *companion*, plus a fully integrated capsule browser.

The elastOS browser (android) can run capsules independently and securely, and provides access to all of the Elastos modules (usually through cordova/ionic plugins) such as:

- DID (Decentralized Identity)
- Hive
- Carrier
- Ethereum Sidechain
- ELA Mainchain

**The development codename for elastOS is Trinity.**

On github, you will notice a lot of the tools and repos are named "trinity", this is analagous to {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}}.

### Capsules inside elastOS

**elastOS** capsules are dApps, we call them **"capsules"**.

Similarly to android and iOS home screens, elastOS provides a way to browse installed capsules, find and install new capsules, uninstall them.

Capsules also have several ways to interact with each other while keeping their content secure.

All together, this creates a great user experience from inside the elastOS browser.

- use our included **trinity-cli** tool to easily package and deploy your capsules.

- {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} capsules must be written in {{< externallink title="Ionic 4.0 using React or Angular" >}}https://ionicframework.com{{< /externallink >}}

- your capsule can access a **suite of plugins** to use native features such as the:

    - Camera
    - Fingerprint reader
    - QR scanner
    - Storage and other common Cordova plugins

- {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} provides a set of custom plugins to access the Elastos ecosystem

    - Decentralized identity
    - Hive Storage
    - Carrier communications
    - ETH Sidechain
    - ELA mainchain

{{< hero >}}
    {{< heroitem link="https://developer.elastos.org/references/trinity_plugins/index.html" linkBlank="true" >}}
        <h5>Preview the Plugins API Here</h5>
    {{< /heroitem >}}

    {{< heroitem link="/build/elastos/setup/environment_setup" rightArrow="true" >}}
        <h5>Let's Setup Your Environment First</h5>
    {{< /heroitem >}}
{{< /hero >}}

