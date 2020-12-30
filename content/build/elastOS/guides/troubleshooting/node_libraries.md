

+++
title = "Node libraries VS browser"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

## Scope

While building your capsule, you may need to add third party libraries for some features, such as **web3**, **image manipulation**, **file archiving** and so on.

Some of those NPM packages are meant to run both inside native (usually server side) node JS applications, but also from inside browsers.

Recent versions of angular and node CLIs may give you trouble with this. For example, eventhough the web3 library doesn't really use the built-in **http** nodejs module when running in the browser, it's still needed during thebuild process. You may face issues as following:

````
ERROR in ./node_modules/eth-lib/lib/bytes.js
Module not found: Error: Can't resolve 'crypto' in 'xxx/node_modules/eth-lib/lib'
ERROR in ./node_modules/web3/node_modules/eth-lib/lib/bytes.js
Module not found: Error: Can't resolve 'http' in 'xxx/node_modules/web3/node_modules/web3-providers-http/lib'
ERROR in ./node_modules/web3/node_modules/web3-providers-http/lib/index.js
Module not found: Error: Can't resolve 'https' in 'xxx/node_modules/web3/node_modules/web3-providers-http/lib'
ERROR in ./node_modules/xhr2-cookies/dist/xml-http-request.js
Module not found: Error: Can't resolve 'os' in 'xxx/node_modules/xhr2-cookies/dist'
````

## Step 1 - Exclude native node modules from build

It's not straightforward, but the first thing you can do is to try excluding all those dependencies from build checks. The following method will prevent the compiler from complaining about the missing modules. Though, if the modules are actually really required, the application will crash at runtime:

In your capsule's **package.json** file, add the following:

````
"dependencies": {
},
"devDependencies": {
},
"browser": {
    "fs": false,
    "path": false,
    "os": false,
    "http": false,
    "tls": false,
    "https": false,
    "net": false,
    "crypto": false
}
````

## Step 2 - Add browser versions of those modules

In case some of those native node modules are really used by your third party libraries, or if you don't want to take the chance of unexpected behaviours at runtime, you can add some, or all of the **browserified** versions of those modules. Some NPM libraries exist for most of them.

Let's take the example of the **crypto** module, actually really used by **web3** (to use ethereum). Here are the steps to install and use a browser-based version of crypto, in order to replace the missing node JS one:

- Don't exclude crypto from package.json. Remove **"crypto": false** from package.json.
- Find and install the browserified version of crypto:

````
npm install --save crypto-browserify
````

- Edit **tsconfig.json** to automatically let third party libraries use your newly installed (and compatible) library:

````
"compilerOptions": {
    ...
    "paths": {
      "crypto": [
        "node_modules/crypto-browserify"
      ]
    }
}
````

## Matchings

Here are a few compatibility libraries to replace node JS modules with browser versions:

| Node JS module | Compatible browser version npm module |
| ------- | ------- |
| crypto | crypto-browserify |
| zlib | browserify-zlib |
| stream | stream-browserify |
| os | os-browserify |
| http | http-browserify |
| https | https-browserify |