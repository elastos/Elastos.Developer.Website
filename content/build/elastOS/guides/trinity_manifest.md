+++
title = "The Manifest File"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

## Manifest Format

```json
{
    "id": "com.mycompany.myapp", // Permanent app identifier. If you change it, your app will be considered as a new app.
    "version": "0.0.1", // Version displayed to end users.
    "version_code": 1, // Internal version number. Used to compare versions (newer, older). Increase it every time you publish a new version.
    "name": "My App",   // Your application name (app store)
    "short_name": "My App", // Your application name (home screen)
    "description": "My Sample App", // Application description (app store, settings)
    "start_url": "index.html", // Location of your starting ionic html file. Usually index.html but can be a local URL in case of remote debugging
    "type":"file",  // local "file", or remote "url"
    "category":"finance", // Application category in the app store such as entertainment, games, health, productivity...
    "icons": [ // Array of icons (home screen). Use different size variants if needed, but 512 x 512 is the recommended default choice.
    {
        "src": "logo.png",
        "sizes": "512x512",
        "type": "image/png"
    }
    ],
    "author": {
        "name": "MyName",   // App developer's name (public on the app store)
       "email": "myname@mycompany.com"  // App developer's email (public on the app store)
    },
    "default_locale": "en",
    "urls": [   // List of URL that are allowed by the app. ALl other external URLs calls will be blocked
        "http://192.168.0.2:8100/*"
    ],
    "background_color": "#4e8ef7",
    "theme": {
        "theme_display": "show",
        "theme_color": "#4e8ef7"
    },
    "intent_filters": [ // List of intent actions this app is listening to. The app is started when receiving such intent.
        {
            "action": "connectapplicationprofile"
        }
    ]
   }
```

{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem link="/build/elastos/guides/dapp_programming" rightArrow="true" >}}
        <h5>dApp Programming Quickstart</h5>
    {{< /heroitem >}}
{{< /hero >}}
