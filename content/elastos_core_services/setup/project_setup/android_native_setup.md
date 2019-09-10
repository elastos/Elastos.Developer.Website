+++
title = "Android native app setup"
date = 2019-05-24T21:15:33+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = false
+++ 

## Gradle configuration

Add the following lines to your app's gradle, according to modules you actually need:

dependencies {
    implementation 'org.elastos:hive:0.5.0'
    implementation 'org.elastos:carrier:5.4.0'
}

{{< todo "Add eth, neo, did, etc" >}}
