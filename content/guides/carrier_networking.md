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
    public void onFriendRequest(Carrier carrier, String userId, UserInfo info, String hello) {
        Logger.info("Carrier received friend request. Peer UserId: " + userId);
        CarrierHelper.acceptFriend(userId, hello);
    }

    @Override
    public void onFriendAdded(Carrier carrier, FriendInfo info) {
        Logger.info("Carrier friend added. Peer UserId: " + info.getUserId());
    }

    @Override
    public void onFriendConnection(Carrier carrier, String friendId, ConnectionStatus status) {
        Logger.info("Carrier friend connect. peer UserId: " + friendId + " status:" + status);
        if(status == ConnectionStatus.Connected) {
            CarrierHelper.setPeerUserId(friendId);
        } else {
            CarrierHelper.setPeerUserId(null);
        }
    }

    @Override
    public void onFriendMessage(Carrier carrier, String from, byte[] message) {
        Logger.info("Carrier receiver message from UserId: " + from + "\nmessage: " + new String(message));
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



{{< pleasetranslate >}}

3. 新建 CarrierHelper.java，用于对外提供简单的 API。新建 startCarrier函数用于启动 Carrier。在这个函数中添加 DefaultCarrierHandler 和 DefaultCarrierHandler 的实例，最后调用 Carrier.start()。 实现可参照 CarrierDemo的[CarrierHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/CarrierHelper.java)。
    
4. 在 MainActivity.java 中调用 CarrierHelper.startCarrier()。
5. 在 DefaultCarrierHandler.java 中重载 onConnection() 函数，监听 Carrier 和 BootstrapNode 的连接状态（Online/Offline）。
6. 运行 CarrierDemo， Carrier 就启动起来了。

## 4 显示和扫描地址（可选）

为了快速添加好友，在 CarrierDemo 中添加了扫描二维码功能，这个功能与 Carrier 使用无关，可忽略。

1. 显示地址。添加 MyAddr 按钮，并实现点击显示二维码，具体实现可参照 CarrierDemo的 [MainActivity.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/MainActivity.java) 的 showAddress() 函数。
2. 扫描好友地址。添加 CAMERA， VIBRATE 等权限，添加 ScanAddr 按钮，并实现点击扫描二维码，具体实现可参照 CarrierDemo的 [MainActivity.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/MainActivity.java) 的  函数。

## 5 添加好友

1. 两个手机分别称为A和B。均安装有 CarrierDemo。
2. 在A、B双方都处于 Online 状态时，A获取到B的好友地址，并调用 addFriend() 函数添加好友B，该函数使用的是B的 Address。可参照 CarrierDemo的 [CarrierHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/CarrierHelper.java) 的 addFriend()。
    ```java
    public final class CarrierHelper {
        ......
        public static void addFriend(String peerAddr) {
            try {
                String userId = Carrier.getIdFromAddress(peerAddr);
                if(Carrier.getInstance().isFriend(userId)) {
                    Logger.info("Carrier ignore to add friend address: " + peerAddr);
                    return;
                }

                Carrier.getInstance().addFriend(peerAddr, CARRIER_HELLO_AUTH);
                Logger.info("Carrier add friend address: " + peerAddr);
            } catch (Exception e) {
                Logger.error("Failed to add friend.", e);
            }
            return;
        }
    }
    ```
3. 当A调用 addFriend() 后，被添加的一方会收到 onFriendRequest() 回调，在该回调中， Carrier 会将A的 Address 转换为 UserId，从此处开始， Carrier 将全部使用 UserId 进行身份辨识。可以在 DefaultCarrierHandler.java 重载此函数进行好友认证处理，可参照 CarrierDemo的 [CarrierHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/CarrierHelper.java) 的 acceptFriend()。
    ```java
    public final class CarrierHelper {
        ......
        public static void acceptFriend(String peerUserId, String hello) {
            try {
                if (hello.equals(CARRIER_HELLO_AUTH) == false) {
                    Logger.error("Ignore to accept friend, not expected.");
                    return;
                }

                Carrier.getInstance().AcceptFriend(peerUserId);
                Logger.info("Carrier accept friend UserId: " + peerUserId);
            } catch (Exception e) {
                Logger.error("Failed to add friend.", e);
            }
        }
    }
    ```
4. 通过B的认证后，A会收到 onFriendAdded() 回调，可以在 DefaultCarrierHandler.java 重载此函数进行后续处理。
5. 已经存在的好友不能重复添加，可以通过 getFriends() 函数获取好友列表。

## 6 发送消息

1. A、B双方 Online 后，对方均会收到 onFriendConnection() 回调，可以在 DefaultCarrierHandler.java 重载此函数进行后续处理。
    ```java
    public class DefaultCarrierHandler extends AbstractCarrierHandler {
        ......
        @Override
        public void onFriendConnection(Carrier carrier, String friendId, ConnectionStatus status) {
            Logger.info("Carrier friend connect. peer UserId: " + friendId + " status:" + status);
            if(status == ConnectionStatus.Connected) {
                CarrierHelper.setPeerUserId(friendId);
            }
        }
    }
    ```
2. 在A、B双方都处于 Online 状态时，可以通过 sendFriendMessage() 函数向对方发送消息，可参照 CarrierDemo的 [CarrierHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/CarrierHelper.java) 的 sendMessage()。
    ```java
    public final class CarrierHelper {
        ......
        public static void sendMessage(String message) {
            if(sPeerUserId == null) {
                Logger.error("Failed to send message, friend not found.");
                return;
            }

            try {
                Carrier.getInstance().sendFriendMessage(sPeerUserId, message);
                Logger.info("Carrier send message to UserId: " + sPeerUserId
                        + "\nmessage: " + message);
            } catch (Exception e) {
                Logger.error("Failed to send message.", e);
            }
        }
    }
    ```
3. 当A发送消息给B后，B会收到 onFriendMessage() 回调，可以在 DefaultCarrierHandler.java 重载此函数进行消息处理。
    ```java
    public class DefaultCarrierHandler extends AbstractCarrierHandler {
        ......
        @Override
        public void onFriendMessage(Carrier carrier, String from, String message) {
            Logger.info("Carrier receiver message from UserId: " + from
                    + "\nmessage: " + message);
        }
    }
    ```

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