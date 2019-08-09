# Requirements: none

dir=$(pwd)
mkdir -p ../static/references/hive_java
cd ../../Elastos.NET.Hive.Java.SDK
./gradlew createjavadoc
cp -r doc/* $dir/../static/references/hive_java/
cd $dir