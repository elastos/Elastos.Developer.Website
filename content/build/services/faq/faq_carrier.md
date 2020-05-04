+++
title = "FAQ: Carrier"
date = 2019-05-24T21:15:33+02:00
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++ 

{{< faqentry question="How will the network be maintained? How will the Carrier see to its own needs?" >}}
All the DPoS supernodes on the Elastos Blockchain network also run Elastos Carrier Bootstrap nodes which helps distribute the nodes geographically all over the globe. The Carrier network is similar to the way the internet works. The main use case for Carrier comes from people using it to develop their applications and this is desirable for any developer as Carrier is much more secure than the traditional internet. More carrier nodes will continuously be deployed all over the world as people see the need for it. Its value comes from its security and being a completely decentralized end-to-end encrypted network.
{{< /faqentry >}}

{{< faqentry question="How can I make money with the Elastos Carrier?" >}}
You cannot make money with Elastos Carrier. Elastos Carrier nodes help people communicate with each other in a completely secure manner because no intermediaries are involved and communication is end-to-end encrypted and as such personal data is protected by this robust decentralized network.
{{< /faqentry >}}

{{< faqentry question="Is the Elastos internet faster?" >}}
This new ecosystem does not aim to be faster than the current internet but to be much more secure. The more nodes are added to the network, the more robust the Elastos network becomes. Note that the Elastos internet(or also known as Elastos Carrier) runs on top of the current internet so you will still need an internet connection of some kind to run applications built using Elastos Carrier. Carrier abstracts away most of the vulnerabilities that are exposed on the traditional internet so personal data and communication is secured in a decentralized manner without going through any third parties.
{{< /faqentry >}}

{{< faqentry question="How will Elastos proceed to deploy all these nodes?" >}}
Around 1 million carrier nodes have already been deployed in China. Look at the article about [The TV Box from Shanghai Shijiu TV](https://elanews.net/2018/08/08/elastos-tv-box-to-bring-1-million-carrier-nodes-by-end-of-year/). In addition, all the DPoS supernodes also run Elastos Carrier bootstrap nodes which are geographically distributed all over the world. Also, because Elastos Carrier is very lightweight, it can be deployed on very small microsystems such as Raspberry Pi, smart cameras, etc which will further increase the number of nodes.
{{< /faqentry >}}

{{< faqentry question="How does the TV Box work?" >}}
[Here is an article that explains how the box works.](https://elanews.net/2018/08/08/elastos-tv-box-to-bring-1-million-carrier-nodes-by-end-of-year/)
{{< /faqentry >}}

{{< faqentry question="How does the Carrier network work?" >}}
[Here is a series of videos that will help you understand the technical aspect of the Carrier network.](https://elanews.net/videos/elastos-carrier-explained-series/). There is also an Elastos in a Nutshell series that covers Elastos Carrier in more detail.
- [Elastos and Peer to Peer Carrier Network Part 1](https://cyberrepublic.press/peer-to-peer-carrier-network-part-1/)
- [Elastos and Peer to Peer Carrier Network Part 2](https://cyberrepublic.press/elastos-in-a-nutshell-carrier-network-part-2/)
{{< /faqentry >}}

{{< faqentry question="Does Elastos Carrier obfuscate (hide) the source and destination “address” from trackers like an Onion Router (TOR)?" >}}
Through protocol of toxcore, none of the nodes can get IP details of other node without being friend to each other. So carrier inherits this property. Carrier node would not acquire any information of other nodes, unless they are friends with each other.
{{< /faqentry >}}

{{< faqentry question="How do elastos carrier stay away from tcp/ip? Won't we have to plug an ethernet cable to our elastos carrier devices?" >}}
Carrier still uses tcp/ip protocols underneath but it’s hidden away so that apps cannot access it directly. So, it’s still using TCP,UDP for data transmission. Also, carrier uses NAT traversal to automatically find devices in a local area network so this is the reason why you can setup a carrier node behind your router but elastos apps can still get to them even if that carrier node has no public facing IP address. So it’s still utilizing the traditional internet but just makes it secure so apps don’t even have access to traditional internet protocols. Instead Carrier does that for them. You will still need the internet connection from the isp. Elastos is built on top of the current internet infrastructure. Internet is the base layer basically
{{< /faqentry >}}

{{< faqentry question="How is data encrypted with Elastos Carrier ?" >}}
Public key encryption. Public key encryption is an asymmetric encryption. In assymetric encryption, you just need to know your friend’s public key to encrypt and ur own private key to decrypt as an example. Asymmetric encryption uses two different keys for the encryption and decryption processes of sensitive information. Both keys are derived from one another and created at the same time. They are divided into and referred to as a public and a private key, which makes up the key pair. Data is only encrypted with a public key and thus can only be decrypted with the matching private key. The encryption PGP offers is just as strong as that of AES, but it adds the additional security that prevents anyone with just the public key from being able to decrypt data that was previously encrypted with it. Another benefit of asymmetric encryption is that it allows for authentication. After you have exchanged public keys with your trading partners, the private keys can be used to digitally sign the encrypted content, allowing the decryptor to verify the authenticity of the sender. You can see how its handy for elastos carrier.
{{< /faqentry >}}

{{< faqentry question="AES is fast and works best in closed systems and large databases; PGP should be used when sharing information across an open network, but it can be slower and works better for individual files. Does it means that Elastos will be slow ?" >}}
Not necessarily. The transfer of data is not affected by it. It’s only the encryption decryption at the nodes that might be a bit affected but even then, it’s not necessarily a noticeable difference. You pretty much turn your plain text into a jumble mess on your end, send it across the network(according to how fast the network is) and then your friend decrypts the jumble mess into plain text. There’s always trade offs to speed and security as evidenced by the way Blockchain works.
{{< /faqentry >}}

{{< faqentry question="And that's why I'm wondering if streaming a movie will ever be possible on elastos, can you decrypt little pieces of the code and watch your movie while you receive it?" >}}
This is entirely possible. Perhaps, there can be community members who can take on this challenge and contribute to the Elastos Carrier project. You would just need to build a streaming protocol on top of Elastos Carrier to make this possible.
{{< /faqentry >}}
