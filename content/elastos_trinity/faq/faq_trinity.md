+++
title = "FAQ: Trinity"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++ 

{{% faqentry question="Is there an internet browser for Elastos?" %}}
Yes, it is called Trinity internally however, the actual browser app is called elastOS. It is not used to browse regular "internet" website as one may think, but it's used to browse Elastos dApps.
{{% /faqentry %}}

{{% faqentry question="What is Trinity ?" %}}
Trinity is the historical project name for elastOS, the Elastos browser. It is based on the chromium engine that is integrated with the Elastos Framework. {{< internallink "More info here." "discover_elastos/core_modules/trinity.md" >}}
{{% /faqentry %}}

{{% faqentry question="How will Trinity DApps work on my device? Are there any pre-requisites?" %}}
Elastos dApps work in a similar way as the apps that are already running on your device (Android, iOS, Windows, Linux, etc) except that these dApps run inside another app, the elastOS browser. In order to run elastOS dApps, you may need to have a ELA wallet and a DID, but this is not always mandatory.
{{% /faqentry %}}

{{% faqentry question="The definition of Runtime is confusing to me. I have heard this layer described as a Sandbox, Trinity, Elastos Runtime, Elastos Browser, a Client tier, Virtual Machine, Runtime environment.  In layman's terms, is it accurate to say, “The runtime is a code execution engine designed to securely execute DApps on any computer?“" %}}
Yes, you could say that. Also, only the APIs that are exposed through Trinity can be executed from the applications hence it’s a virtual machine. Apps have no access to the network sockets at all. Runtime is one part of the elastOS browser, the part that controls what dApps can do or not inside elastOS.
{{% /faqentry %}}

{{% faqentry question="Let’s say I want to develop an application that helps users pick stocks. My app will need to fetch data from exchanges by using APIs provided by the exchanges. Given that Elastos prohibits internet access to my app, how will I get data into my app from remote servers using those API's without using the old transport protocols like https?" %}}
Eventhough elastOS blocks HTTP calls by default, your dApp can still request access to some external websites. It's up to end user to accept this or not. 
{{% /faqentry %}}

{{% faqentry question="What purpose does elastOS serve?" %}}
The elastOS browser provides a sandboxed environment. Because all dApps have to go through the elastOS runtime and plugins to access external features, elastOS can control everything needed to deliver a secure environment: block network calls when necessary or filter storage and plugins access.
{{% /faqentry %}}

{{% faqentry question="What will internet sites on elastOS look like?" %}}
There are no internet sites on elastOS. Rather, there are only DApps. These DApps are what you're already familiar with. They are just regular applications that are available on your smart phones. The elastOS browser lets developers build dApps that can easily interact with the whole Elastos ecosystem including the ELA mainchain, DID sidechain, Ethereum sidechain, Token sidechain, Carrier, Hive, and more. 

These dApps have no IP addresses like the traditional internet sites do and will also be deployed on sidechains so they won't be stoppable as there are no centralized parties controlling any of the dApps.
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
