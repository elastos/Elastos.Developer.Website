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
