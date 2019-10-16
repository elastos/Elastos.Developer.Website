+++
title = "Sessions and streams"
date = 2019-07-09T21:15:40+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++

{{< todo "@BPI @TangZhiLong Find the equivalent codes for swift and trinity" >}}

## Introduction

Besides adding friends and sending simple messages, carrier also provides a mechanism of *session* to help transferring large files, of stream raw data. 

Please note that transferring files can be implemented in an easier way than what is described here. Using sessions and streams is the generic way, but for convenience, consider using the **FileTransfer** class for simple file transfers.

*Streams* described here are the lower level layer. They can be considered as the physical communication layer. You can also create **channels** in order to push different kind of information (ex: send 2 files simultaneously) inside the same stream.

### Peers handshake procedure

Here is how 2 peers can setup a data flow together:

- Peer 1 creates a new session locally.
- Peer 1 adds one or more streams to the session. For instance, for a video streaming, one session may have 3 streams: one for the video, one for the audio, and the last one to send remotre control commands.
- Peer 1 requests a session to carrier.
- Peer 2 receives the session request.
- Peer 2 can then create a new session locally.
- Peer 2 adds the streams it wants to open. This can be the same as peer 1 (video, audio, etc), or only part of it if it wants to receive only some of them.
- Peer 2 replies to peer 1's request.
- Both parties call startSession().
- Callbacks are called in handlers and peers can start to send or receive data.

### Prepare a manager handler

