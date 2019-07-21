+++
title = "FAQ: Trinity"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}

{{< todo "Q&A have been checked and sorted. Now need to clear all the remaining TODOs" >}}

{{% faqentry question="Is there an internet browser for Elastos?" %}}
Yes, it is called Trinity.
{{% /faqentry %}}

{{% faqentry question="What is Trinity ?" %}}
Trinity is a web browser for Elastos and a window into the Elastos Runtime environment. It is based on the chromium engine that is integrated with the Elastos Framework. {{< internallink "More info here." "/concepts/core_modules/trinity.md" >}}
{{% /faqentry %}}

{{% faqentry question="How will Trinity DApps work on my device? Are there any pre-requisites?" %}}
Elastos DApps will work in a similar way as the apps that are already running on your device (Android, iOS, Windows, Linux, etc) with the only difference being that they will not have direct access to the internet and their authenticity will first have to be verified and validated on the Elastos blockchain. In the future, you will be able to download the Elastos application in your Apple or Google store or download it directly from the internet on any device. Once you open the Elastos app, you will find a list of DApps that you will be able to download, manage and use.
{{% /faqentry %}}

{{% faqentry question="The definition of Runtime is confusing to me. I have heard this layer described as a Sandbox, Trinity, Elastos Runtime, Elastos Browser, a Client tier, Virtual Machine, Runtime environment.  In layman's terms, is it accurate to say, “The runtime is a code execution engine designed to securely execute DApps on any computer?“" %}}

Yes, you could say that. Also, only the APIs that are exposed through Trinity can be executed from the applications hence it’s a virtual machine. Apps have no access to the network sockets at all.

{{% /faqentry %}}

{{% faqentry question="Does Trinity run inside of a Virtual Machine or is Trinity THE virtual machine?" %}}

Trinity is based on chromium open source project. V8 engine can run any C++ function calls hence this is used as the core SDK implementations are in C++ for elastos. You can think of Trinity as a regular app that acts LIKE the virtual machine (more specifically a native - C virtual machine) because you can only use the APIs that are exposed to this customized browser. So, in short, Trinity is an app + virtual machine all in one

{{% /faqentry %}}

{{% faqentry question="Let’s say I want to develop an application that helps users pick stocks. My app will need to fetch data from exchanges by using APIs provided by the exchanges. Given that Elastos prohibits internet access to my app, how will I get data into my app from remote servers using those API's without using the old transport protocols like https?" %}}

The elastos browser would have to expose the APIs for these exchanges. Otherwise, DEX is also in the works so can just wait for that. Or, if building a native application, you can still interact with the regular internet

{{% /faqentry %}}

{{< todo "What is DEX? Need to detail the answer" >}}

{{% faqentry question="Could I install the Elastos operating system on my computer or my smartphone?" %}}
No. For now, only the virtual machine will be able to be installed on devices from the general public.
{{% /faqentry %}}

{{< todo "We may want to clarify this answer" >}}

{{% faqentry question="How will I use Elastos on my smartphone?" %}}
The light version of the Elastos Runtime can be installed on your smartphone. This application allows decentralized applications to be built on an agnostic platform and peer-to-peer.
{{% /faqentry %}}

{{< todo "Not sure about what the elastos runtime means here, and if this answer belongs to trinity" >}}

{{% faqentry question="What purpose does the operating system (OS) serve if I can’t use it?" %}}
The operating system is mostly meant for the Internet of Things (IoT) devices.
{{% /faqentry %}}

{{< todo "Is this really related to trinity? still up to date?" >}}

{{% faqentry question="What is the name of the virtual machine?" %}}
Elastos Runtime.
{{% /faqentry %}}

{{< todo "Still up to date?" >}}

{{% faqentry question="What purpose does the virtual machine, Elastos Runtime, serve?" %}}
The Runtime provides exactly the same services as the OS. It is a sandbox environment.
{{% /faqentry %}}

{{< todo "Unclear to me" >}}

{{% faqentry question="Why can’t I install the OS on my devices?" %}}
Using the Runtime allows you to use the classic environment, which has access to the internet, while also having access to the Elastos ecosystem. There are only benefits. The OS would be a constraint for the majority of the people.
{{% /faqentry %}}

{{< todo "Do we really want to say that?" >}}

{{% faqentry question="In that case, why would the OS be useful?" %}}
Devices that will use the OS will be completely decoupled from the classic internet. Using the Elastos OS would allow you not having to pay for a mainstream OS.
{{% /faqentry %}}

{{< todo "Not sure the OS part of Elastos is relevant any more" >}}

{{% faqentry question="When will I be able to install the Elastos Runtime on my smartphone?" %}}
Version 1.0 is scheduled for mid-2019. Elastos Runtime is already available for download in its alpha version.
{{% /faqentry %}}

{{< todo "We should rename all occurences of 'Elastos runtime' with 'trinity' to reduce confusion. And I think the new plan for trinity alpha release is end of 2019 now?" >}}

{{% faqentry question="How do the operating system and the virtual machine work?" %}}
[Read this article.](https://www.reddit.com/r/Elastos/comments/857bw9/casual_qa_with_rong_chen_after_dapp_meetup/)
{{% /faqentry %}}

{{< todo "Still relevant? Shoulw we talk about the OS?" >}}

{{% faqentry question="What will internet sites on Elastos look like?" %}}
Like applications.
{{% /faqentry %}}

{{< todo "I think we may not call them 'internet sites'. They are just dapps, right? Even if they use web tech" >}}

{{% faqentry question="What will the multimedia files look like in Elastos?" %}}
As executable applications. They will be raw files that will be run directly by the OS without using a third party application.
{{% /faqentry %}}

{{% faqentry question="What will the programs running multimedia look like?" %}}
There will be no programs for multimedia in Elastos’ ecosystem. Each media will be an encrypted file that can be executed directly in the virtual machine. In other words, there will only be *.exe files.
{{% /faqentry %}}

{{% faqentry question="Can the Elastos DApps be multithreaded?" %}}

Chromium fork so each dapp runs in its own process but that process can be multithreaded

{{% /faqentry %}}

{{< todo "dapp here is only about trinity dapps, not native apps." >}}

{{% faqentry question="During several interviews Rong Chen emphasized that Elastos combines Code and Data to make a digital asset. If I were to create a video, which is DATA, a media player is required to view the video, which is CODE. My understanding is that data and code are encapsulated and hashed together and transported via network (carrier) nodes. If code and data are always hashed as a single digital asset, will that not bloat the super nodes with duplicate code and add extra web traffic?" %}}

Elastos is building its own version of IPFS that is more efficient than the regular IPFS. Also, if you produce 100 copies of digital asset app on elastos, there will only ever be 100 different copies because they have unique hash. So, there would be no need to store duplicate copies in the same supernode. IPFS stores data in a very efficient manner

{{% /faqentry %}}

{{< todo "No answer provided for 'extra web traffic'" >}}

{{% faqentry question="Is it true that even if your smartphone OS is compromised with malware, the Dapps running in the Elastos Runtime (VM) are still secure?" %}}

The storage of dapp inside elastos runtime is isolated and cannot be accessed from outside. In other words, the runtime cannot access base OS and the base OS cannot access runtime. This is how data is prevented from being leaked

{{% /faqentry %}}
