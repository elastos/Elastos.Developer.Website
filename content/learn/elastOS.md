

+++
title = "elastOS"
weight = 80
chapter = false
pre = ""
alwaysopen = false
+++

elastOS is a native Android and iOS app that runs **"Capsules"** which are Elastos' version of dApps

##### Capsules are built in Ionic Framework and by default have no access make external requests 

{{< spacer 2 >}}

#### We do this for a few reasons:

1. By preventing arbitrary external data we can protect user's data and ensure privacy. All external requests must be approved by the user first, t
    this way users are more aware of what a dApp is trying to do.
    
2. True dApps should not call any "centralized" data sources, if you're making an HTTP(S) or websocket request to a centrally located
    server that you don't control, that's no longer a decentralized application. 
    
3. One primary principle of Elastos' vision is that dApps should not have full access to the network layer. Allowing this opens the door to
    many security issues, results in a loss of privacy and infringes on the ability of a {{< rawspan fontweight="400">}}user to own their own data{{< /rawspan >}}, which we believe
    is a fundamental right in the digital world.
    
     
