+++
title = "Basics - Friends and Messaging"
date = 2019-07-09T21:15:40+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++

Elastos Carrier provides features such as direct messaging (text or binary) to a peer, group messaging, or file transfer. This guide will show several of carrier's main features.

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
{{< /tabs >}}

### Create a handler to receive status changes

A handler object will be provided to carrier, and several callbacks will be triggered there. From that handler you will be able to handle some of your app's logic.

{{< tabs >}}
    {{< tab name="Java" codelang="java" >}}
public class DefaultCarrierHandler extends AbstractCarrierHandler {
    @Override
    public void onConnection(Carrier carrier, ConnectionStatus status) {
        Logger.getGlobal().info("Carrier connection status: " + status);

        if(status == ConnectionStatus.Connected) {
            // Do something
        }
    }

    @Override
    public void onFriendRequest(Carrier carrier,
                                String userId,
                                UserInfo info,
                                String hello) {
        Logger.getGlobal().info("Carrier received friend request. Peer UserId: " + userId);
        carrier.acceptFriend(userId);
    }

    @Override
    public void onFriendAdded(Carrier carrier, FriendInfo info) {
        Logger.getGlobal().info("Carrier friend added. Peer UserId: " + info.getUserId());
    }

    @Override
    public void onFriendConnection(Carrier carrier,
                                   String friendId,
                                   ConnectionStatus status) {
        Logger.getGlobal().info("Carrier friend connect. peer UserId: " + friendId);
        Logger.getGlobal().info("Friend status:" + status);

        if(status == ConnectionStatus.Connected) {
            // Do something
        } else {
            // Do something
        }
    }

    @Override
    public void onFriendMessage(Carrier carrier, String from, byte[] message) {
        Logger.getGlobal().info("Message from userId: " + from);
        Logger.getGlobal().info("Message: " + new String(message));
    }
}
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
{{< /tabs >}}

### Create a peer address

As a peer on carrier network, you can retrieve your carrier unique address using the following code:

{{< tabs >}}
    {{< tab name="Java" codelang="java" >}}
String myPeerAddress = Carrier.getInstance().getAddress()
    {{< /tab >}}
{{< /tabs >}}

This address can send me send to a friend (usually, through a QR code or a link) so he can add it into his own app to request to connect as a friend.

### Add a friend

Carrier supports friends management. You can add a peer as a friend using its peer address. That address can be retrieved from your friend's application context. This can be provided by the application through a QR code, for instance.

Note that all operations such as adding a friend or sending a message currently require **both parties to be online**.

{{< tabs >}}
    {{< tab name="Java" codelang="java" >}}
Carrier.getInstance().addFriend(peerAddr, CARRIER_HELLO_AUTH);
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
    Logger.getGlobal().geterror("Ignore to accept friend, not expected.");
    return;
}
                                }
Carrier.getInstance().acceptFriend(userId);
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
{{< /tabs >}}

### Send a message to a friend

Sending a message to a friend is as easy as this. Please note that only friends can receive messages to prevent spam.

{{< tabs >}}
    {{< tab name="Java" codelang="java" >}}
Carrier.getInstance().sendFriendMessage(userId, message);
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
{{< /tabs >}}

### Stop Carrier

{{< tabs >}}
    {{< tab name="Java" codelang="java" >}}
Carrier carrier = Carrier.getInstance();
carrier.kill();
    {{< /tab >}}
{{< /tabs >}}

{{< hero >}}
    {{< heroitem link="/services/carrier/guides/carrier_sessions" rightArrow="true">}}
        <h5>Advanced - Sessions and Streams</h5>
    {{< /heroitem >}}
{{< /hero >}}

{{< spacer 2 >}}
