
+++
title = "Redux Storage"
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++

The first thing you need in a dApp is local storage. With that we can store login and other client-side data that
your dApp needs. Later we'll connect to Elastos Hive for external decentralized storage and the Elastos ETH Sidechain
which gives you access to smart contracts.

First let's install some new packages we'll be using:

    npm install --save connected-react-router history ion-router ionicons redux react-redux redux-devtools redux-devtools-extension redux-persist redux-thunk @types/react-redux
    
Then we need to allow access to the **File** plugin for our dApp through the `manifest.json`.

{{< notice warning >}}
    If you change the packages or <b>manifest.json</b> you will likely have to restart <b>trinity-cli run</b>.<br/>
    <br/>
    Then close elastOS and re-open it again once you give the dApp a few seconds to update.
{{</ notice >}}

#### public/assets/manifest.json

```js {linenos=table,hl_lines=[4],linenostart=31}
"plugins": [
    "Device",
    "NetworkStatus",
    "File"
],
```
    
{{< spacer 1 >}}
    
### 1. Create a Redux Store for the user's **"Profile"**

We'll make a new folder called `store` in the `src` root and creat these files:

#### src/store/index.ts

```js
import { createStore, applyMiddleware } from 'redux'
import { persistStore, persistReducer } from 'redux-persist'
import storage from 'redux-persist/lib/storage'
import { composeWithDevTools } from 'redux-devtools-extension'
import thunk from 'redux-thunk'
import { createBrowserHistory } from 'history'
import { routerMiddleware } from 'connected-react-router'

import createRootReducer from './reducers'

export const history = createBrowserHistory()

/*
 * Auto-scroll to top on page change
 */
history.listen((e, type) => {
  if (type === 'PUSH' && window.scrollTo) {
    window.scrollTo({left: 0, top: 0})
  }
})

const persistConfig = {
  key: 'root',
  storage: storage,
}

const pReducer = persistReducer(persistConfig, createRootReducer(history))


export const store: any  = createStore(
  pReducer,
  composeWithDevTools(
    applyMiddleware(thunk.withExtraArgument({})),
    applyMiddleware(routerMiddleware(history))
  )
)

export const persistor = persistStore(store)
```

{{< spacer 2 >}}

#### src/store/reducers.ts

```js
import { combineReducers } from 'redux'
import { connectRouter } from 'connected-react-router'

import profile from './redux/profile'


const createRootReducer = (history) => combineReducers({
  router: connectRouter(history),
    ...profile
})

export default createRootReducer
```

{{< spacer 2 >}}

#### src/store/redux/profile.ts

```js
/**
 * Redux - Profile
 */

export enum ProfileActionTypes {
  SET_DID = 'SET_DID',
  SET_INFO = 'SET_INFO',
  LOGGING_IN = 'LOGGING_IN',
  LOGOUT = 'LOGOUT'
}

export interface ProfileAction {
  type: ProfileActionTypes,
  did?: string | null,
  name?: string,
  country?: string
}

/*
*************************************************************************************
* Actions
*************************************************************************************
 */
export const ActionSetDID = (did: string): ProfileAction => ({
  type: ProfileActionTypes.SET_DID,
  did
})

export const ActionSetInfo = ({name, country}: {name: string, country: string}): ProfileAction => ({
  type: ProfileActionTypes.SET_INFO,
  name,
  country
})


/*
*************************************************************************************
* Store Schema
*************************************************************************************
 */
export interface ProfileState {
  init: boolean,
  did: string | null,
  name: string
}

const initialState: ProfileState = {
  init: false,
  did: null,
  name: ''
}

/*
*************************************************************************************
* Reducer
*************************************************************************************
 */
export default {

  profile: (state: ProfileState = initialState, action: ProfileAction) => {

    switch (action.type) {
      case ProfileActionTypes.SET_DID:
        return {
          ...state,
          did: action.did,
        }

      case ProfileActionTypes.SET_INFO:
        return {
          ...state,
          name: action.name,
          country: action.country
        }
    }

    return state
  }
}
```

### Your folders should look like:

{{< figure src="/build/elastOS/tutorials/react/img/folders_1.png" >}}

### Also we'll add a simple Loading page which uses IonLoading

#### src/pages/Loading.tsx

```js
import React from 'react'
import { IonLoading, IonPage, IonContent } from '@ionic/react'

const Loading: React.FC = () => {
  return (
    <IonPage>
      <IonContent>
        <IonLoading
          isOpen={true}
          message={'Loading...'}
        />
      </IonContent>
    </IonPage>
  )
}

export default Loading
```

{{< spacer 2 >}}

### Now let's connect the redux store to our React App

#### src/index.tsx

```js
import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { PersistGate } from 'redux-persist/lib/integration/react'
import { ConnectedRouter } from 'connected-react-router'
import { store, persistor, history } from './store'
import Loading from './pages/Loading'
import App from './App'

ReactDOM.render(
  <Provider store={store}>
    <PersistGate loading={<Loading />} persistor={persistor}>
      <ConnectedRouter history={history}>
        <App />
      </ConnectedRouter>
    </PersistGate>
  </Provider>,
  document.getElementById('root')
)
```

At this point you can use Redux as you normally do, hopefully you've done this before, 
if not you can learn more about Redux at {{< externallink title="https://redux.js.org/" >}}https://redux.js.org{{< /externallink >}}

{{< spacer 2 >}}

{{< hero >}}
    {{< heroitem link="/build/elastos/tutorials/react/login" rightArrow="true" >}}
        <h5>Add DID Login</h5> 
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 8 >}}
