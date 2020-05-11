+++
title = "Running & Debugging a dApp"
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

Trinity CLI provides an **easy way to run and debug** your dApp from your development station.

## Sending your app to your device

* Enter your dApp folder.
* Make sure your **phone and your computer are on the same network** (ex: same wifi, same sub-network, no VPN).
* Android specific:

    * **Enable developer mode** (from the settings - see android docs) and enable USB debugging.
    * **Connect your device** to your computer.

* Make sure the **native elastOS browser** is installed on your device.
* Inside elastOS, go to the settings app and **enable developer mode**.
* Run the following command:

```bash
# To deploy and run on android - check the CLI help for other options.
$ trinity-cli run -p android|ios --nodebug
```

**What happens in background**:

* Your app's manifest is slightly edited to **use your computer's local content remotely**, so that every time you will save one of your app's files the app will automatically reload inside elastOS.
* Your app is packaged as a EPK file and signed using a debug signature.
* Your app is sent to the device, and the native elastOS browser catches it then installs it.
* {{< rawspan >}}<i class="fas fa-exclamation-triangle"></i>{{< /rawspan >}} **see note below** - ~~`ionic serve` is called to start a simple server that the dApp will contact to get your dApp files.~~
* ~~When you change your source code on your computer, your dApp on the device detects it and reload the app content.~~

{{< notice note >}}
    {{< rawspan fontweight="400" >}}<b>ionic serve</b> is a bit buggy at the moment{{< /rawspan >}}, temporarily you can call <span style="font-weight: 400;">trinity-cli</span> run without <span style="font-weight: 400;">--nodebug</span>, 
    but you will need to close the {{< rawspan fontweight="400" >}}elastOS app{{< /rawspan >}} and re-open it after your capsule installs, this gives the <span style="font-weight: 400;">ionic server</span> enough time to start.<br/>
    <br/>
    Also when running without <span style="font-weight: 400;">--nodebug</span>, after the capsule installs the screen may not automatically update to show the installed capsule, force a refresh by navigating elsewhere and back. 
{{</ notice >}}

Note that if you're running without `--nodebug` as soon as your device stops being on the same network as your computer, or if the `trinity-cli run` command is stopped, your dApp in {{< rawspan fontweight="400" >}}elastOS{{< /rawspan >}} will show a network error with an empty page. 

{{< spacer 1 >}}

## Debugging Your Application

**On Android**:

Open the Chrome browser on your computer and visit `chrome://inspect` to inspect your dApp pages.

{{< notice warning >}}
    {{< rawspan fontweight="400" >}}You need to be running a debug build of <b>elastOS</b>{{< /rawspan >}} and not the production builds or the version from Play Store suggested by some basic guides.<br/>
    <br/> 
    See: <a target="_blank" href="https://github.com/elastos/Elastos.Trinity/releases">https://github.com/elastos/Elastos.Trinity/releases</a> and get a <b>daily</b> .apk file.
    
{{</ notice >}}

- Also you can use `adb logcat` to view the device logs for certain error messages.

**On iOS**:

Open safari, **development** menu, find your device, and select then dApp in the list. Sometimes all dApps will look like "localhost". In this case, while your dApp is running, move the mouse over each "localhost" entry and check when some blue overlay shows on your device. That will be the right item.

Safari doesn't show logs history if you start the debug panel after starting your dApp. You can choose to restart your app manually using **ctrl+r** or **cmd+r** in the debugguer, to get all startup logs.

{{< spacer 1 >}}

## Debugging User Issues Remotely

After your dApp is published, some users may face issues, including fatal exceptions, that you haven't seen during development and tests.

We recommend integrating a tool like **sentry.io** to your dApp in order to get exception reports remotely and therefore being able to debug most of end users issues.

### Sentry Installation

* Follow the steps at https://docs.sentry.io/error-reporting/quickstart/?platform=browsernpm.
* This includes creating a Sentry account, getting a Sentry id for your app, and adding Sentry.init() and the custom Sentry error handle to your app.module.ts file.

### Elastos foundation dApps sample

For our built-in apps at the Elastos foundation, we use the following error handler, that you can use as a reference if needed:

    @Injectable()
    export class SentryErrorHandler implements ErrorHandler {
        constructor() {}

        handleError(error) {
            console.error("Globally catched exception:", error);

            // Only send reports to sentry if we are not debugging.
            if (document.URL.includes('localhost')) {
                Sentry.captureException(error.originalError || error);
            }
        }
    }
