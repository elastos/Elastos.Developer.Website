+++
title = "Using Plugins"
weight = 20
chapter = false
pre = ""
alwaysopen = true
+++

## Ionic native apps vs elastOS apps

If you are familiar with ionic or cordova development, you already know that cordova native plugins can be added to your app according to your needs. For example, if you want to access device camera, this can't be done in pure Javascript code, and requires some native android/ios bridges through a cordova plugin.

In elastOS, the native elastOS application itself already embeds a **fixed set of plugins**. This means that **you cannot add your own native plugins**. 

Writing capsules for elastOS is different than writing ionic applications in the sense that elastOS capsules only deal with HTML/Javascript parts, and not with native parts (whereas native ionic apps mix both javascript and native code through plugins).

When you write a elastOS capsule, you can then access a **limited set of plugins** (you can find them in the elastOS plugins API reference), and nothing else.

## Application compilation

An other consequence of dealing only with javascript code in elastOS is that **writing and releasing capsules doesn't require any compilation**, contrary to real ionic applications. You simply write your HTML/Javascript code, and send it to the elastOS native app who will handle your capsule (using trinity-cli during development, or through the dApp store for distribution).

## Plugins usage

Here is how to declare the existing global plugin instances from your capsules and start using them right away:

| Plugin | Usage |
| ------ | ----- |
| AppManager | ```declare let appManager: AppManagerPlugin.AppManager;``` |
| Carrier | ```declare let carrierManager: CarrierPlugin.CarrierManager;``` |
| Hive | ```declare let hiveManager: HivePlugin.HiveManager;``` |
| Wallet | ```declare let walletManager: WalletPlugin.WalletManager;``` |
| DID | ```declare let didManager: DIDPlugin.DIDManager;``` |
| Standard cordova plugins | View examples in plugins API reference. |

{{< spacer 1 >}}

{{< hero >}}
    {{< heroitem link="https://developer.elastos.org/references/trinity_plugins/index.html" linkBlank="true" rightArrow="true" >}}
        <h5>Plugins API</h5>
    {{< /heroitem >}}
{{< /hero >}}
