+++
title = "FAQ: Development"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++ 

{{< faqentry question="In the Developers Beginner’s Guide to Elastos, there is very little info on the SDKs. Can you talk about the function of SDKs and how they fit into the project development workflow." >}}

SDK refers to Software Development Kit and such, there are numerous SDKs available for Elastos infrastructure as it contains numerous projects such as Blockchain, Carrier and Hive. For each of these, there are SDKs available targetted for various platforms such as Android, iOS, or native SDKs, etc. Please refer to [https://www.github.com/elastos](https://www.github.com/elastos) for more info.

There is also a elastOS Browser(codename: Trinity) where developers can develop applications for this browser using Ionic framework. In order to make various functionalities from Elastos Blockchain, Elastos Carrier and Elastos Hive available, there are various plugins available which developers can utilize to interact with the Elastos infrastructure. Please refer to [https://github.com/elastos/Elastos.Trinity](https://github.com/elastos/Elastos.Trinity) for more info.

{{< /faqentry >}}

{{< faqentry question="Some virtual computers that I ran on Windows or Mac had very limited device drivers. Does the SDK provide USB, pen, keyboard, and printer drivers, or do we have to wait for device manufacturers to provide those?" >}}

Currently, elastOS browser uses cordova plugin to expose the underlying hardware to the elastos apps and this is for mobile devices. The plans for windows or mac have not yet been determined.

With that said however, there are also other Native and platform specific SDKs available if you would not like to develop apps for elastOS Browser. And these SDKs are mostly for Android/iOS platforms.

{{< /faqentry >}}

{{< faqentry question="Is there an SDK plug-in for popular IDEs like; PyDev, Aptana, Visual Studio, etc.?" >}} 

No plugin available for IDEs yet. Maybe in the future.

{{< /faqentry >}}

{{< faqentry question="Is there a difference between the terms ecosystem and platform in relation to Elastos?" >}}

Platform usually refers to a set of SDKs and APIs that are provided that can be used to interact with ALL the services within the Elastos infrastructure. An ecosystem extends way beyond that as it also refers to community governance and how the project is run

{{< /faqentry >}}

{{< faqentry question="Are core coders working from a formal design specification?" >}}

Depends on the project. Elastos has a lot of repositories. Eg. elastOS (trinity), carrier, blockchain, hive. And then there are 100+ other repos on github. The core code for the infrastructure is likely derived from a formal design specification (it’s all done internally as a team)

{{< /faqentry >}}

{{< faqentry question="Is a Remote Procedure Call (RPC) in Elastos Carrier an asynchronous call?" >}}
This is a synchronous call
{{< /faqentry >}}

{{< faqentry question="Does Elastos have error logging to capture bugs or abnormal events occurring in core code or carrier hardware?  If errors and events are logged, to whom are logs sent?" >}}

For elastos carrier SDK (normal carrier node side),  application can get running logs by calling API ela_log_init(), and application (or upperlayer) can integrate those logs to their log systems; For elastos bootstrap node, all running logs would be output to syslog facility

{{< /faqentry >}}
