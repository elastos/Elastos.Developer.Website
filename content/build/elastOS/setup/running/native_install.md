+++
title = "Installing elastOS"
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

### elastOS is a Mobile Application That Runs Your Capsules

Therefore you need to have elastOS running first, typically the way to do this is running an emulator, but of course you can also connect your Android phone to your computer. 

{{< notice note >}}
    {{< rawspan fontweight="400" >}}elastOS is not yet released for iOS,{{< /rawspan >}} therefore we will only be supporting Android at the moment
{{</ notice >}}

### Option 1: Running a real Android device

If you already own a android phone, simply connect it through USB in order to let the android debugging tool (adb) be able to deploy capsules later.

### Option 2: Running an Android Emulator

#### 1. Download Android Studio - {{< externallink title="https://developer.android.com/studio" >}}https://developer.android.com/studio{{< /externallink >}}

#### 2. Open AVD Manager and Add a Virtual Device 

Make sure the image you are using has **Play Store** support, which avoids us having to build and install the `elastOS.apk` file.

{{< figure src="/build/elastos/setup/running/avd_manager.png" >}} 

Follow this guide for detailed instructions: {{< externallink title="https://developer.android.com/studio/run/emulator" >}}https://developer.android.com/studio/run/emulator{{< /externallink >}}

#### 3. Now Run Your Virtual Device Emulator 

Clicking the **Green Arrow** circled in orange should launch a device, in this example I am using a Pixel 2 emulator. 

{{< figure src="/build/elastos/setup/running/emulator.png" >}} 

### Install elastOS from the Play Store

The emulator still needs a real Google account to access the play store, we recommend you create a new account for development. On a physical device, you may already have a google account ready.

- After you have access to Play Store, search for **elastOS** and install it.
    
    {{< rawspan imginline="true" >}}<img src="/build/elastos/setup/running/elastOS_play-store.png"></img>{{< /rawspan >}}

### Verify that adb sees your device

`adb` is the Android Debug Bridge which is a command line tool that should be installed with Android Studio, 
for more information see: {{< externallink title="https://developer.android.com/studio/command-line/adb" >}}https://developer.android.com/studio/command-line/adb{{< /externallink >}}

    | ~/workspace/com.elajs.elastOS-dev-tutorial 
    | => adb devices
    List of devices attached
    emulator-5554	device
    
## Now Learn How to Run Your Capsule in elastOS:

{{< hero >}}
    {{< heroitem title="Running & Debugging" link="/build/elastos/setup/running/running_debugging" colspan="12" >}}
        Now that elastOS is ready, it's time to <b>deploy your capsule</b>.
    {{< /heroitem >}}
 {{< /hero >}}