+++
title = "Project setup"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++ 

## Environment setup

Make sure to first {{< internallink "setup your computer for trinity" "elastos_trinity/setup/environment_setup.md" >}}.

## Creating a new app

Open a terminal at the location you want your application to be created. A subfolder will be created for you. Then run the following command

```bash
$ trinity-cli new
```

Provide a few information such as your app name, package name, author information, and a new folder will be created with your DApp.

The created application uses the ionic framework. It simply embeds an additional *manifest.json* file to be considered as a trinity application.

## Converting an existing ionic app to a trinity DApp

In case you already have a ionic application, and would like to run it inside trinity, you have to generate a trinity manifest to make it become compatible. 

Enter your ionic app's folder then run the following command:

```bash
$ trinity-cli manifest
```

### Learning Ionic

For more detail about Ionic, please visit [here](https://ionicframework.com/docs/).
You can build any kind of ionic-based application in Elastos, as the whole ionic framework is available. In addition, Elastos plugins are available too, such as carrier, hive, or access to payments and digital identities (DID).

### Running your DApp on Android

**Checklist:**

- Trinity must be installed on your device
- Connect your device to your computer using a USB cable.
- Make sure adb is in your path.

Enter your app's folder in a terminal then run the following command:

```bash
$ trinity-cli run -p android
```

That will package your application as a EPK file, send it to your device, install it inside Trinity, and run it.

### Developping your DApp

After your app is launched inside trinity, you can directly edit your app content from its src/ folder. Changes will automatically reload in trinity.

### Trinity DApps manifest

A *manifest.json* file is created by default in your trinity DApp project. 

It looks like the following sample. You can manually edit it whenever needed. 

Trinity manifest format is fully described in the {{< internallink "trinity manifest guide" "elastos_trinity/guides/trinity_manifest.md" >}}.

   ```json
   {
     "id": "com.mycompany.myapp",
     "version": "0.0.1",
     "name": "My App",
     "short_name": "My App",
     "description": "My Sample App",
     "start_url": "http://192.168.0.2:8100",
     "type":"url",
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

### Debugging your application
   
Open the Chrome browser on your computer and visit `chrome://inspect` to inspect your DApp pages.
