+++
title = "Project Setup"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

## Environment setup

{{< hero >}}
    {{< heroitem link="/build/elastos/setup/environment_setup/" leftArrow="true" >}}
        <h5 style="text-align: center;">Make sure to first setup your environment for elastOS</h5>
    {{< /heroitem >}}
{{< /hero >}}


## Creating a new app

Open a terminal at the location you want your application to be created. A subfolder will be created for you. Then run the following command

```bash
$ trinity-cli new
```

Provide a few information such as your app name, package name, author information, and a new folder will be created with your capsule.

The created application uses the ionic framework. It simply embeds an additional *manifest.json* file to be considered as a elastOS application.

### App Templates

We offer a few app templates, for example on **Angular** there is a full demo template

{{< figure src="/build/elastos/setup/demo-template.png" >}}

### Learning Ionic

For more detail about Ionic, please visit {{< externallink title="https://ionicframework.com/docs" >}}https://ionicframework.com/docs{{< /externallink >}}.

You can build any kind of ionic-based application in Elastos, as the whole ionic framework is available. In addition, Elastos plugins are available too, such as carrier, hive, or access to payments and digital identities (DID).

### elastOS plugins Typescript typings

In case the default capsule you've created does not include typescript types for elastOS plugins, you may have to add them by yourself:

```bash
$ npm i @elastosfoundation/trinity-types
```

Make sure your tsconfig.json contains the following parts:

    "compilerOptions": {
        ...
        "typeRoots": [
            "node_modules/@types",
            "node_modules/@elastosfoundation"
        ],
        "types": [
            "node",
            "trinity-types"
        ],
        ...
    }

Then in your application, you can use it this way:

    // Global variable
    declare let appManager: AppManagerPlugin.AppManager;

    // In a method
    appManager.sendIntent(...);

### Running your capsule on Android

**Checklist:**

- elastOS must be installed on your device
- Connect your device to your computer using a USB cable.
- Make sure android adb is in your path.

Enter your app's folder in a terminal then run the following command:

```bash
$ trinity-cli run -p android --nodebug
```

That will package your application as a EPK file, send it to your device, install it inside elastOS, and run it.

### Developing your capsule

After your app is launched inside elastOS, you can directly edit your app content from its src/ folder. Changes will automatically reload in elastOS.

### elastOS capsule manifest

A *manifest.json* file is created by default in your elastOS capsule project. You can manually edit it whenever needed. The elastOS manifest format is fully described in the {{< internallink "elastOS manifest guide" "/build/elastos/guides/trinity_manifest.md" >}}.

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem link="/build/elastos/setup/running" rightArrow="true" >}}
        <h5>Running Your Capsule</h5>
    {{< /heroitem >}}
{{< /hero >}}
