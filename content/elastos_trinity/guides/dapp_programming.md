+++
title = "DApp programming quickstart"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

Once your **environment** and **project** setups are completed, you are ready to start customizing UI and logic from the default template application you've just created.

## Current reference versions

The following versions are currently used in this documentation and for sample codes:

| Library | Version |
| ------- | ------- |
| Ionic | 4 |
| Angular | 7 |
| NodeJS | 12 |
| NPM | 6 |

## Getting familiar with ionic

Trinity DApps use the ionic platform to run javascript apps. Though we currently focus mainly on Trinity Angular based code, it may be totally doable to write Ionic React or VueJS DApps as well.

Please refer to [Ionic documentation](https://ionicframework.com/docs) to start writing your apps. Building/Publishing chapters are irrelevant as Trinity uses its own way, but other chapters such as layout, routing, lifecycle, UI components are perfectly fine. 

## Accessing plugin APIs

Native ionic/cordova plugins are embedded in the Trinity native application, not in every DApp. Currently, we do not provide any SDK that developers can use while writing their DApps, for example to get code completion. We will release such SDK in the future to assist developers.

As a consequence, plugins are currently declared and used in a blind way. As there is no compilation this works perfectly, but result can only be seen while running the DApp in Trinity:

    // Declaration
    declare let appManager: any; // No information about appServices type here.

    // Method call
    appManager.close(); // No code completion in your editor. If you type a wrong method name you will notice it only at runtime.

Please refer to the {{< internallink "trinity plugins API reference" "/elastos_core_services/reference/trinity/plugins_api.md" >}} page to know more about plugins usage.