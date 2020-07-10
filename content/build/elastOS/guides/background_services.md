+++
title = "Background services"
weight = 120
chapter = false
pre = ""
alwaysopen = false
+++

## elastOS background services

Background services in elastOS are instances of capsules that run without UI and that can be started when elastOS starts. Note that on mobile devices, elastOS background services are NOT native background services, so they don't run if the native elastOS app doesn't run. Though, they are useful for example for the wallet capsule to sync wallets, or chat capsules to listen to carrier messages, before manually starting those capsules.

### Starting a background service at elastOS start

In order to automatically start a service when elastOS starts, you need to add a specific manifest entry with the service name: 

TODO

### Handling the service in the capsule code

Background services actually launch another instance of the regular capsule code, in a sandboxed context. It's your responsibility to check the **startup mode** from your main app component, and route your application code to either display screens (if the startup mode is application), or to simply run a smaller number of features, just for your service (in case the startup mode is service).

Example:

TODO

### Communication between services and UI

As services and UI run in difference contexts, they can't share the same javascript objects. Instead, they have to communicate through app manager messages. For example, a background service can notify the UI context of an incoming carrier message, after what the UI can update itself.

TODO

