+++
title = "Data storage"
date = 2019-05-24T21:15:40+02:00
weight = 30
chapter = false
pre = ""
alwaysopen = false
+++

{{< todo "elastOS sample code" >}}
{{< todo "More information about global storage strategy: settings, local information, personal cloud..." >}}

## Hive storage

Hive is the Elastos storage engine. It provides a way for apps to store files on different support, the most central one being the decentralized IPFS storage. Hive can also use for example OneDrive to store files on a personal cloud whenever needed.

## Store a file on Hive (IPFS)

A few things to keep in mind:

* If you don't pass a user id (uid), a new one will be created and returned to you.
* Files you store on hive are relative to your own space (uid).

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
private void upload() {
    Client client;
    Drive drive;
    String[] rpcAddrs = {
            "52.83.119.110",
            "52.83.159.189",
            "3.16.202.140",
            "18.217.147.205",
            "18.219.53.133"
    };
    String uid = null;
    String storePath = this.getExternalCacheDir().getAbsolutePath();

    // 1. Create IPFSParameter
    IPFSParameter parameter = new IPFSParameter(new IPFSEntry(uid, rpcAddrs), storePath);
    try {
        // 2. Create Hive client instance
        client = Client.createInstance(parameter);
        // 3. Login
        client.login(null);
        // 4. Get default drive
        drive = client.getDefaultDrive().get();
        // 5. Create file in IPFS. for example: "/test.txt"
        File file = drive.createFile("/test.txt").get();
        // 6. Create your byte buffer
        ByteBuffer writeBuffer = file2ByteBuffer("/sdcard/test.txt");
        // 7. Write byte buffer
        file.write(writeBuffer).get();
        // 8. Commit
        file.commit().get();
    } catch (HiveException | ExecutionException | InterruptedException e) {
        e.printStackTrace();
    }
}

public static ByteBuffer file2ByteBuffer(String path) {
    FileInputStream fileInputStream = null;
    FileChannel inChannel = null;
    try {
        fileInputStream = new FileInputStream(path);
        inChannel = fileInputStream.getChannel();
        ByteBuffer buffer = ByteBuffer.allocate(fileInputStream.available());
        inChannel.read(buffer);
        buffer.flip();
        return buffer;
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (inChannel != null) {
                inChannel.close();
            }
            if (fileInputStream != null) {
                fileInputStream.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return null;
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
var hiveClient: HiveClientHandle?
var hiveParams: DriveParameter?
var fileHandle: HiveFileHandle?
let store: String = "\(NSHomeDirectory())/Library/Caches/ipfs"
let addrs = [
    "http://52.83.119.110:9095",
    "http://52.83.159.189:9095",
    "http://3.16.202.140:9095",
    "http://18.217.147.205:9095",
    "http://18.219.53.133:9095"]
let rpcAddrs: IPFSEntry = IPFSEntry(nil, addrs)

// 1. Create IPFSParameter
hiveParams = IPFSParameter(rpcAddrs,store)
// 2. Create client instance
HiveClientHandle.createInstance(hiveParams!)
// 3. Login
hiveClient = HiveClientHandle.sharedInstance(type: .hiveIPFS)
// 4. Get default drive
self.hiveClient?.defaultDriveHandle()
    .then{ drive -> HivePromise<HiveFileHandle> in
            // 5. Create file
        return drive.createFile(withPath: "/test_file")
    }.then{ file -> HivePromise<Int32> in
            fileHandle = file
            // 6. Write byte data
            return file.writeData(withData: testData)
    }.then{ length -> HivePromise<Int32> in
            // 7.Commit
        return fileHandle?.commitData()!
    }.done{ void in
    }.catch{ error in
    }
    {{< /tab >}} 
    {{< tab name="elastOS" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

## Download a file from Hive (IPFS)

{{< tabs >}} 
    {{< tab name="Java" codelang="java" >}} 
public void download() {
    Client client;
    Drive drive;
    String[] rpcAddrs = {
            "52.83.119.110",
            "52.83.159.189",
            "3.16.202.140",
            "18.217.147.205",
            "18.219.53.133"
    };
    String uid = null;
    String storePath = this.getExternalCacheDir().getAbsolutePath();

    // 1. Create IPFSParameter
    IPFSParameter parameter = new IPFSParameter(new IPFSEntry(uid, rpcAddrs), storePath);
    try {
        // 2. Create client instance
        client = Client.createInstance(parameter);
        // 3. Login
        client.login(null);
        // 4. Get default drive
        drive = client.getDefaultDrive().get();
        // 5. Get file in IPFS backend
        File file = drive.getFile("/test.txt").get();
        // 6. Get file info
        File.Info fileInfo = null;
        try {
            fileInfo = file.getInfo().get();
        } catch (ExecutionException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // 7.Read buffer and write to your local storage
        Length lenObj = new Length(0);
        long readLen = 0;
        while (lenObj.getLength() != -1) {
            ByteBuffer tmpBuf = ByteBuffer.allocate(100);
            lenObj = file.read(tmpBuf).get();
            int len = (int) lenObj.getLength();
            if (len != -1) {
                readLen += len;
                byte[] bytes = new byte[len];
                tmpBuf.flip();
                tmpBuf.get(bytes, 0, len);
                // Write the content to a file.
                byteBuffer2File("/sdcard/test.txt", tmpBuf, false);
            }
        }


    } catch (HiveException | ExecutionException | InterruptedException e) {
        e.printStackTrace();
    }

}

void byteBuffer2File(String path, ByteBuffer buffer, boolean isAppend) {
    FileChannel outputChannel = null;
    FileOutputStream outputStream = null;
    try {
        buffer.flip();
        java.io.File file = new java.io.File(path);
        if (!file.exists()) {
            file.createNewFile();
        }
        outputStream = new FileOutputStream(path, isAppend);
        outputChannel = outputStream.getChannel();
        outputChannel.write(buffer);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            outputChannel.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
var hiveClient: HiveClientHandle?
var hiveParams: DriveParameter?
var fileHandle: HiveFileHandle?
let store: String = "\(NSHomeDirectory())/Library/Caches/ipfs"
let addrs = [
    "http://52.83.119.110:9095",
    "http://52.83.159.189:9095",
    "http://3.16.202.140:9095",
    "http://18.217.147.205:9095",
    "http://18.219.53.133:9095"]
let rpcAddrs: IPFSEntry = IPFSEntry("uid-283744b9-57e7-4af7-b5b0-7957f80c6349", ad
drs)
// 1. Create IPFSParameter
hiveParams = IPFSParameter(rpcAddrs,store)
// 2. Create client instance
HiveClientHandle.createInstance(hiveParams!)
// 3. Login
hiveClient = HiveClientHandle.sharedInstance(type: .hiveIPFS)
// 4. Get default drive
self.hiveClient?.defaultDriveHandle()
    .then{ drive -> HivePromise<HiveFileHandle> in
    // 5. Get file in IPFS backend
        return drive.fileHandle(atPath: "/test_file")
    }.then{ file -> HivePromise<Data> in
    // 6. Read data with length
        return file.readData(file.lastInfo.getValue(HiveFileInfo.size))
    }.done{ content in
    }.catch{ error in
    }
    {{< /tab >}} 
    {{< tab name="elastOS" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

## Storage cost

Storage on Elastos IPFS is free for now during early technical stages. This may change in the future.