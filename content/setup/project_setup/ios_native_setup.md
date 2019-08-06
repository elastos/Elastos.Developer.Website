+++
title = "iOS native app setup"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++ 


## Cocoapod installation

### Import cocoapod projects

Add the following lines to your podfile:

    pod 'ElastosCarrierSDK'
    pod 'ElastosHiveSDK'

{{< todo "Add pods for eth, neo, etc" >}}

Then run the following command from your shell:

    $ pod install

### Add shell scripts for code signing

In the project navigator, select tab **Build Phases** in the specific **TARGET** item. Then click + button on the right-top corner to choose **New Run Script Phase** and expand it to add shell scripts as below:

    "${SRCROOT}/Pods/ElastosCarrierSDK/ElastosCarrier-framework/CocoaPods/codesigncarrierframework.sh"
