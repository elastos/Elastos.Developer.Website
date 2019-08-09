+++
title = "Trinity setup"
date = 2019-05-24T21:15:33+02:00
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++ 

## Trinity CLI

Trinity CLI is a command line tool that helps you manage your trinity applications, including creating a new application, running during development, and publishing.

### Dependencies

You need a few things installed on your computer for the CLI to run well:

- A MacOS or Linux operating system
- Python
- Android adb (to test on Android devices)
- Ionic
- Node v10 (not v12)
- Trinity app (APK) installed on android (to be able to deploy development EPKs)

### Installation

{{< highlight "shell" >}}
$ npm install -g @elastosfoundation/trinity-cli
{{< /highlight >}}

### Getting help

{{< highlight "shell" >}}
$ trinity-cli
{{< /highlight >}}

### Next steps

You can now create a first trinity DApp, and run it on your device. Check the {{< internallink "trinity project setup page" "setup/project_setup/trinity_project_setup.md" >}}