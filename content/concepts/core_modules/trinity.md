+++
title = "Trinity"
weight = 80
chapter = false
pre = "<i class='fa ela-page'></i>"
alwaysopen = false
+++

## About

**Trinity** is a container that provides Elastos DApp running environment. Based on the trusted running environment of Elastos Runtime, Trinity provides a reliable running environment for applications to protect digital contents.

Trinity integrates all the services that Elastos provides and combines them into a singular mobile application/framework for DApp developers to use. For this reason, DApp developers only need to write their application using ionic javascript framework and have only one set of Runtime APIs to manage. 

Trinity is supported on both Android and iOS, DApp developers only need to develop their application using one set of code in order to run on both platforms, inside the trinity app.

**Ionic** is a powerful HTML5 application development framework (HTML5 Hybrid Mobile App Framework). The developers can use HTML, CSS and Javascript web develoment skills to create an App with near native  experiences. Ionic framework focus on outlook, users' experiences and interaction. It is most suitable for devlopment of HTML5 hybrid mobile App.

Ionic is a lightweight UI library. It is responsive with modern and beautiful interfaces.

## Status

End users can already use Trinity - albeit as a minimal viable product - and access some of its core features. That said, throughout 2019 Trinity is scheduled to undergo a variety of changes and augment a number of new features, so the finished product may not at all resemble Trinity Browser in its early stages. As of now, it has entered an open beta where community members can begin using the Browser and reporting bugs to the developers. Developers then play two major roles throughout the beta process: they provide fixes to reported bugs and continue to create new features as they build out the beta. While Trinity is by no means prepared for mass production, it is nonetheless at a meaningful development stage where testing and trial runs have begun.

## Why is Trinity special?

What Trinity offers is one level above blockchain-based trust because it interacts with all the Elastos services such as Elastos mainchain, DID sidechain, Ethereum sidechain, NEO sidechain, token sidechain, Elastos Carrier, Elastos Hive, etc while preventing applications from accessing any APIs or plugins that are not supported by the Elastos runtime. In that way, users can utilize the blockchain or run smart contracts via the DApps that everyday users use on their devices without having to interface with the blockchain to begin with. Trinity hides away the infrastructure layer and provides a set number of APIs for DApp developers to use. In turn, users access the DApps with the trust and security of the blockchain without ever having to deal with it directly. Rather profoundly, Trinity combines on-chain and off-chain scalability solutions into one platform and packages data in such a way that developers don’t have to learn anything new to develop their DApps on its platform. It is a portal to the vast Elastos ecosystem that everyday users will interact with on a daily basis.

## Trinity vs native Elastos apps

{{< todo "@KP Explain that trinity is a kind of exception in the Elastos ecosystem, compared to native apps" >}}

## DApp Lifecycle in Trinity Browser
- Build an application using the Ionic javascript framework, utilizing various cordova plugins supported by the browser such as elastos carrier plugin, camera plugin, etc.
- Use the toolchain scripts provided as part of the framework in order to convert your Ionic application to an elastos application that can be run inside Trinity. This application will be signed using a developer’s own DID
- Once the .epk (elastos package) file is created using toolchain scripts, it’s ready to be deployed. The next step is to use the tools provided in order to register this .epk file (a Trinity dapp) on DApp sidechain. The app package itself can be stored on a decentralized storage such as Elastos Hive
- Once the elastos app is registered on the DApp sidechain, the DApp Center inside Trinity Browser will automatically display the registered application showing all the details of the app including the developer’s DID who developed the application
- Users are then free to download this app and install it inside Trinity Browser and can run the application after that

Trinity tools are here to help during those steps, to make then as easy as possible.