Session manager uses a handler class to receive new session requests:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
ManagerHandler mSessionManagerHandler = new ManagerHandler() {
    @Override
    public void onSessionRequest(Carrier carrier, String fromUserId, String sdp) {
        // A new session request is received from a friend peer.
        // ... Code to handle this request goes here. See below in this guide.
    }
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
declare let carrierPlugin: any;

let callbacks = {
    onSessionRequest: session_request_callback,
}

function session_request_callback(event) {
    // do something
}
    {{< /tab >}} 
{{< /tabs >}}

### Initialize the session manager

Session manager is initialized using the session manager handler created earlier. 

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
Manager.initializeInstance(Carrier.getInstance(), mSessionManagerHandler);
Manager manager = Manager.getInstance();
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
declare let carrierPlugin: any;
let carrierInst;
let sessionInst;

function carrierSuccess(ret) {
    carrierInst = ret;
}

function carrierError(ret) {
    // do something
}

function sessionSuccess(ret) {
    sessionInst = ret;
}

function sessionError(ret) {
    // do something
}

carrierPlugin.createObject(carrierSuccess, carrierError, null, callbacks);
carrierInst.newSession(sessionSuccess, sessionError, peerId);
    {{< /tab >}} 
{{< /tabs >}}

### Create a stream handler to receive stream callbacks

All callbacks related to a carrier session need a handler class implementation. It looks like this:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
AbstractStreamHandler streamHandler = new AbstractStreamHandler {
    @Override
    public void onStateChanged(Stream stream, StreamState streamState) {
        // Stream state changes arrive here
    }

    @Override
    public void onStreamData(Stream stream, byte[] data) {
        // Data received from a peer
    }

    @Override
    public void onChannelOpened(Stream stream, int channel) {
    }

    @Override
    public void onChannelClose(Stream stream, int channel, CloseReason reason) {
    }

    @Override
    public boolean onChannelData(Stream stream, int channel, byte[] data) {
        return false;
    }
}
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
let stream_callbacks = {
    onStateChanged: state_changed_callback,
    onStreamData: stream_data_callback,
    onChannelOpen: channel_open_callback,
    onChannelOpened: channel_opened_callback,
    onChannelClose: channel_close_callback,
    onChannelData: channel_data_callback,
    onChannelPending: channel_pending_callback,
    onChannelResume: channel_resume_callback,
}

function state_changed_callback(event) {
    // do something
}

function stream_data_callback(event) {
    // do something
}

function channel_open_callback(event) {
    // do something
}

function channel_opened_callback(event) {
    // do something
}

function channel_close_callback(event) {
    // do something
}

function channel_data_callback(event) {
    // do something
}

function channel_pending_callback(event) {
    // do something
}

function channel_resume_callback(event) {
    // do something
}
    {{< /tab >}} 
{{< /tabs >}}

### Create a session handler to receive session callbacks

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
SessionRequestCompleteHandler sessionHandler = new SessionRequestCompleteHandler {
    public void onCompletion(Session session, int state, String reason, String sdp) {
        // This is called when peer 1 gets session reply from peer 2
    }
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
function session_request_complete_callback(event) {
    // do something
}

function success(ret) {
    // do something
}

function error(ret) {
    // do something
}

sessionInst.request(success, error, session_request_complete_callback);
    {{< /tab >}} 
{{< /tabs >}}

### Peer 1: create a session and add streams

A new session is created locally. One or several streams are configured (added) in this session. 

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
// Use a peer address to create a new session
Session session = carrierSessionManager.newSession(peerAddr);

// Add a stream to the session. For example, a video session
Stream stream = session.addStream(StreamType.Application, 0, streamHandler);

// Optionally: create more streams and add them. Some stream can be reliable (similar to tcp - no data lost but uses more bandwidth - good for file transfer). By default, streams are unreliable (similar to udp - good for video streaming) a reliable session (for file transfer or data that can't be lost - similar to TCP) 
Stream mySecondStream = session.addStream(StreamType.Text, Stream.PROPERTY_RELIABLE, streamHandler);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
let sessionInst;
let stream;

function success(ret) {
    sessionInst = ret;
}

function error(ret) {
    // do something
}

function streamSuccess(ret) {
    stream = ret;
}

function streamError(ret) {
    // do something
}

carrierInst.newSession(success, error, peerId);
sessionInst.addStream(streamSuccess, streamError, TEXT, PLAIN, stream_callbacks);
    {{< /tab >}} 
{{< /tabs >}}

### Peer 1: request session creation

After session and streams are created, the whole information has to be sent to carrier to let the friend peer know about this initialization. 

But here comes a bit of complication: before sending the actual session request, you need to make sure that all the streams you have added have moved to state **Initialized**. Choose your preferred way to do so using any code synchzoniration mechanism.

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
// Request actual session creation to carrier
session.request(sessionHandler);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
sessionInst.request(success, error, session_request_complete_callback);
    {{< /tab >}} 
{{< /tabs >}}

### Peer 2: receive session request

Peer 2 will then be notified that a new session is being created by peer 1 inside its ManagerHandler, onSessionRequest(). At that time, peer 2 can do the same as peer 1 in order to create a local session and add streams into it.

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
Session session = carrierSessionManager.newSession(peerAddr);
Stream stream = session.addStream(StreamType.Application, 0, streamHandler);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
let sessionInst;
let stream;

function success(ret) {
    sessionInst = ret;
}

function error(ret) {
    // do something
}

function streamSuccess(ret) {
    stream = ret;
}

function streamError(ret) {
    // do something
}

carrierInst.newSession(success, error, peerId);
sessionInst.addStream(streamSuccess, streamError, TEXT, PLAIN, stream_callbacks);
    {{< /tab >}} 
{{< /tabs >}}

Again, we need to wait until all streams reach the **TransportReady** state here before sending the following response to peer 1:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
session.replyRequest(0, null); // Success
session.start(sdp); // sdp is provided in onSessionRequest()
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
function replySuccess(ret) {
    // do something
}

function replyError(ret) {
    // do something
}

function startSuccess(ret) {
    // do something
}

function startError(ret) {
    // do something
}

sessionInst.replyRequest(replySuccess, replyError, 0, "success");
sessionInst.start(startSuccess, startError, sdp);
    {{< /tab >}} 
{{< /tabs >}}

### Peer 1: start session

Peer 1 is currently waiting for peer 2, and will be notified in onCompletion() when peer 2 replied to the session request. 

before starting its session, peer 1 needs to wait for 2 conditions:
1. All of its streams must be in state **TransportReady** (this state is reached after calling session.request()).
1. onCompletion() should be received.

When those conditions are met, the following code can be called:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
session.start(sdp); // sdp is provided in onCompletion()
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
sessionInst.start(startSuccess, startError, sdp);
    {{< /tab >}} 
{{< /tabs >}}

### Send data

Now it's almost ready. Your stream handler will receive onStateChanged() with state **Connected**. At that time, you can start sending data with the following code:

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
int sentSize = stream.writeData(data);
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
function writeSuccess(ret) {
    // do something
}

function writeError(ret) {
    // do something
}

stream.write(writeSuccess, writeError, data);
or
stream.write(writeSuccess, writeError, channel, data);
    {{< /tab >}} 
{{< /tabs >}}

### Receive data

Peer 2 is now able to receive data from stream handler's onStreamData().
