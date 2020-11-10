+++
title = "Trinity dApp SDK"
weight = 140
chapter = false
pre = ""
alwaysopen = false
+++

## Introduction

The **Trinity dApp SDK** is an additional and optional javascript library, distributed as a NPM package. It provides various helpers, classes to **make it easier to use some features** in **elastOS dApps**. Developers can therefore focus more on core features of their dApps instead of on technical Elastos concepts.

## Installation

````shell
npm install --save @elastosfoundation/trinity-dapp-sdk
````

## Usage example

````javascript
import * as TrinitySDK from '@elastosfoundation/trinity-dapp-sdk';
// ...
let hiveAuthHelper: TrinitySDK.Hive.AuthHelper;
````

## Modules list

{{< children >}}