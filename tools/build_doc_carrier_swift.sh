# Requirements: xcode, jazzy (run docs_setup.sh from Hive.Swift repo first) + get lib/ from carrier native SDK (copy to NativeDistributions)

dir=$(pwd)
mkdir -p ../static/references/carrier_swift
cd ../../Elastos.NET.Carrier.Swift.SDK
./docs.sh
cp -r swift-docs/* $dir/../static/references/carrier_swift/
cd $dir