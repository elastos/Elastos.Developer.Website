# Requirements: none

mkdir -p ../static/references/hive_java
cd ../../Elastos.NET.Hive.Java.SDK
./gradlew createjavadoc
cp -rf doc/* ../
