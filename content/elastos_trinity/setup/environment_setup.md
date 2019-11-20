+++
title = "Environment setup"
date = 2019-05-24T21:15:33+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++ 

## Trinity CLI

Trinity CLI is a command line tool that helps you manage your trinity applications, including creating a new application, running during development, and publishing.

### Dependencies

You need a few things installed on your computer for the CLI to run well:

- A MacOS, Linux or Windows operating system
- Python
- Android adb (to test on Android devices)
- Ionic
- Node v10 or v12
- Trinity app (APK) installed on android (to be able to deploy development EPKs)

### Installation

{{< notice note >}}
<b>Windows users</b>: Please read the preliminary steps for windows 10 users below first.
{{</ notice >}}

{{< highlight "shell" >}}
$ sudo npm install -g @elastosfoundation/trinity-cli --unsafe-perm
{{< /highlight >}}

### Getting help

{{< highlight "shell" >}}
$ trinity-cli
{{< /highlight >}}

### Preliminary steps for windows 10 developers

We do not provide native support for windows. Nevertheless, windows developers can use the Trinity CLI using Windows 10 WSL (Linux support). 

WSL can install a minimal version of Linux Ubuntu inside windows 10. After that, you can start a linux terminal and setup/run Trinity-CLI.

In order for adb, the android communication tool, to work through WSL, you will have to install the android SDK, **same version**, on both your windows host and the Ubuntu guest (for both ADBs being able to share the same daemon instance).

* Read the WSL howto there: https://docs.microsoft.com/en-us/windows/wsl/install-win10 (Install Ubuntu)
* Launch ubuntu in WSL (from a windows powershell):

```
wsl.exe
```

* Setup your ubuntu environment:

```
# Base requirements 
sudo apt -y install openjdk-8-jdk build-essential curl dirmngr apt-transport-https lsb-release ca-certificates
# Install NodeJS 12 instead of 8 or 10
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt -y install nodejs
```

* Go to https://developer.android.com/studio#downloads -> download options -> command line tools only.
* Download both windows and linux ZIP files.
* Unzip both ZIP files.
* Install android platform tools using the SDK manager (on both windows and linux):

```
    [extracted_android_tools_folder]/tools/bin/sdkmanager "platform-tools"
``` 

A **platform-tools** folder gets created at the root of [extracted_android_tools_folder]

* Add adb to windows and linux paths:
    * **In Ubuntu**: Add [extracted_android_tools_folder]/platform-tools to your PATH in ~/.bashrc
    * **In Windows**: Add [extracted_android_tools_folder]/platform-tools to system environment variables using "view advanced system settings".
* Verify that adb has the same version on both windows and ubuntu:

**First on windows** (to start the daemon on windows), then on ubuntu:

```
adb --version
```

* Launch the ADB daemon (always on windows first):
    * Plug your android device on USB
    * First on windows: adb devices
    * Then on linux: adb devices
    * You should be able to see your device ID in the list

**During the next steps, always install and run trinity-cli from WSL.**

You can now go on with installing Trinity CLI.

### Next steps

You can now create a first trinity DApp, and run it on your device. Check the {{< internallink "trinity project setup page" "elastos_trinity/setup/project_setup.md" >}}