+++
title = "Carrier networking"
date = 2019-07-09T21:15:40+02:00
weight = 40
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++

{{< ownership "TangZhiLong" >}}

{{< todo "Migrate from https://github.com/elastos/Hackathon.2019.Beijing (使用carrier进行通信) after July 19 (beijing hackathon) - see SJun" >}}

{{< todo "Make sure this hackathon content is what we want to explain to users" >}}

{{< todo "Fix pictures paths (import them to this doc project)" >}}

{{< todo "Make sure the guide works for all platforms (android, ios, etc)" >}}

{{< todo "Replace manual AAR import with gradle maven imports" >}}

{{< pleasetranslate >}}
# Carrier for Android 开发文档

## 0 Carrier介绍

Carrier是一个去中心通信库，类似区块链钱包，用户通过一个私钥创建一个Carrier地址，并使用这个私钥来创建一个Carrier实例（节点），这个私钥即代表一个用户。

任何两个Carrier用户想互相发送消息，必须先将对方的Carrier地址加为好友，然后才能互相发送消息，也就是说，Carrier的通信是基于好友的。

你不必拥有IP地址或者域名，通过一个Carrier地址即可找到彼此，加了好友以后就可以加密点对点通信，可以不依赖任何服务器通信。

所以，基于Carrier编程通常的流程是：
1. 初始化一个Carrier实例（节点）
2. 添加好友地址
3. 收发Message

## 1 环境准备

1. 两台API21以上的 Android 手机。
2. 安装有 AndroidStudio 的PC机。

## 2 建立工程

1. 在网址 <https://github.com/elastos/Elastos.NET.Carrier.Android.SDK/releases> 中下载 [org.elastos.carrier-release/debug.aar](https://github.com/elastos/Elastos.NET.Carrier.Android.SDK/releases/download/release-v5.3.1/org.elastos.carrier-release.aar)。

2. 在 AndroidStudio 中新建 android 工程如 CarrierDemo，minimum SDK 选择 API21 或以上。

3. 将 org.elastos.carrier-release.aar 文件拷贝到 CarrierDemo/app/libs/ 下。
    ![2.3](./images/get-started-for-android/2.3.png)
4. 修改 CarrierDemo/app/build.gradle，在其中添加对本地aar的依赖：
    ![2.4](./images/get-started-for-android/2.4.png)
5. 在 AndroidManifest.xml 中添加 internet 权限。
    ![2.5](./images/get-started-for-android/2.5.png)

    

## 3 启动 Carrier

1. 新建 DefaultCarrierOptions.java，并继承于 Carrier.Options。设置 BootstrapNodes，可参照 CarrierDemo的[DefaultCarrierOptions.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/DefaultCarrierOptions.java)。
2. 新建 DefaultCarrierHandler.java，并继承于 AbstractCarrierHandler。可参照 CarrierDemo的[DefaultCarrierHandler.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/DefaultCarrierHandler.java)。
3. 新建 CarrierHelper.java，用于对外提供简单的 API。新建 startCarrier函数用于启动 Carrier。在这个函数中添加 DefaultCarrierHandler 和 DefaultCarrierHandler 的实例，最后调用 Carrier.start()。 实现可参照 CarrierDemo的[CarrierHelper.java](https://github.com/mengxiaokun/CarrierDemo/blob/master/app/src/main/java/org/elastos/carrier/demo/CarrierHelper.java)。
    ```java
    public final class CarrierHelper {
        ......
        public static void startCarrier(Context context) {
            try {
                String dir = context.getFilesDir().getAbsolutePath();
                Carrier.Options options = new DefaultCarrierOptions(dir);
                CarrierHandler handler = new DefaultCarrierHandler();

                Carrier.getInstance(options, handler);
                Carrier carrier = Carrier.getInstance();

                carrier.start(1000);
                Logger.info("start carrier.");
            } catch (Exception e) {
                Logger.error("Failed to start carrier.", e);
            }
        }
    }
    ```
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