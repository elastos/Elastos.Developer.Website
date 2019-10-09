+++
title = "HTTP calls in Trinity"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

## Allowing some HTTP calls in your DApp

HTTP calls are forbidden by default in Trinity applications. But some specific domains can be added to your DApp manifest to allow you calling HTTP APIs from your app.

### Manifest change

Add your API domain to your manifest.json:

    "urls": [
        "http://api.yourdomain.com/*",
    ],

### Http calls in Typescript

Here is a typical http GET call from an ionic app:

    import { HttpClient } from '@angular/common/http';

    @Component({ 
        selector: 'your-page',
        templateUrl: 'yourpage.html'
    })
    export class YourPage {
        constructor(private http: HttpClient) {
            this.http.get('https://api.yourdomain.com/your_method').subscribe((response) => {
                ...
            });
        }
    }

### The ionic auto-reload issue

Trinity CLI **run** command actually calls **ionic run** with **auto-reload** feature enabled. This is a great feature as it allows you to get the DApp automatically refreshed every time you save a file in your development editor.

Nevertheless, this ionic auto-reload feature uses a local HTTP proxy server behind the hood, and this leads to getting external HTTP API calls rejected because of CORS access origin verification.

The solution is to configure a proxy in your DApp. Edit **ionic.config.json** as following:

    "proxies": [{
        "path": "/yourapi",
        "proxyUrl": "https://api.yourdomain.com"
    }]

Then in your app, edit your http calls like this:

    this.http.get('/yourapi/your_method').subscribe((response) => {
    });
