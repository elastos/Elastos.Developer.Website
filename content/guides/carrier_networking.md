+++
title = "Carrier networking"
date = 2019-07-09T21:15:40+02:00
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

{{< ownership "TangZhiLong" >}}

{{< todo "@BPI @ZhiLong CarrierSessionHelper-based content" >}}

{{< todo "@BPI @TangZhiLong What else can we do with carrier and want to explain to developers here?">}}

{{< todo "Find the equivalent codes for swift and trinity" >}}

## Introduction

Elastos Carrier provides features such as direct messaging (text or binary) to a peer, group messaging, or file transfer. This guide will show several of carrier's main features.

## Initialize carrier

### Configure carrier options

Carrier needs a few options to be configured first. Mostly, we must tell him which bootstrap nodes it should use to start communicating with the rest of the P2P network.

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
public class DefaultCarrierOptions extends Carrier.Options {
    public DefaultCarrierOptions(String path) {
        super();

        setOptions(path);
    }

    private void setOptions(String path) {
        setUdpEnabled(true);
        setPersistentLocation(path); // path is used to cache carrier data for better performance

        ArrayList<BootstrapNode> arrayList = new ArrayList<>();
        BootstrapNode node;

        node = new BootstrapNode();
        node.setIpv4("13.58.208.50");
        node.setPort("33445");
        node.setPublicKey("89vny8MrKdDKs7Uta9RdVmspPjnRMdwMmaiEW27pZ7gh");
        arrayList.add(node);

        node = new BootstrapNode();
        node.setIpv4("18.216.102.47");
        node.setPort("33445");
        node.setPublicKey("G5z8MqiNDFTadFUPfMdYsYtkUDbX5mNCMVHMZtsCnFeb");
        arrayList.add(node);

        node = new BootstrapNode();
        node.setIpv4("52.83.127.216");
        node.setPort("33445");
        node.setPublicKey("4sL3ZEriqW7pdoqHSoYXfkc1NMNpiMz7irHMMrMjp9CM");
        arrayList.add(node);

        node = new BootstrapNode();
        node.setIpv4("52.83.127.85");
        node.setPort("33445");
        node.setPublicKey("CDkze7mJpSuFAUq6byoLmteyGYMeJ6taXxWoVvDMexWC");
        arrayList.add(node);

        node = new BootstrapNode();
        node.setIpv4("18.216.6.197");
        node.setPort("33445");
        node.setPublicKey("H8sqhRrQuJZ6iLtP2wanxt4LzdNrN2NNFnpPdq1uJ9n2");
        arrayList.add(node);

        node = new BootstrapNode();
        node.setIpv4("52.83.171.135");
        node.setPort("33445");
        node.setPublicKey("5tuHgK1Q4CYf4K5PutsEPK5E3Z7cbtEBdx7LwmdzqXHL");
        arrayList.add(node);

        setBootstrapNodes(arrayList);
    }
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### Create a handler to receive status changes

A handler object will be provided to carrier, and several callbacks will be triggered there. From that handler you will be able to handle some of your app's logic.

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
public class DefaultCarrierHandler extends AbstractCarrierHandler {
    @Override
    public void onConnection(Carrier carrier, ConnectionStatus status) {
        Logger.info("Carrier connection status: " + status);

        if(status == ConnectionStatus.Connected) {
            String msg = "Friend List:";
            List<FriendInfo> friendList = CarrierHelper.getFriendList();
            if(friendList != null) {
                for(FriendInfo info: friendList) {
                    msg += "\n  " + info.getUserId();
                }
            }
            Logger.info(msg);
        }
    }

    @Override
    public void onFriendRequest(Carrier carrier, 
                                String userId, 
                                UserInfo info, 
                                String hello) {
        Logger.info("Carrier received friend request. Peer UserId: " + userId);
        CarrierHelper.acceptFriend(userId, hello);
    }

    @Override
    public void onFriendAdded(Carrier carrier, FriendInfo info) {
        Logger.info("Carrier friend added. Peer UserId: " + info.getUserId());
    }

    @Override
    public void onFriendConnection(Carrier carrier, 
                                   String friendId, 
                                   ConnectionStatus status) {
        Logger.info("Carrier friend connect. peer UserId: " + friendId);
        Logger.info("Friend status:" + status);

        if(status == ConnectionStatus.Connected) {
            CarrierHelper.setPeerUserId(friendId);
        } else {
            CarrierHelper.setPeerUserId(null);
        }
    }

