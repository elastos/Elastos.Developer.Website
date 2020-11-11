+++
title = "Trinity native"
weight = 50
chapter = false
pre = ""
alwaysopen = false
+++

## What is Trinity native?

Trinity is the technical name of the elastOS project. Trinity native is a sub-project of Trinity, that allows taking the trinity source code plus a custom dApp source code, merge them together and generate source projects for android, iOS and desktop, in order to **be able to run a developer dApp as a native standalone application** on app stores, instead of running only inside elastOS.

## What happens technically?

When building elastOS, we take the trinity runtime (native source code, not JS), plugins, etc, then we take several ionic dApps such as the Launcher, the identity dApp, the wallet dApp. dApps are compiled first, and added as raw resources inside the native application project.

For Trinity native, this is very similar, except that we don't build any of the elastOS dApps. Instead, we **only build the target developer dApp** and the build tools configures that dApp as the start-up dApp. App icon, splash screens and a few other things are **customized**, and **the runtime is tweaked** to adjust to the "dApp running as a standalone application" context.

## Why should I build my dApp as a trinity native dApp?

Running a dApp inside elastOS has advantages for the end user experience. All dApps are at the same location, so the transitions when for example a dApp needs to sign in or pay using the identity dApp or the wallet is seamless. Though, you may not be willing to run in the elastOS ecosystem only, for easier adoption and marketing.

Trinity native takes advantage of both worlds:

* **You code your application only once**. Exactly the same code. Not a single line has to be changed.
* This dApp **can be published on the elastOS marketplace and run inside elastOS** (android and desktop).
* But you **can also publish it as a native application** at the same time, on android, ios and desktop.

One code base, many running environments: android native, iOS native, elastOS android, elastOS mac, elastOS windows, mac native, etc.

