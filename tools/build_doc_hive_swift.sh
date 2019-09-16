# Requirements: xcode, jazzy (run docs_setup.sh from Hive.Swift repo first)

dir=$(pwd)
mkdir -p ../static/references/hive_swift
cd ../../Elastos.NET.Hive.Swift.SDK
./docs.sh
cp -r docs/* $dir/../static/references/hive_swift/
cd $dir