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

Native ionic/cordova plugins are embedded in the Trinity native application, not in every DApp. But we provide a set of typescript interfaces that can be imported through the npm module **@elastosfoundation/trinity-types**.

    // Declaration
    declare let appManager: AppManagerPlugin.AppManager;

    // Method call
    appManager.close();

Please refer to the {{< internallink "trinity plugins API reference" "/elastos_core_services/reference/trinity/plugins_api.md" >}} page to know more about plugins usage.