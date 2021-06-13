+++
title = "Environment Setup"
date = 2019-05-24T21:15:33+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++ 

## Trinity CLI

Trinity CLI is a command line tool that helps you manage your elastOS applications, including creating a new application, running during development, and publishing.

{{< hero >}}
    {{< heroitem title="Using Windows 10?" link="/build/elastos/setup/windows_setup" rightArrow="true" >}}
        Please click here for our Windows guide
    {{< /heroitem >}}
{{< /hero >}}

### Dependencies

You need a few things installed on your computer for the CLI to run well:

- A MacOS, Linux or Windows operating system
- Python
- Android adb (to test on Android devices)
- Ionic
- Node v10 or v12
- elastOS app (APK) installed on android (to be able to deploy development EPKs)

### Installation

{{< highlight "shell" >}}
$ sudo npm install -g @elastosfoundation/trinity-cli --unsafe-perm
{{< /highlight >}}

### Getting help

{{< highlight "shell" >}}
$ trinity-cli
{{< /highlight >}}

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem link="/build/elastos/setup/project_setup" rightArrow="true" >}}
        <h5>You can now create a elastOS capsule, next we'll setup your first project</h5>
    {{< /heroitem >}}
{{< /hero >}}
