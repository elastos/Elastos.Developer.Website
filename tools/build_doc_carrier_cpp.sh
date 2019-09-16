# Requirements: docker (running)

cd ../../Elastos.NET.Carrier.Native.SDK/docker
docker build .
cmake -DENABLE_DOCS=ON ../..
make
