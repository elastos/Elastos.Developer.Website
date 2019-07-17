+++
title = "Hive"
weight = 30
chapter = false
pre = "<i class='fa ela-page'></i>"
alwaysopen = false
+++

### Overview 
Elastos Hive is a basic service infrastructure that provide storage capabilities to dApps with decentralized characteristics, which leveraged standard IPFS/Cluster open source projects with some necessary refits.

Hive is the underlying storage architecture of Elastos. Based on IPFS, it provides a decentralized storage solution but it is more API friendly and has more features and higher reliability.

With Hive, dapps gain reliable access to file data using the HTTP API and the corresponding SDK. Each document is distributed to storage nodes in different regions of the world through the Hive network for higher data availability. At the same time, HIVE also provides a feature-rich KV (Key Value) access interfaces, which simplifies the access process of dapp data, speeds up dapp development speed, and improves preservation of application data.

All are welcome to contribute code and documentation to HIVE. More dapps integrated in the Elastos ecosystem will create better solutions based on decentralized data storage.

The core code of Hive is maintained by StorSwift (storswift.com). StorSwift is a technology-driven distributed storage company with cutting edge technology advantages in artificial intelligence storage and decentralized storage. Focusing on the development of distributed storage systems, the company has deep technical experience in related fields and has experience in large-scale data storage operation and maintenance.

Based on decentralized storage technology such as IPFS, StorSwift provides complete distributed storage products and solutions, providing users with low-cost, high-performance, high-availability, secure, reliable, fast and convenient access for massive data access, with leading product and technology advantages and operational experience in the blockchain storage DApp field.

### DApp Implementation using Hive
If you want to achieve true decentralization with more security, you need to use Hive. For example, for a decentralized chat application, the underlying storage can dock AWS, or dock their self-built cloud. The performance will be fine, but there is a flaw if that application is decentralized but the data is saved using the some centralised way. If you want to ensure the privacy of your data while improving its physical reliability (with data distribution across regions), you need to use Hive. If you want to perform data authentication and other operations, Hive is also necessary. Hive ensures that you really are the owner of your own data.

### Features
Hive is constantly developing. The current version is a developer preview and offers the following features:

- IPFS-based HTTP API: Access to various dapps through a light client.
- File view similar to the traditional file system: Users can operate and view specific files through traditional methods, such as file name, to avoid the complexity caused by HASH values ​​and to simplify the development process of dapps. At the same time, you can mount the folder in Hive through FUSE and read/write files in POSIX mode.
- Data cluster synchronization:  data uploaded by users can be automatically synchronized to multiple nodes to achieve better data availability. The user’s file view is also synchronized to multiple nodes. Read/write data can be done by getting access from any node, which makes the file operations completely decentralised.
- KV-based message API: Provides a message app based on the Key-Value format, which is optimized for common application scenarios of dapps.
- C/C++ SDK: Provides C/C++ SDK to optimize the logic of data storage process, and speeds up access to dapps.

In the future, Hive’s performance will be further enhanced. Data synchronization algorithms will be improved, and APIs and SDKs will be provided. At the same time, in order to access more storage nodes, based on the overall architecture of Elastos, an incentive mechanism will be introduced to the Hive system and the corresponding consensus algorithm will improve.

### Difference between Hive and other decentralized storage solutions
Hive is based on the popular IPFS project and has made many improvements. From the perspective of storage, most decentralized storage projects in the market are based on IPFS or mimic IPFS. Thus, functionally, Hive has many similarities to other storage projects.

But there are also significant differences:

* Hive is part of the Elastos ecosystem, so it is for dapps. Providing dapps with an excellent data storage platform is its most important task. It can be considered as the hard disk of Elastos’ operating system, but this hard disk spans different cities across different continents. It is physically separated and is a decentralized data storage pool, but it provides a similar user experience to traditional hard drives.
* Hive puts data security as the most important priority, protecting data from the perspective of physical security (data redundancy, high availability), logical security (preventing random modification), and network security (combining dapps with data encryption) to ensure data security. This realizes the statement that “I am the owner of my data”.