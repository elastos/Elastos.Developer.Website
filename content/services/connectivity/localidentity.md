
+++
title = "Local identity connector"
weight = 30
chapter = false
pre = ""
alwaysopen = true
+++

A local identity connector is available to **quick start** using Elastos **without depending on external wallet applications** such as Elastos Essentials. This is useful for several things:

* To **easily on board new users who don't have an external wallet** yet. A DID can be created for them and they can get started in the app in a few seconds, then export their DID later on to a real wallet.
* For mobile apps, **to pass app stores verification**. iTunes doesn't allow applications to exclusively depend on other applications to run. As a consequence, asking users to "sign in with an external DID wallet" to continue inside an app is forbidden. Because of this, mobile apps willing to be published on iTunes need to use the local identity connector to let users choose whether they want to use a built-in / auto-generated / temporary identity, or a real identity from an external wallet such as Elastos Essentials.

## Basic flow

What happens when the local identity connector is used in an app?

* **First time only**:
  * User gets prompted for his name
  * A local DID (in app) is created for him and published to the ID chain

* **When the local identity is already created**:
  * All interactive operations such as getting DID credentials **don't leave the initial application**, and fake information is returned. For example, if the application requests the user's "email", a fake email such as "email@nowhere.com" is returned by this connector. The reason is that when using local identities, there is no real identity management for users. **It's a simple and temporary way to start using DIDs**.