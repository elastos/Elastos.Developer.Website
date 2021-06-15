

+++
title = "Basic usage"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

## Create a local identity

{{< tabs >}}
    {{< tab name="Typescript" codelang="typescript" >}}
import { DID } from "@elastosfoundation/elastos-connectivity-sdk-js";

DIDBackend.initialize(new DID.ElastosIODIDAdapter(DID.ElastosIODIDAdapterMode.MAINNET));
let didStore = await DIDStore.open("a-store-name");
let rootIdentity = RootIdentity.createFromMnemonic(Mnemonic.getInstance().generate(), "", didStore, "a-store-password");

let myDID = await rootIdentity.newDid(storePass);
    {{< /tab >}}
{{< /tabs >}}

## Create a credential

{{< tabs >}}
    {{< tab name="Typescript" codelang="typescript" >}}
// The issuer is the person who creates and signs the credential
let issuer = new Issuer(myDID);

// The target DID is the user that will receive and import the created credential to his wallet
let targetDID = DID.from("did:elastos:someone");

// Create the credential
let vcb = new VerifiableCredential.Builder(issuer, targetDID);
let credential = await vcb.id("#the-credential-id").properties({
    anyKey: "AnyValue"
}).type("TestCredentialType").seal("a-store-password");
    {{< /tab >}}
{{< /tabs >}}

