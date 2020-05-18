
+++
title = "Login with DID"
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++

Now the fun begins, by being an elastOS capsule we can rely on elastOS's decentralized identity service.

#### Elastos uses DIDs which are short for **Decentralized Identifiers** which is a global W3C standard being created to replace all centralized identity solutions - read more at: {{< externallink title="https://w3c.github.io/did-core" >}}https://w3c.github.io/did-core/{{< /externallink >}}.

{{< spacer 1 >}}

### This requires we have an identity setup on elastOS

Go back to the elastOS home and click the **Identity** link on the bottom:

{{< rawhtml >}}
    <img src="/build/elastOS/tutorials/react/img/elastOS_identity_slt.png" height="300"> 
{{< /rawhtml >}}

Setting up the Identity is straightforward and I won't go into that here, once your identity go back to your app.


### 1. First we'll encapsulate the login with a new React custom hook

#### src/hooks/useSignIn.ts

```js
declare let appManager: AppManagerPlugin.AppManager
declare let didManager: DIDPlugin.DIDManager

export function useSignIn(optionalCallback: any = noop) {
  const signIn = (claims: any) => {
    /**
     * Request some credentials to the DID application.
     */
    appManager.sendIntent("credaccess", { claims }, {}, (response: any) => {
      console.log("Credential access response received")

      if (response && response.result && response.result.presentation) {
        console.log("Received a presentation, so we are now signed in.")

        // Create a real presentation object from json data
        didManager.VerifiablePresentationBuilder.fromJson(JSON.stringify(response.result.presentation), (presentation)=>{
          const credentials = presentation.getCredentials()
          console.log("presentation", JSON.stringify(credentials))
          optionalCallback(response.result.did, credentials)
        })
      }
    })
  }
  return [signIn] as [(obj: any) => void]
}

function noop() {}
```

{{< spacer 2 >}}

### 2. And here's a Login page, it only needs a button since it calls on elastOS to login

#### src/pages/Login.tsx

```js
import React, { useCallback } from 'react'
import { connect, useDispatch } from 'react-redux'
import {IonButton, IonHeader, IonPage, IonToolbar, IonTitle, IonContent } from '@ionic/react'

import { ActionSetDID, ActionSetInfo } from '../store/redux/profile'

import { useSignIn } from '../hooks/useSignIn'

const Login: React.FC = () => {

  const dispatch = useDispatch()

  const [signIn] = useSignIn((did: string, credentials:any) => {

    if(credentials.length) {
      const user = credentials[0].credentialSubject
      const {name, country} = user

      dispatch(ActionSetInfo({name, country}))
      dispatch(ActionSetDID(did))
    }
  })

  const login = useCallback(() => {
    signIn({name: true})
  }, [signIn])

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Login</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>

        <p style={{padding: '2em', textAlign: 'center'}}>
          Click to login with your Elastos DID
        </p>
        <IonButton expand="block" onClick={login}>Login</IonButton>
      </IonContent>
    </IonPage>
  )
}

const mapStateToProps = (state) => {
  return {profile: state.profile}
}


export default connect(mapStateToProps)(Login)
```

{{< spacer 2 >}}

### 3. Now import and show the Login page in **App.tsx** if the **props.profile.did** is not set

This is simplistic way of tracking login status of course, you'll see we are also mapping the `profile` 
data from redux on to props. 

If done correctly, your initial page should immediately show the Login page, and if you click login you should
see this popup:

{{< figure src="/build/elastOS/tutorials/react/img/elastOS_did_approve.png" >}}

In this image you can see we are requesting the DID which is always passed and additionally the `name` field, 
which was defined when we passed `{name: true}` into `signIn`.

```js
const login = useCallback(() => {
  signIn({name: true})
}, [signIn])
```

and in `signIn` we see that the claim is passed into the **intent**:

```js {linenos=table,hl_lines=[6],linenostart=4}
export function useSignIn(optionalCallback: any = noop) {
const signIn = (claims: any) => {
/**
 * Request some credentials to the DID application.
 */
appManager.sendIntent("credaccess", { claims }, {}, (response: any) => {
```

Once you click Accept you should see a password prompt and if done correctly you are taken back to the homepage
where I am now showing `props.profile.name` in **Tab1.tsx**

#### src/pages/Tab1.tsx

```js {linenos=table,hl_lines=[24],linenostart=21}
const Tab1: React.FC = (props: any) => {

  const closeApp = useCallback( () => {
    console.log("dApp is closing!")
    appManager.close();
  }, [appManager])

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Home</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonCard className="welcome-card">
          <img src="/assets/shapes.svg" alt="" />
          <IonCardHeader>
            <IonCardSubtitle>Get Started</IonCardSubtitle>
            <IonCardTitle>Welcome to Elastos!</IonCardTitle>
          </IonCardHeader>
          <IonCardContent>
            <p>
              Hello {props.profile.name}
            </p>

            <IonButton onClick={closeApp}>Close the app</IonButton>
          </IonCardContent>
        </IonCard>
      </IonContent>
    </IonPage>
  );
}


const mapStateToProps = (state) => {
  return {profile: state.profile}
}

export default connect(mapStateToProps)(Tab1)
```

{{< spacer 2 >}}

##### Tab1 showing the name from the elastOS Identity:

{{< figure src="/build/elastOS/tutorials/react/img/elastOS_tab1.png" >}}

If something isn't working you can view the source code for this tutorial at this point in time here: 
{{< externallink title="https://github.com/elastosjs/elastOS-react-tutorial/tree/6a481cd343881177f6d05ee436726b17246b5bfe" >}}https://github.com/elastosjs/elastOS-react-tutorial/tree/6a481cd343881177f6d05ee436726b17246b5bfe{{< /externallink >}}

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem rightArrow="true" >}}
        <h5>Connecting to a Smart Contract</h5> - Coming Soon 
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 8 >}}
