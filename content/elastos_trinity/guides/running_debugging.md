+++
title = "Running & debugging a DApp"
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

Trinity CLI provides an **easy way to run and debug** your DApp from your development station.

## Sending your app to your device

* Enter your DApp folder.
* **Connect your device** to your computer.
* Make sure your **phone and your computer are on the same network** (ex: same wifi, same sub-network, no VPN).
* On Android, **enable developer mode** (from the settings - see android docs) and enable USB debugging.
* Make sure the **native Trinity browser** is installed on your device.
* Run the following command:

```bash
# To deploy and run on android - check the CLI help for other options.
$ trinity-cli run -p android
```

**What happens in background**:

* Your app's manifest is slightly edited to **use your computer's local content remotely**, so that every time you will save one of your app's files the app will automatically reload inside Trinity.
* Your app is packaged as a EPK file and signed using a debug signature.
* Your app is sent to the device, and the native trinity browser catches it then installs it.
* `ionic serve` is called to start a simple server that the DApp will contact to get your DApp files.
* When you change your source code on your computer, your DApp on the device detects it and reload the app content.

Note that as soon as your device stops being on the same network as your computer, or if the `trinity-cli run` command is stopped, your DApp in trinity will show a network error with an empty page. 

## Debugging your application
   
Open the Chrome browser on your computer and visit `chrome://inspect` to inspect your DApp pages.

## Debugging user issues remotely

After your dApp is published, some users may face issuesn including fatal exceptions, that you haven't seen during development and tests.

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