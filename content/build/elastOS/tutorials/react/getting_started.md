
+++
title = "Getting Started"
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

{{< hero >}}
    {{< heroitem link="https://github.com/elastosjs/elastOS-react-tutorial" linkBlank="true" rightArrow="true" >}}
        <h5><b>Find all the code for this tutorial here:</b> https://github.com/elastosjs/elastOS-react-tutorial</h5>
    {{< /heroitem >}}
{{< /hero >}}

Install the **trinity-cli** tool:

    sudo npm install -g @elastosfoundation/trinity-cli --unsafe-perm
    
    trinity-cli --version
    
    > Using DApp store endpoint https://dapp-store.elastos.org
    > 1.1.31

##### We Assume Your **Trinity-CLI** is Installed Properly and on Version 1.1.31  

From your workspace directory, this will create a new folder for you and is similar to `create-react-app`.

    | => trinity-cli new
    Using DApp store endpoint https://dapp-store.elastos.org
    ✔ Application title … [your app name]
    ... more fields
    
    cd [your app name]
    
##### This will create an initial template React elastOS Capsule

Open the new application in your IDE, and also run `npm install` to initialize things. 

{{< notice note >}}
    {{< rawspan fontweight="400" >}}There is a bug in the React template right now{{< /rawspan >}}, temporarily you must import <b>appManager</b>:
    <code>declare const appManager: AppManagerPlugin.AppManager</code><br/>
    <br/>
    Then ensure we set visibility to show on App mount (within React.Component Parent App):
    <code>
        useEffect(() => {
            appManager.setVisible("show")
        }, [])
    </code>
{{</ notice >}}

Let's do this now, open the new application in your IDE and open the file `src/App.tsx`

Replace the beginning code of `App` with:

```js
declare const appManager: AppManagerPlugin.AppManager

const App: React.FC = () => {

  const [ ready, setReady ] = useState(false)

  useEffect(() => {
    document.addEventListener("deviceready", () => setReady(true), false)
  }, [])

  useEffect(() => {
    if (!ready) return
    appManager.setVisible("show")
  }, [ready])

  return (
    <IonApp>
      {/* ... rest of your app */}
    </IonApp>
  )
}
```

This will wait for `"deviceready"` and then use elastOS's AppManagerPlugin `setVisible` method to show the capsule when
it's ready.

{{< notice note >}}
    Make sure your Android emulator is running, elastOS is installed and developer mode is on before this next step.
    
    See: <a href="/build/elastos/setup/testing">Running Your capsule</a> if you need help.
{{</ notice >}}

Now call `trinity-cli run` in the following fashion:

    trinity-cli run -p android
    
This will build your project and automatically install it, but there is a minor bug right now where the app won't show 
until the elastOS app refreshes, click a button like the Settings app and return to the home screen, then you should
see your app.

{{< figure src="/build/elastOS/tutorials/react/img/elastOS_home.png" >}}

### Close and Re-Open elastOS

We need to do this the first time to ensure the capsule connects to a running `trinity-cli run` server instance.

Now when you click your capsule it should open properly:

{{< figure src="/build/elastOS/tutorials/react/img/react_home.png" >}}

#### Now let's add some boilerplate tools:

{{< hero >}}
    {{< heroitem link="/build/elastos/tutorials/react/redux" rightArrow="true" >}}
        <h5>Setup Redux and Local Storage Persistence</h5> 
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 8 >}}
