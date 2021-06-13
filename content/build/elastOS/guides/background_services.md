+++
title = "Background services"
weight = 120
chapter = false
pre = ""
alwaysopen = true
+++

## elastOS background services

Background services in elastOS are instances of capsules that run without UI and that can be started when elastOS starts. Note that on mobile devices, **elastOS background services are NOT native background services**, so they don't run if the native elastOS app doesn't run. Though, they are useful for example for the wallet capsule to sync wallets, or chat capsules to listen to carrier messages, before manually starting those capsules.

Though, elastOS for desktop may provide permanent background services, after it's released.

### Starting a background service at elastOS start

In order to automatically start a service when elastOS starts, you need to add a specific **startup_service** manifest entry with the service name. You can choose any service name. This name will be used later to let the dAPP UI communicate with this service:

```js
{
    "id": "org.your.app",
    "version": "1.2.1",
    "version_code": 14,
    "name": "My app",
    ...
    "startup_service": [
        "myservice"
    ]
}
```

### Handling the service in the capsule code

Background services actually **launch another instance of the capsule code**, in a sandboxed context. It's your responsibility to check the **startup mode** from your main app component, and route your application code to either display screens (if the startup mode is application), or to simply run a smaller number of features, just for your service (in case the startup mode is service).

Example (app.component.ts):

```typescript
this.platform.ready().then(async () => {
    appManager.getStartupMode((startupInfo: AppManagerPlugin.StartupInfo) => {
        if (startupInfo.startupMode === AppManagerPlugin.StartupMode.SERVICE)
            console.log("Started as a service.");
        else
            console.log("Started to show a user interface.");
    });
});
```

After your service is started and has completed its most CPU-intensive initializations, it has to tell the application manager that it's ready so that the runtime can launch background services of other applications. If your service doesn't do this, other services are automatically started after an arbitrary amount of time.

```typescript
// All service initializations completed
appManager.notifyServiceReady();
```


As your service runs permanently **while elastOS is running**, make sure to be gentle on CPU and RAM consumption. For now, end users have no way to disable startup services.

### Communication between services and UI

As services and UI run in difference contexts, they can't share the same javascript objects. Instead, they have to communicate through app manager messages. For example, a background service can notify the UI context of an incoming carrier message, after what the UI can update itself.

Let's see for example how the capsule UI can send a kind of "command" message to the background service in order to ask it to start some long operation that will continue even if the capsule is stopped.

Note that the communication is only one way, not bidirectional, and sent messages cannot return data.

First, when in **service** startup mode, the capsule must listen to messages:

```typescript
type MyRPCMessage = {
    method: string;
    param: any;
}

appManager.setListener((message: AppManagerPlugin.ReceivedMessage) => {
    let rpcMessage = JSON.parse(message.message) as MyRPCMessage;
    switch (rpcMessage.method) {
        case "myMethod1“:
            console.log("Execute method 1");
            break;
        case "myMethod2":
            console.log("Execute method 2");
            break;
        default:
            break;
    }
});
```

To send such message from the UI context:

```typescript
let rpcMessage: MyRPCMessage = {
    method: "method1",
    params: { a: "123", s: "abc" }
}

appManager.sendMessage("#service:myservice", AppManagerPlugin.MessageType.INTERNAL, JSON.stringify(rpcMessage), ()=>{
    // Nothing to do
}, (err)=>{
    console.log("Failed to send RPC message to the background service", err);
});
```