    @Override
    public void onFriendMessage(Carrier carrier, String from, byte[] message) {
        Logger.info("Message from userId: " + from);
        Logger.info("Message: " + new String(message));
    }
}
  {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### Start Carrier

Now that we have options, and a handler, we can start carrier like this:

{{< todo "explain what is the 1000 parameter" >}}

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
// Initial setup
Carrier.Options options = new DefaultCarrierOptions(context.getFilesDir().getAbsolutePath());
CarrierHandler handler = new DefaultCarrierHandler();

// Create or get an instance
Carrier.getInstance(options, handler);
Carrier carrier = Carrier.getInstance();

// Start the service
carrier.start(1000);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### Add a friend

{{< todo "Explain if we can we request adding friend when peer is offline? So he can accept when he comes online?" >}}

Carrier supports friends management. You can add a peer as a friend using its peer address. That address can be retrieved from your friend's application context. This can be provided by the application through a QR code, for instance.

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
String userId = Carrier.getIdFromAddress(peerAddr);
if(!Carrier.getInstance().isFriend(userId)) {
    Carrier.getInstance().addFriend(peerAddr, CARRIER_HELLO_AUTH);
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

After requesting a peer address to become friend, that peer will receive your request in its DefaultCarrierHandler, inside onFriendRequest(). At that time, peer's app can choose to accept or reject your invitation.

### Accept an invitation to become friend

When a peer receives an invitation in onFriendRequest(), he can accept it like this:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
if (hello.equals(CARRIER_HELLO_AUTH) == false) {
    Logger.error("Ignore to accept friend, not expected.");
    return;
}
Carrier.getInstance().acceptFriend(peerUserId);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

When the request is accepted, both parties receive the information in onFriendAdded().

### Listen to friends activity

You can know when friends come online or offline listening to the onFriendConnection() callback:

{{< todo "Clarify what setPeerUserId does" >}}

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
@Override
public void onFriendConnection(Carrier carrier, String friendId, ConnectionStatus status) {
    if(status == ConnectionStatus.Connected) {
        CarrierHelper.setPeerUserId(friendId);
    }
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### Send a message to a friend

Sending a message to a friend is as easy as this. Please note that only friends can receive messages to prevent spam.

{{< todo "What is sPeerUserId?" >}}
    
{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
Carrier.getInstance().sendFriendMessage(sPeerUserId, message);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### Receive a message

Messages are received by the carrier handler:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
@Override
public void onFriendMessage(Carrier carrier, String from, String message) {
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### Stop Carrier

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
Carrier carrier = Carrier.getInstance();
carrier.kill();
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### TODO

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

## 7 建立 Session（高级Carrier编程，非必选）

1. Carrier 可以通过 session 建立 P2P 连接。
2. 首先需要初始化 Session 的 manager， manager 的回调在当有另一方发出连接请求时触发。可参照 CarrierDemo的 [CarrierSessionHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/session/CarrierSessionHelper.java) 的 initSessionManager() 函数实现。
    ```java
    public final class CarrierSessionHelper {
        ......
        public static void initSessionManager(ManagerHandler handler) {
            try {
                Manager manager = Manager.getInstance();
                if(manager != null) {
                    return;
                }

                Manager.initializeInstance(Carrier.getInstance(), handler);
                Logger.info("Session manager initialized.");
            } catch (Exception e) {
                Logger.error("Failed to init session manager.", e);
            }
        }
    }
    ```
3. session 状态可以通过 StreamHandler.onStateChanged() 回调获得，可以在 DefaultSessionHandler.java 重载此函数进行状态处理。





{{< pleasetranslate >}}

4. A创建 session，可参照 CarrierDemo的 [CarrierSessionHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/session/CarrierSessionHelper.java) 的 newSessionAndStream() 函数实现。
   * 初始化 SessionManager ，调用 Manager.getInstance(Carrier.getInstance(), sessionHandler) 实现初始化。
   * Manager.newSession() 函数创建一个 session。
   * 通过 Session.addStream 函数添加一个 Stream。
    ```java
    public final class CarrierSessionHelper {
        public static CarrierSessionInfo newSessionAndStream(String peer) {
            CarrierSessionInfo sessionInfo = null;

            try {
                sessionInfo = new CarrierSessionInfo();

                Logger.info("Carrier new session. peer:" + peer);
                Manager carrierSessionManager = Manager.getInstance();
                if (carrierSessionManager == null) {
                    Logger.error("Failed to new session, manager not initialized.");
                    return null;
                }
                sessionInfo.mSession = carrierSessionManager.newSession(peer);

                Logger.info("Carrier add a unreliable stream to session.");
                int dataOptions = 0;
                sessionInfo.mStream0 = sessionInfo.mSession.addStream(StreamType.Application, dataOptions, sessionInfo.mSessionHandler);

                Logger.info("Carrier add a reliable stream to session.");
                dataOptions = Stream.PROPERTY_RELIABLE;
                sessionInfo.mStream1 = sessionInfo.mSession.addStream(StreamType.Text, dataOptions, sessionInfo.mSessionHandler);
            } catch (Exception e) {
                Logger.error("Failed to new session or stream.", e);
            }

            return sessionInfo;
        }
    }
    ```
5. A创建 session 并初始化完成后，调用 Session.request() 函数后，B会收到 Manager 的 onSessionRequest() 回调，在回调中，同样调用 newSessionAndStream() 函数建立B端的 session。
6. B创建 session 并初始化完成后，调用 Session.replyRequest() ，A会收到 SessionRequestCompleteHandler.onCompletion() 回调。
7. 当B的 Stream 状态均变成 TransportReady 时，调用 Session.start()。
    ```java
    public class MainActivity extends Activity {
        ......
        private ManagerHandler mSessionManagerHandler = new ManagerHandler() {
            @Override
            public void onSessionRequest(Carrier carrier, String from, String sdp) {
                CarrierSessionInfo sessionInfo = CarrierSessionHelper.newSessionAndStream(CarrierHelper.getPeerUserId());
                if(sessionInfo == null) {
                    Logger.error("Failed to new session.");
                    return;
                }
                boolean wait = sessionInfo.mSessionState.waitForState(CarrierSessionInfo.SessionState.SESSION_STREAM_INITIALIZED, 10000);
                if(wait == false) {
                    deleteSession();
                    Logger.error("Failed to wait session initialize.");
                    return;
                }

                CarrierSessionHelper.replyRequest(sessionInfo);
                wait = sessionInfo.mSessionState.waitForState(CarrierSessionInfo.SessionState.SESSION_STREAM_TRANSPORTREADY, 10000);
                if(wait == false) {
                    deleteSession();
                    Logger.error("Failed to wait session initialize.");
                    return;
                }

                sessionInfo.mSdp = sdp;
                CarrierSessionHelper.startSession(sessionInfo);

                mCarrierSessionInfo = sessionInfo;
            }
        }
    }
    ```
8. A在等待 onCompletion() 后，调用 Session.start()。
    ```java
    public class CarrierSessionInfo {
        ......
        public CarrierSessionInfo() {
            ......
            mSessionListener = new DefaultSessionHandler.OnSessionListener() {
                ......
                @Override
                public void onCompletion(Session session, int state, String reason, String sdp) {
                    mSdp = sdp;
                    mSessionState.maskState(SessionState.SESSION_REQUEST_COMPLETED);
                }
            }
        }
    }

    public class MainActivity extends Activity {
        ......
        private void createSession() {
            ......
            CarrierSessionHelper.requestSession(sessionInfo);
            wait = sessionInfo.mSessionState.waitForState(CarrierSessionInfo.SessionState.SESSION_REQUEST_COMPLETED, 10000);
            if(wait == false) {
                deleteSession();
                Logger.error("Failed to wait session request.");
                return;
            }

            CarrierSessionHelper.startSession(sessionInfo);

            mCarrierSessionInfo = sessionInfo;
        }
    }
    ```
9. 当A、B的 Stream 状态均变成 Connected 时，说明 Session 连接创建成功。

## 8 通过 Session 发送数据（高级Carrier编程，非必选）

1. A、B双方的 Session 均处于 Connected 状态时，可以通过 Stream.writeData() 函数向对方发送数据，可参照 CarrierDemo的 [CarrierSessionHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/session/CarrierSessionHelper.java) 的 sendData()。
    ```java
    public final class CarrierSessionHelper {
        ......
        public static int sendData(Stream stream, byte[] data) {
            int sent = -1;
            try {
                sent = stream.writeData(data);
                Logger.info("Session send data to stream: " + stream
                        + "\ndata: " + new String(data)
                        + "\nsent: " + sent);
            } catch (Exception e) {
                Logger.error("Failed to send session data.", e);
            }

            return sent;
        }
    }
    ```
2. 当A发送数据给B后，B会收到 onStreamData() 回调，可以在 DefaultSessionHandler.java 重载此函数进行数据处理。
    ```java
    public class DefaultSessionHandler extends AbstractStreamHandler implements SessionRequestCompleteHandler {
        ......
        @Override
        public void onStreamData(Stream stream, byte[] data) {
            if(mOnSessionListener != null) {
                mOnSessionListener.onStreamData(stream, data);
            }
        }
    }
    ```
{{< /pleasetranslate>}}