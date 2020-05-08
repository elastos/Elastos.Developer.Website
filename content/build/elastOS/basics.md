+++
title = "Basics"
weight = 5
chapter = false
pre = ""
alwaysopen = false
+++

##### The development codename for {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} is **Trinity**

You will notice a lot of the tools and repos are named "trinity", this is analagous to {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}}.

### {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} capsules are dApps, we call them **"capsules"**

- use our included **trinity-cli** tool to easily package and deploy your capsules  

- {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} capsules must be written in {{< externallink title="Ionic 4.0 using React or Angular" >}}https://ionicframework.com{{< /externallink >}}

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

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem link="https://developer.elastos.org/references/trinity_plugins/index.html" linkBlank="true" >}}
            <h5>Preview the Plugins API Here</h5>
        {{< /heroitem >}}

    {{< heroitem link="/build/elastos/setup/environment_setup" rightArrow="true" >}}
        <h5>Let's Setup Your Environment First</h5>
    {{< /heroitem >}}
{{< /hero >}}
