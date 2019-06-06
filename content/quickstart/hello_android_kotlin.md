+++
title = "Hello Elastos Android Kotlin"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< fixme "This is just a layout test, content is wrong and must be written" >}}

### Create a project

Create a project in Android Studio xxxx.

### Import Elastos

Add the following line to your app's gradle file:

    implementation 'org.elastos.runtime:1.0.0'

### Add this to your main activity:

    import org.elastos.wallet.Elastos

    override fun onResume() {
        val elastos = Elastos()
        elastos.init()
        elastos.listWallet() {
            println("Hre are your wallet")
        }
    }