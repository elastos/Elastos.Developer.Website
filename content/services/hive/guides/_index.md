

+++
title = "Usage Guides"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

#### Hive authentication

All operations related to Hive storage happen in Hive SDKs. Though, in order to let applications access part of their vault (users storage location), users have to confirm that they trust the application from their identity wallet first.

This step is done automatically by Hive SDKs when a hive client is first created. But at least one Elastos connector must be configured first, such as Elastos Essentials. Once a connector is set up, Hive SDKs are able to **request a specific application ID credential to the identity wallet**, that is then used as an authentication method.

#### Start developping

{{< hero >}}
    {{< heroitem link="./basic">}}
        <h5>Basic usage</h5>
    {{< /heroitem >}}
{{< /hero >}}