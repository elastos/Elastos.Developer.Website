+++
title = "Trinity setup"
date = 2019-05-24T21:15:33+02:00
weight = 50
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< ownership "Benjamin Piette" >}}


{{< todo "@BPI Import content from there? https://github.com/elastos/Elastos.Developer.Doc/blob/master/Ignore/Doc/DApp_manual.md" >}}

# Elastos.Trinity.ToolChains

## Tutorial

### Starting a New Ionic App

To start a new app, open your terminal/command prompt and run:

```bash
$ ionic start helloWorld tutorial
```

For more detail about Ionic, please visit [here](https://ionicframework.com/docs/).

### Viewing the app in a browser

Start Ionic Lab for multi-platform dev/testing:

```bash
$ cd helloWorld/
$ ionic lab
```

NOTE: `ionic lab` is just a convenient shortcut for `ionic serve --lab`.

### Testing and debugging the app on a device

Before a production build, you may want to test your App on a device.

And you don't want to pack and install your app again and again when you debugging your code.

You could follow these instructions:

1. Serve your App

   ```bash
   $ ionic serve --no-open
   ...
   [INFO] Development server running!

       Local: http://localhost:8100
       External: http://192.168.0.2:8100
   ...
   ```

   Please remember the `External` URL. It's needed for the next step.

1. Create a `manifest_debug.json` like this:

   ```json
   {
     "id": "com.mycompany.myapp",
     "version": "0.0.1",
     "name": "My App",
     "short_name": "My App",
     "description": "My Sample App",
     "start_url": "http://192.168.0.2:8100",
     "icons": [
       {
         "src": "logo.png",
         "sizes": "512x512",
         "type": "image/png"
       }
     ],
     "author": {
       "name": "MyName",
       "email": "myname@mycompany.com"
     },
     "default_locale": "en",
     "urls": [
       "http://192.168.0.2:8100/*"
     ],
     "background_color": "#4e8ef7",
     "theme": {
       "theme_display": "show",
       "theme_color": "#4e8ef7"
     }
   }
   ```

   The `start_url ` of the `manifest_debug.json` is intended set to the external URL of the previous step.

1. Create a wrapper app with the debug manifest json file

   We only pack the json and logo file to the EPK.

   ```bash
   $ pack_epk --manifest manifest_debug.json --root-dir src/assets/imgs/ helloWorld_wrapper.epk
   ```

   NOTE: You could type `pack_epk --help` for more details.

1. Install and test your app

   Install the wrapper EPK file and launch the DApp for debugging.

   If the `URL authority request` dialog pops up, click `ALLOW`. Then click the back button return back to launcher app. And launch your wrapper DApp again to load your pages from the host computer.

1. Use browser to inspect and debug the pages

   Open Chrome browser and visit `chrome://inspect` to inspect your DApp pages.

### Deploy your DApp

After test, you may want to deploy your DApp as a product.

1. Create a production manifest json file

   Create a `manifest_prod.json` like this:

   ```json
   {
     "id": "com.mycompany.myapp",
     "version": "0.0.1",
     "name": "My App",
     "short_name": "My App",
     "description": "My Sample App",
     "start_url": "index.html",
     "icons": [
       {
         "src": "assets/imgs/logo.png",
         "sizes": "512x512",
         "type": "image/png"
       },
       {
         "src": "assets/imgs/logo.png",
         "sizes": "128x128",
         "type": "image/png"
       }
     ],
     "author": {
       "name": "MyName",
       "email": "myname@mycompany.com"
     },
     "default_locale": "en",
     "background_color": "#4e8ef7",
     "theme": {
       "theme_display": "show",
       "theme_color": "#4e8ef7"
     }
   }
   ```

1. Generate production code

   Run this command inside the `helloWorld` folder to generate the production code:

   ```bash
   $ ionic build --prod
   ```

1. Create a production EPK file

   ```bash
   $ pack_epk --manifest manifest_prod.json --root-dir www/ helloWorld.epk
   ```


{{< todo "@BPI How to install the EPK in trinity?" >}}
{{< todo "@BPI How to get the pack_epk script without installing trinity source code?" >}}