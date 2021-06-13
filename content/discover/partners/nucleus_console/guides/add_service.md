+++
title = "Add Service"
date = 2020-01-14
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++ 

## How do you add a new service to the Nucleus Console?
- Run Elastos Private Net for testing purposes
- Choose a category and create a new method on Elastos Smartweb Service(gRPC server)
- Implement the client method on different client libraries for Python, Golang, etc
- Develop a new service page on Nucleus Console
- Submit a pull request on appropriate github repositories


#### Run Elastos Private Net for testing purposes
1. Clone the repository

    ```
    git clone https://github.com/cyber-republic/elastos-privnet;
    cd elastos-privnet;
    git checkout v0.6;
    ```

2. Run the private net

    ```
    cd blockchain;
    mkdir /data/volumes;
    sudo tools/copy_freshdata_docker.sh
    docker-compose up --remove-orphans --build --force-recreate -d
    ```

#### Choose a category and create a new method on Elastos Smartweb Service(gRPC server)
1. Clone the repository
    ```
    git clone https://github.com/cyber-republic/elastos-smartweb-service;
    cd elastos-smartweb-service
    ```

2. Prerequisites
    - Install Python3
    - Install virtualenv using pip
    - Read README.md for more info on how to do this

3. Setup
    ```
    virtualenv -p `which python3` venv;
    source venv/bin/activate;
    pip install -r requirements.txt;
    export PYTHONPATH="$PYTHONPATH:$PWD/grpc_adenine/stubs/"
    ```

4. Choose the category of where the service belongs at grpc_adenine/definitions:
    - common.proto[Common Services such as GenerateAPIKey, GetAPIKey]
    - hive.proto[Services that utilize Elastos Hive in some way]
    - wallet.proto[Services that deal with wallets]
    - sidechain_eth.proto[Services that deal with ETH Sidechain]
    - ...
    
    NOTE: If your new service doesn't belong in any of the given categories, create a new category under grpc_adenine/definitions/new_category.proto

5. Fill the contents of your new_category.proto file. You can check out other files to see the format of the proto files

6. Go to your root directory and generate the stubs for the newly created proto definitions
    ```
    python3 -m grpc_tools.protoc --include_imports --include_source_info --proto_path=grpc_adenine/definitions --descriptor_set_out=api_descriptor.pb --python_out=grpc_adenine/stubs --grpc_python_out=grpc_adenine/stubs grpc_adenine/definitions/*.proto
    ```
    This will generate all the stubs which are located at grpc_adenine/stubs/

7. Implement your method at the appropriate file at grpc_adenine/implementations/. If you created a new category as part of the definitions, you must create a new file here as new_category.py. You can look at other implementation files to have a sense of how the methods are implemented. Your method may interact with one Elastos service or multiple or none. You can mix and match services available on mainchain nodes, sidechain nodes, or hive nodes to create a new unique service

8. Once everything is ready, start the gRPC server locally
    ```
    ./run.sh
    ```
    This will build the contents of Elastos Smartweb Service in a docker image and then run it inside a container 

#### Implement the client method on different client libraries for Python, Golang, etc
1. We're going to implement the method on a python client library so let's first clone the repository
    ```
    git clone https://github.com/cyber-republic/python-grpc-adenine;
    cd python-grpc-adenine
    ```

2. Prerequisites
    - Install Python3
    - Install virtualenv using pip
    - Read README.md for more info on how to do this

3. Setup
    ```
    virtualenv -p `which python3` venv;
    source venv/bin/activate;
    pip install -r requirements.txt;
    cp .env.example .env;
    ```

4. Copy the stubs files that was generated from Elastos Smartweb Service
    ```
    cp /path/to/stubs/* elastos_adenine/stubs/.
    ```

5. Modify the newly put stubs files ending in *_grpc.py by replacing "import" with "from . import"
    Before:
    ```
    import common_pb2 as common__pb2
    ```
    After:
    ```
    from . import common_pb2 as common__pb2
    ```
    This is done to resolve some PATH errors that you might encounter later on

6. Implement your new method on the client side in the appropriate file at elastos_adenine/. If this is a new category, just create a new file called new_category.py. Look at other implementation files to get a sense of how the file is structured and add your method here.

7. Add the test for this method in sample.py in the root directory

#### Develop a new service page on Nucleus Console
1. Clone the repository
    ```
    git clone https://github.com/cyber-republic/elastos-nucleus;
    cd elastos-nucleus
    ```

2. Prerequisites
    - Install Python3
    - Install virtualenv using pip
    - Read README.md for more info on how to do this

3. Setup
    ```
    virtualenv -p `which python3` venv;
    source venv/bin/activate;
    pip install -r requirements.txt;
    cp .env.example .env;
    ```

4. For testing purposes, you can just copy the client library directly from python-grpc-adenine/elastos_adenine to venv/lib/python3.6/site-packages/elastos_adenine

5. Add a new url for your new service under service/urls.py

6. Implement a new view for your new service under service/views.py. This is where you will be interacting with the client library from on elastos_adenine

7. Add some sample code for documentation purposes under service/sample_code/

8. Make any other changes you may need to do on other python files under service/ directory

9. Create a new template for your new service under templates/service/new_service.html. Look at other examples of how they're implemented

10. Go to root directory and run the website
    ```
    ./run.sh
    ```

11. Test everything is working properly 

#### Submit a pull request on appropriate github repositories
- Submit a new pull request on all the changes you made to Elastos Smartweb Service at [https://github.com/cyber-republic/elastos-smartweb-service/pulls](https://github.com/cyber-republic/elastos-smartweb-service/pulls)
- Submit a new pull request on all the changes you made to Python Client Library at [https://github.com/cyber-republic/python-grpc-adenine/pulls](https://github.com/cyber-republic/python-grpc-adenine/pulls)
- Submit a new pull request on all the changes you made to Nucleus Console at [https://github.com/cyber-republic/elastos-nucleus/pulls](https://github.com/cyber-republic/elastos-nucleus/pulls)