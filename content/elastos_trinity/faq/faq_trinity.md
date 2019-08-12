+++
title = "FAQ: Trinity"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++ 

{{% faqentry question="Is there an internet browser for Elastos?" %}}
Yes, it is called Trinity interally however, the actual browser app will be called "Elastos" whenever it goes into production and is available on app stores.
{{% /faqentry %}}

{{% faqentry question="What is Trinity ?" %}}
Trinity is a web browser for Elastos and a window into the Elastos Runtime environment. It is based on the chromium engine that is integrated with the Elastos Framework. {{< internallink "More info here." "discover_elastos/core_modules/trinity.md" >}}
{{% /faqentry %}}

{{% faqentry question="How will Trinity DApps work on my device? Are there any pre-requisites?" %}}
Elastos DApps will work in a similar way as the apps that are already running on your device (Android, iOS, Windows, Linux, etc) with the only difference being that they will not have direct access to the internet and their authenticity will first have to be verified and validated on the Elastos blockchain. In the future, you will be able to download the Elastos application in your Apple or Google store or download it directly from the internet on any device. Once you open the Elastos app, you will find a list of DApps that you will be able to download, manage and use.
{{% /faqentry %}}

{{% faqentry question="The definition of Runtime is confusing to me. I have heard this layer described as a Sandbox, Trinity, Elastos Runtime, Elastos Browser, a Client tier, Virtual Machine, Runtime environment.  In layman's terms, is it accurate to say, “The runtime is a code execution engine designed to securely execute DApps on any computer?“" %}}
Yes, you could say that. Also, only the APIs that are exposed through Trinity can be executed from the applications hence it’s a virtual machine. Apps have no access to the network sockets at all.
{{% /faqentry %}}

{{% faqentry question="Does Trinity run inside of a Virtual Machine or is Trinity THE virtual machine?" %}}
Trinity is based on chromium open source project. V8 engine can run any C++ function calls hence this is used as the core SDK implementations are in C++ for elastos. You can think of Trinity as a regular app that acts LIKE the virtual machine (more specifically a native - C virtual machine) because you can only use the APIs that are exposed to this customized browser. So, in short, Trinity is an app + virtual machine all in one.
{{% /faqentry %}}

{{% faqentry question="Let’s say I want to develop an application that helps users pick stocks. My app will need to fetch data from exchanges by using APIs provided by the exchanges. Given that Elastos prohibits internet access to my app, how will I get data into my app from remote servers using those API's without using the old transport protocols like https?" %}}
The elastos browser would have to expose the APIs for these exchanges first via a plugin. Apps written for Trinity browser are based on Ionic framework so any cordova plugins that are available for Trinity browser, developers can access them. 
{{% /faqentry %}}

{{% faqentry question="Could I install the Elastos operating system on my computer or my smartphone?" %}}
There is no such thing as Elastos operating system. Elastos has three components: Blockchain, Carrier and Hive. Each of these 3 components are different networks built for different use cases. Trinity Browser exposes all three of these networks via different APIs that developers can access using the plugins available. As such, if you want the complete Elastos package, you will need to download Elastos Browser app that will be able to be installed on devices. Elastos Browser is currently in beta.
{{% /faqentry %}}

{{% faqentry question="What is the name of the virtual machine?" %}}
Elastos Runtime. Runtime is part of Elastos Browser(Trinity).
{{% /faqentry %}}

{{% faqentry question="What purpose does the virtual machine, Elastos Runtime, serve?" %}}
The Runtime provides exactly the same services as the OS. It is a sandbox environment.

{{% faqentry question="When will I be able to install the Elastos Browser on my smartphone?" %}}
Version 1.0 is scheduled for end of 2019 or early 2020. Elastos Browser is already available for download in its beta version from the github repository at [https://github.com/elastos/Elastos.Trinity](https://github.com/elastos/Elastos.Trinity)
{{% /faqentry %}}

{{% faqentry question="What will internet sites on Elastos look like?" %}}
There are no internet sites on Elastos Browser. Rather, there are only DApps. These DApps are what you're already familiar with. They are just regular applications that are available on your smart phones. Elastos Browser lets developers build DApps interacting with Elastos Blockchain, Elastos Carrier and Elastos Hive all in one. These DApps have no IP addresses like the traditional internet sites do and are also deployed on sidechains of Elastos Blockchain so they cannot be shut down as there are no centralized parties controlling any of the DApps.
{{% /faqentry %}}

{{% faqentry question="What will the multimedia files look like in Elastos?" %}}
As executable applications. They will be raw files that will be run directly by the Elastos Browser without using a third party application.
{{% /faqentry %}}

{{% faqentry question="What will the programs running multimedia look like?" %}}
There will be no programs for multimedia in Elastos’ ecosystem. Each media will be an encrypted file that can be executed directly in the virtual machine inside Elastos Browser.
{{% /faqentry %}}

{{% faqentry question="During several interviews Rong Chen emphasized that Elastos combines Code and Data to make a digital asset. If I were to create a video, which is DATA, a media player is required to view the video, which is CODE. My understanding is that data and code are encapsulated and hashed together and transported via network (carrier) nodes. If code and data are always hashed as a single digital asset, will that not bloat the super nodes with duplicate code and add extra web traffic?" %}}
Elastos is building its own version of IPFS(called Elastos Hive) that is more efficient than the regular IPFS. Also, if you produce 100 copies of digital asset app on elastos, there will only ever be 100 different copies because they have unique hash. So, there would be no need to store duplicate copies in the same decentralized file storage system. IPFS stores data in a very efficient manner.
{{% /faqentry %}}

{{% faqentry question="Is it true that even if your smartphone OS is compromised with malware, the Dapps running in the Elastos Browser are still secure?" %}}
The storage of dapp inside elastos runtime is isolated and cannot be accessed from outside. In other words, the runtime cannot access base OS and the base OS cannot access runtime. This is how data is prevented from being leaked. However, there is always a possibility that the base OS running Elastos Browser could be completely compromised which may lead to hackers being able to read from memory. This is an unusual and extreme case which cannot be solved by Elastos Browser but for that, the Browser needs to be running on a completely safe trustable environment. There is a project from Manhattan Project funded via Cyber Republic that's approaching this problem where they're trying to create Trustable Runtime Environment based on a hardware solution.
{{% /faqentry %}}
