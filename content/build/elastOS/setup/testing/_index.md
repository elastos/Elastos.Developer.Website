

+++
title = "Running Your dApp"
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

### elastOS is a Mobile Application That Runs Your dApp

Therefore you need to have elastOS running first, typically the way to do this is running an emulator, but of course you can also connect your Android phone to your computer. 

{{< notice note >}}
    {{< rawspan fontweight="400" >}}elastOS is not yet released for iOS,{{< /rawspan >}} therefore we will only be supporting Android at the moment
{{</ notice >}}

{{< spacer 1 >}}

### Running an Android Emulator

#### 1. Download Android Studio - {{< externallink title="https://developer.android.com/studio" >}}https://developer.android.com/studio{{< /externallink >}}

#### 2. Open AVD Manager and Add a Virtual Device 

Make sure the image you are using has **Play Store** support, which avoids us having to build and install the `elastOS.apk` file.

{{< figure src="/build/elastos/setup/testing/avd_manager.png" >}} 

Follow this guide for detailed instructions: {{< externallink title="https://developer.android.com/studio/run/emulator" >}}https://developer.android.com/studio/run/emulator{{< /externallink >}}

{{< spacer 2 >}}

#### 3. Now Run Your Virtual Device Emulator 

Clicking the **Green Arrow** circled in orange should launch a device, in this example I am using a Pixel 2 emulator. 

{{< figure src="/build/elastos/setup/testing/emulator.png" >}} 

{{< spacer 2 >}}

#### 4. Install elastOS from the Play Store

The emulator still needs a real Google account to access the play store, we recommend you create a new account for development.

- After you have access to Play Store, search for **elastOS** and install it.
    
    {{< rawspan imginline="true" >}}<img src="/build/elastos/setup/testing/elastOS_play-store.png"></img>{{< /rawspan >}}

{{< spacer 1 >}}

#### 5. Enable **Developer Mode** in the {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} app

{{< figure src="elastOS_dev-mode.png" >}}


#### 4. Verify that adb sees your emulator

`adb` is the Android Debug Bridge which is a command line tool that should be installed with Android Studio, 
for more information see: {{< externallink title="https://developer.android.com/studio/command-line/adb" >}}https://developer.android.com/studio/command-line/adb{{< /externallink >}}

    | ~/workspace/com.elajs.elastOS-dev-tutorial 
    | => adb devices
    List of devices attached
    emulator-5554	device
    
    
#### 5. Now run your capsule with elastOS opened, it will automatically launch elastOS in the emulator/device and then install itself

    trinity-cli run -p android --nodebug

{{< figure src="/build/elastos/setup/testing/elastOS_home.png" >}} 

{{< spacer 2 >}}

#### 6. It should automatically launch your capsule, or you can click your capsule to run it

{{< figure src="/build/elastos/setup/testing/template_demo.png" >}} 

{{< spacer 2 >}}

## Now Learn How to Build Your dApp With Our Guides

{{< hero >}}
    {{< heroitem link="/build/elastos/guides" rightArrow="true" >}}
        <h5>How to Guides</h5>
    {{< /heroitem >}}
{{< /hero >}}

{{< hero >}}
    {{< heroitem link="/build/elastos/guides/running_debugging" rightArrow="true" >}}
        <h5>For more help on how to run and debug your capsule, go straight to our running & debugging guide</h5>
    {{< /heroitem >}}
{{< /hero >}}  
