+++
title = "Friends and messages"
date = 2019-07-09T21:15:40+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

{{< todo "@BPI @TangZhiLongFind the equivalent codes for swift and trinity" >}}

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

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
// Initial setup
Carrier.Options options = new DefaultCarrierOptions(context.getFilesDir().getAbsolutePath());
CarrierHandler handler = new DefaultCarrierHandler();

// Create or get an instance
Carrier.initializeInstance(options, handler);
Carrier carrier = Carrier.getInstance();

// Start the service
carrier.start(500); // Start carrier. Wait 500 milliseconds between each check of carrier status (polling)
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

### Create a peer address

As a peer on carrier network, TODO TODO

String myPeerAddress = Carrier.getInstance().getAddress()

### Add a friend

{{< todo "Explain if we can we request adding friend when peer is offline? So he can accept when he comes online?" >}}

Carrier supports friends management. You can add a peer as a friend using its peer address. That address can be retrieved from your friend's application context. This can be provided by the application through a QR code, for instance.

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
Carrier.getInstance().addFriend(peerAddr, CARRIER_HELLO_AUTH);
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
    @Override
    public void onFriendRequest(Carrier carrier, 
                                String userId, 
                                UserInfo info, 
                                String hello) {
if (hello.equals(YOUR_UNIQUE_KEY_FOR_YOUR_APP) == false) {
    Logger.error("Ignore to accept friend, not expected.");
    return;
}
                                }
Carrier.getInstance().acceptFriend(userId);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

When the request is accepted, both parties receive the information in onFriendAdded().

### Listen to friends activity

You can know when friends come online or offline listening to the onFriendConnection() callback:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
@Override
public void onFriendConnection(Carrier carrier, String userId, ConnectionStatus status) {
    if(status == ConnectionStatus.Connected) {
        // Do something
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
    
{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
Carrier.getInstance().sendFriendMessage(userId, message);
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
public void onFriendMessage(Carrier carrier, String userId, String message) {
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
