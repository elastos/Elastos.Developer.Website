+++
title = "Debugging native dApps"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

## How to quickly develop and debug?

Trinity native dApps can {{< internallink "take advantage of the Trinity CLI" "build/elastOS/setup/running/running_debugging/_index.md" >}} (command line tool) similarly to when dApps are developed to run inside elastOS.

### Preliminary steps

* The native dApp must be built with the trinity native tool chain
* The native dApp must be installed on the device once

### Android debug

From the dApp folder, run this command:

    trinity-cli run -p android

or

    trinity-cli run -p android --nodebug

If connected properly, the android device will ask you to either continue the action using elastOS, or using your native dApp. Choose your native dApp from the prompt.

Restart your dApp as suggested, and you updated dApp content will show.

### iOS debug

{{< todo "The CLI must be updated to support this" >}}