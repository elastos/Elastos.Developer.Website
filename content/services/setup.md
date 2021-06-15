+++
title = "Initial setup"
weight = 1
chapter = false
pre = ""
alwaysopen = true
+++

## DID

{{< tabs >}}
    {{< tab name="Typescript" codelang="shell" >}}
$ npm install @elastosfoundation/did-js-sdk
    {{< /tab >}}
{{< /tabs >}}

## Connectivity and Connectors

Add libraries to the project:

{{< tabs >}}
    {{< tab name="Typescript" codelang="shell" >}}
$ npm install @elastosfoundation/elastos-connectivity-sdk-js
$ npm install @elastosfoundation/essentials-connector-client-browser
    {{< /tab >}}
{{< /tabs >}}

Setup the connectivity SDK and add connectors:

{{< tabs >}}
    {{< tab name="Typescript" codelang="typescript" >}}
import { connectivity, DID } from "@elastosfoundation/elastos-connectivity-sdk-js";
import { EssentialsConnector } from "@elastosfoundation/essentials-connector-client-browser";

constructor() {
  connectivity.registerConnector(new EssentialsConnector());
}
    {{< /tab >}}
{{< /tabs >}}