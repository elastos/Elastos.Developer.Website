+++
title = "The title bar"
weight = 110
chapter = false
pre = ""
alwaysopen = false
+++

## Introduction

In order to provide a more homogenous browser-like experience to end users, Trinity encapsulates all dApps with a global title bar.

### Title bar features

* **Set a title**. Default: Application name
* **Change the background color** to any hex color.
* **Change foreground color mode** to predefined dark or light modes.
* **Setup a menu with actions**. This menu is optional.
* **Control the navigation mode**: minimize, go back, close...
* **Control the progress bar** with several possible actions: launch, download, other...

### Minimal implementation

By default, your dApp doesn't need to edit anything. The title bar has default colors and its title is set to the application name. The navigation mode is configured to minimize the dApp when users press the "back" icon. No menu is displayed.

But for further customization and better user experience, you may want to do something like this:

* Change the screen title on each screen.
* When you are on your main sreen, pressing back should minimize the app, but on other screens, pressing back should go back to the previous screen.
* Adjust title bar colors to your own design.

### Accessing the title bar

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
declare let titleBarManager: TitleBarPlugin.TitleBarManager;
    {{< /tab >}} 
{{< /tabs >}}

### Setting a different title on each screen

You have to call **setTitle()** every time you enter your screen, because the title bar may have been changed by other screens during navigation. On angular dApps this is usually done in the **ionViewWillEnter()** method:

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
ionViewWillEnter() {
    titleBarManager.setTitle("Screen title");
}
    {{< /tab >}} 
{{< /tabs >}}

### Controlling the navigation (main screen)

On your main screen you probably want to minimize the app when back is pressed:

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
ionViewWillEnter() {
    titleBarManager.setNavigationMode(TitleBarPlugin.TitleBarNavigationMode.HOME);
}
    {{< /tab >}} 
{{< /tabs >}}

### Controlling the navigation (secondary screen)

On a secondary screen, you may want to come back to the previous screen:

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
ionViewWillEnter() {
    titleBarManager.setNavigationMode(TitleBarPlugin.TitleBarNavigationMode.BACK);
}
    {{< /tab >}} 
{{< /tabs >}}

In this mode, the title bar send a message to your application and it's up to your application to handle it the way you want. The message is a **navback** command sent to app manager's messages and you can catch it from a service in your app, like this:

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
myServiceInitSomewhere() {
    appManager.setListener((ret) => {
        this.onMessageReceived(ret);
    });
}

onMessageReceived(ret: AppManagerPlugin.ReceivedMessage) {
    if (ret.message == "navback") {
        this.navController.back();
    }
}
    {{< /tab >}} 
{{< /tabs >}}

### Controlling the navigation (single use screens)

Some of your screens started for example by intents, may need to be closed, when you don't want users to see them again after minimizing, or you don't want to allow back navigation. In this case, you can use the close navigation mode, that shows a close icon and totally cloes your app:

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
ionViewWillEnter() {
    titleBarManager.setNavigationMode(TitleBarPlugin.TitleBarNavigationMode.CLOSE);
}
    {{< /tab >}} 
{{< /tabs >}}

### Colors customization

Use html-like hex color codes to edit the title bar background color, and set the appropriate foreground mode to match icons and title colors with your background luminosity:

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
myServiceInitSomewhere() {
    titleBarManager.setBackgroundColor("#505080");
    titleBarManager.setForegroundMode(TitleBarPlugin.TitleBarForegroundMode.LIGHT);
}
    {{< /tab >}} 
{{< /tabs >}}

### Controlling the progress bar

If your application is doing operations that require users to wait for a while, you can show or hide activity indicators (progress bar) on the title bar. Those indicators have several modes, which are just used to show a different animation/color.

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
longOperation() {
    titleBarManager.showActivityIndicator(TitleBarPlugin.TitleBarActivityType.DOWNLOAD);

    // Do something long

    titleBarManager.hideActivityIndicator(TitleBarPlugin.TitleBarActivityType.DOWNLOAD);
}
    {{< /tab >}} 
{{< /tabs >}}

### Managing menu items

By default, there is no title bar menu icon. You can add choose to setup a list of menu items with icons and titles. When clicked, those menu items call a specific callback in your app and you can proceed to the appropriate action:

{{< tabs >}} 
    {{< tab name="Angular" codelang="typescript" >}} 
ionViewWillEnter() {
    let menuItems = [
        {
            key: "action1", 
            iconPath: "assets/images/action1-icon.png", 
            title: "Do something"
        },
        {
            key: "action2", 
            iconPath: "assets/images/action2-icon.png", 
            title: "Do something else"
        }
    ];
    titleBarManager.setupMenuItems(menuItems, (selectedMenuItem)=>{
        switch (selectedMenuItem.key) {
            case "action1":
                // Execute your action 1
                break;
            case "action2": 
                // Execute your action 2
                break;
        }
    });
}
    {{< /tab >}} 
{{< /tabs >}}