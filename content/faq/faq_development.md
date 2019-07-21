+++
title = "FAQ: Development"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< ownership "Kiran Pachhai" >}}


{{% faqentry question="In the Developers Beginner’s Guide to Elastos, there is very little info on the SDKs. Can you talk about the function of SDKs and how they fit into the project development workflow." %}}

SDK is an Elastos Runtime SDK and this is targetted for different platforms such an android, linux, etc. The implementation is in C++. This is directly encoded within the trinity browser and through reflection, we can call on these C++ function calls from javascript. For native android apps, we can call on this SDK via java as a jar/aar package will be provided. For native ios apps, we can call on this SDK via objective c/swift(this is not 100% complete and is in development). For react native/flutter apps, we can create react native plugins and write the corresponding implementation in java/swift/objective c.

{{% /faqentry %}}

{{% faqentry question="Some virtual computers that I ran on Windows or Mac had very limited device drivers. Does the SDK provide USB, pen, keyboard, and printer drivers, or do we have to wait for device manufacturers to provide those?" %}}

Currently, trinity browser uses cordova plugin to expose the underlying hardware to the elastos apps and this is for mobile devices. The plans for windows or mac have not yet been determined

{{% /faqentry %}}

{{% faqentry question="Is there an SDK plug-in for popular IDEs like; PyDev, Aptana, Visual Studio, etc.?" %}} 

It’s a C++ SDK so this can be extended to be used from python, golang, etc. However, no plugin available for IDEs yet. Maybe in the future

{{% /faqentry %}}

{{< todo "Not right? Ex: On android, developers use a android sdk, not the C++ native part" >}}

{{% faqentry question="Is there a difference between the terms ecosystem and platform in relation to Elastos?" %}}

Platform usually refers to a set of SDKs and APIs that are provided that can be used to interact with ALL the services within the Elastos Network Operating System. An ecosystem extends way beyond that as it also refers to community governance and how the project is run

{{% /faqentry %}}

{{% faqentry question="Are core coders working from a formal design specification?" %}}

Depends what project. Elastos has a lot of repositories. Eg. runtime, carrier, blockchain. And then there are 45+ other repos on github. The core code for the infrastructure is likely derived from a formal design specification (it’s all done internally as a team)

{{% /faqentry %}}

{{% faqentry question="Is a Remote Procedure Call (RPC) in Elastos an asynchronous call?" %}}
This is a synchronous call
{{% /faqentry %}}

{{% faqentry question="Are SDKs written for specific language like C++, Python, and Java?" %}}

It’s a C++ SDK so this can be extended to be used from python, golang, etc. For android, a corresponding JAR is created, etc.

{{% /faqentry %}}

{{< todo "Need to improve this answer" >}}


{{% faqentry question="Does Elastos have error logging to capture bugs or abnormal events occurring in core code or carrier hardware?  If errors and events are logged, to whom are logs sent?" %}}

For elastos carrier sdk (normal carrier node side),  application can get running logs by calling API ela_log_init(), and application (or upperlayer) can integrate those logs to their log systems; For elastos bootstrap node, all running logs would be output to syslog facility

{{% /faqentry %}}
