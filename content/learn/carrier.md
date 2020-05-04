
+++
title = "Elastos Carrier"
weight = 50
chapter = false
pre = ""
alwaysopen = false
+++

### Carrier presents a decentralized, fully encrypted, peer-to-peer platform that takes over all network traffic between virtual machines and transmits information on behalf of dApps. 

The platform effectively serves to replace the outdated IP address-based communication system of the previous web and generates unique 
identifiers - called Carrier IDs - for users and devices on its platform. Thus, the Carrier platform realizes truly anonymous and private 
communication between users and devices, where data can be exchanged securely. As such, Carrier provides uncompromising data security for users, 
whose valuable data cannot be accessed or stolen by third parties.


### Carrier, Elastos Runtime (RT) and Real-Time Communications (RTC)

The foundation of the carrier’s current technical architecture is based on the DHT-centric, decentralized distributed network. On top of it, a friend to friend basic communication network was made, which we provide several layers of functional interfaces. First, we have the relationship between nodes and nodes. On top of it, the message will be provided. On top of that, continuous data transmission, loss transmission, datagram transmission, and higher layer transmission semantics will be provided.

So the carrier’s basic features are its own functionality in the framework of communication infrastructure. We had developers asked us before, is the carrier involved with RTC of Elastos’s RT? In fact, this is an inverted relationship. Elastos RT will provide the RTC ability, but this RTC ability ultimately relies on the carrier to provide the foundation support. It means RT will have RTC, but the RTC eventually comes down on the carrier implementation, which means that the RTC is implemented with the carrier’s communication channel. This is an inverted relationship. The carrier itself is involved with RTC, but the carrier’s communication capabilities are injected into RT, which enables RT to achieve remote RTC.

At present, the carrier contains several levels of capability: First, the carrier contains support for the association between nodes, and all nodes on the carrier are in a DHT network. However, nodes and nodes are relatively isolated. To establish the communication between nodes and nodes, first of all, we need to establish the relationship between the nodes. So the carrier has a set of APIs. Helping establish relationships between the nodes is a bit like making real-world friends, or like your contacts in Wechat. For A and B to communicate, A and B have to be friends. The carrier can support establishing the relationships between nodes with the basic API. That’s what the API does. On this basis, the carrier also provides a message-oriented API, which means once a relationship is established between the nodes, the most basic message can be used. The messages are not connected. They were done through the network. If A and B are friends, they can send messages to each other at any time.

A can send messages to B directly and vice versa. The message doesn’t need to be connected between A and B. the DHT network can serve as an intermediary to achieve the message transmission between A and B. That’s the case for messages. On top of the message, we also provide products facing big data transmission. For example, besides messages between A and B, big chunks of data also need to be transmitted between applications. Big chunks of data are kind of communication mechanisms like the socket. The carrier also provides the API of the session to help establish data transmission similar to the UDP datagram. In the carrier system, we call it stream.

The session call ability provided by the carrier actually has two tiers. One is a mode similar to UDP datagram; The other mode is similar to TCP streaming. Both models are implemented on top of the stream. You can check the box and either select the datagram mode or streaming mode. The two modes are identical in terms of interface, but they have two different working mechanisms. One is simulation TCP, the other is simulation UDP. On top of this, we also provide data encryption and decryption, multiplexing, and interface forwarding upper semantics, to make it easier for carrier developers to provide application support and make it easier to use.

The carrier is a completely decentralized network. It is not operated by some intermediate or a group of central servers. Therefore the carrier itself, as a network, will not store any user information. For example, messages that the user sends, communication between nodes, relationships between friends are all stored in the node itself. In other words, the data of the node is right here. The carrier or intermediate servers will not touch or save any user data.
