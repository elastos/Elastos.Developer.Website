+++
title = "The Title Bar"
weight = 110
chapter = false
pre = ""
alwaysopen = false
+++

## Introduction

In order to provide a more homogenous browser-like experience to end users, elastOS encapsulates all capsules with a global title bar.

### Title bar features

* **Set a title**. Default: Application name
* **Customize icons**: 3 available slots, using built-in or custom pictures.
* **Change the background color** to any hex color.
* **Change foreground color mode** to predefined dark or light modes.
* **Setup a menu with actions**. This menu is optional.
* **Control the navigation mode**: minimize or close.
* **Control the progress bar** with several possible actions: launch, download, other...

### Minimal implementation

By default, your capsule doesn't need to edit anything. The title bar has default colors and its title is set to the application name. The navigation mode is configured to minimize the capsule when users press the "back" icon. No menu is displayed.

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

You have to call **setTitle()** every time you enter your screen, because the title bar may have been changed by other screens during navigation. On angular capsules this is usually done in the **ionViewWillEnter()** method:

{{< tabs >}}
    {{< tab name="Angular" codelang="typescript" >}}
ionViewWillEnter() {
    titleBarManager.setTitle("Screen title");
}
    {{< /tab >}}
{{< /tabs >}}

### Custom and built-in icons

There are 4 available icon slots on the title bar: outer left, inner left, inner right, and outer right. Though, the outer left slot is reserved for the minimize/close default action, to make sure users always have a way to exit a capsule (for example in case it becomes unresponsive).

In order to configure the 3 other slots, you can call the following code:

{{< tabs >}}
    {{< tab name="Angular" codelang="typescript" >}}
ionViewWillEnter() {
    titleBarManager.setIcon(TitleBarPlugin.TitleBarIconSlot.INNER_LEFT, {
        key: "back",
        iconPath: TitleBarPlugin.BuiltInIcon.BACK
    });
}
    {{< /tab >}}
{{< /tabs >}}

The above code uses one of the built-in icons for convenient. You can also choose to use your own icons:

{{< tabs >}}
    {{< tab name="Angular" codelang="typescript" >}}
ionViewWillEnter() {
    titleBarManager.setIcon(TitleBarPlugin.TitleBarIconSlot.OUTER_RIGHT, {
        key: "myicon",
        iconPath: "assets/icons/ic_myicon.png"
    });
}
    {{< /tab >}}
{{< /tabs >}}

### Removing an icon

{{< tabs >}}
    {{< tab name="Angular" codelang="typescript" >}}
ionViewWillEnter() {
    titleBarManager.setIcon(TitleBarPlugin.TitleBarIconSlot.OUTER_RIGHT, null);
}
    {{< /tab >}}
{{< /tabs >}}

### Handle icon events

Each icon you configure on the title bar has a **key** value that should be unique. In order to receive click events, you can register one or several listeners like this:

{{< tabs >}}
    {{< tab name="Angular" codelang="typescript" >}}
let myIconListener = (menuIcon) => {
    if (menuIcon.key == "back") {
        // Do something
    }
    else if (menuIcon.key == "myicon") {
        // Do something else
    }
};
titleBarManager.addOnItemClickedListener(myIconListener);
    {{< /tab >}}
{{< /tabs >}}

### Removing icon listeners

When you leave a screen, don't forget to unregister you icon listeners to not receive unsollicited events:

{{< tabs >}}
    {{< tab name="Angular" codelang="typescript" >}}
titleBarManager.removeOnItemClickedListener(myIconListener);
    {{< /tab >}}
{{< /tabs >}}

### Configure the navigation mode

On your main screen you probably want to minimize the app when back is pressed. This is the default mode, so you don't have anything to do. Though for some screen, you may want to forbid minimization and instead, force closing the screen like this:

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

By default, there is no title bar menu icon. You can add choose to setup a list of menu items with icons and titles. When menu items are configured, they overwite any configured icon on the outer right icon slot.
Icon events are receive by icon clicked listeners, like for other icons outside of menu items.

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
    titleBarManager.setupMenuItems(menuItems);
}
    {{< /tab >}}
{{< /tabs >}}

### Title bar visibility and landscape immersion

Games and specific applications need to rotate the screen to be landscape, and hide all kind of title and status bars. Though it is possible to hive the elastOS title bar while in portrait, this is something not recommended for a good user experience.

The following code sample allows to rotate the screen to landscape orientation and hide all UI controls:

{{< tabs >}}
    {{< tab name="Angular" codelang="typescript" >}}
enterLandscape() {
    titleBarManager.setVisibility(
      TitleBarPlugin.TitleBarVisibility.HIDDEN,
      TitleBarPlugin.NativeStatusBarVisibility.HIDDEN
    );

    window.screen.orientation.lock('landscape');
}

exitLandscape() {
    titleBarManager.setVisibility(
      TitleBarPlugin.TitleBarVisibility.VISIBLE,
      TitleBarPlugin.NativeStatusBarVisibility.VISIBLE
    );

    window.screen.orientation.lock('portrait');
    window.screen.orientation.unlock();
}
    {{< /tab >}}
{{< /tabs >}}