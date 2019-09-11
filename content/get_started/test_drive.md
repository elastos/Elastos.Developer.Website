+++
title = "Test Drive"
date = 2019-09-10T21:15:33+02:00
weight = 20
chapter = false
pre = ""
alwaysopen = false
+++ 

## Connect to testnet
```bash
./develap blockchain run -e testnet -n mainchain,did,token,eth
```

## Interact with Elastos mainchain
- Get current block count
{{< tabs >}}
    {{< tab name="Bash" codelang="bash" >}} 
curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"method":"getblockcount"}' http://localhost:21336
    {{< /tab >}}
    {{< tab name="Go" codelang="go" >}} 
package main

import (
    "bytes"
    "fmt"
    "io/ioutil"
    "log"
    "net/http"
    "net/url"
    "os"
)

func main() {
    client := &http.Client{}
    reqDataStr := []byte(`{"method":"getblockcount"}`)
    req, err := http.NewRequest(http.MethodPost, fmt.Sprintf("http://%s:%d","localhost", 21336), bytes.NewBuffer(reqDataStr))
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    req.Header.Set("Accepts", "application/json")
    req.Header.Set("Content-Type", "application/json")
    res, err := client.Do(req)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    defer res.Body.Close()
    data, err := ioutil.ReadAll(res.Body)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    fmt.Println(string(data));
}
    {{< /tab >}}
    {{< tab name="Python" codelang="py" >}} 
from requests import Request, Session
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects
import json

url = "http://{0}:{1}".format("localhost", 21336)
headers = {
    'Accepts': 'application/json',
    'Content-Type': 'application/json'
}

session = Session()
session.headers.update(headers)

try:
    d = {"method":"getblockcount"}
    response = session.post(url, data=json.dumps(d)) 
    data = json.loads(response.text)
    print(data)
except (ConnectionError, Timeout, TooManyRedirects) as e:
    print(e)    
    {{< /tab >}}
    {{< tab name="Java" codelang="java" >}} 
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

## Interact with Elastos DID Sidechain
- Get registered ID transaction by ID and path parameters
{{< tabs >}}
    {{< tab name="Bash" codelang="bash" >}} 
curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"method":"getidentificationtxbyidandpath","params":{"id":"iWP7qKkTo5N2nMXiLBmbBhcg5Eh7HoHe7o","path":"Apps/7A66E373400ABD9DA7F5B59F940839A4A9227A2A4670219B8FA1642C6EFBF5C821F5AEC74AE0D9177BA72FCAAF8F514742C04B29A023E24196C06B45B22693D4/uuid"}}' http://localhost:21606
    {{< /tab >}}
    {{< tab name="Go" codelang="go" >}} 
package main

import (
    "bytes"
    "fmt"
    "io/ioutil"
    "log"
    "net/http"
    "net/url"
    "os"
)

func main() {
    client := &http.Client{}
    reqDataStr := []byte(`{"method":"getidentificationtxbyidandpath","params":{"id":"iWP7qKkTo5N2nMXiLBmbBhcg5Eh7HoHe7o","path":"Apps/7A66E373400ABD9DA7F5B59F940839A4A9227A2A4670219B8FA1642C6EFBF5C821F5AEC74AE0D9177BA72FCAAF8F514742C04B29A023E24196C06B45B22693D4/uuid"}}`)
    req, err := http.NewRequest(http.MethodPost, fmt.Sprintf("http://%s:%d","localhost", 21606), bytes.NewBuffer(reqDataStr))
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    req.Header.Set("Accepts", "application/json")
    req.Header.Set("Content-Type", "application/json")
    res, err := client.Do(req)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    defer res.Body.Close()
    data, err := ioutil.ReadAll(res.Body)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    fmt.Println(string(data));
}
    {{< /tab >}}
    {{< tab name="Python" codelang="py" >}} 
from requests import Request, Session
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects
import json

url = "http://{0}:{1}".format("localhost", 21606)
headers = {
    'Accepts': 'application/json',
    'Content-Type': 'application/json'
}

session = Session()
session.headers.update(headers)

try:
    d = {"method":"getidentificationtxbyidandpath","params":{"id":"iWP7qKkTo5N2nMXiLBmbBhcg5Eh7HoHe7o","path":"Apps/7A66E373400ABD9DA7F5B59F940839A4A9227A2A4670219B8FA1642C6EFBF5C821F5AEC74AE0D9177BA72FCAAF8F514742C04B29A023E24196C06B45B22693D4/uuid"}}
    response = session.post(url, data=json.dumps(d)) 
    data = json.loads(response.text)
    print(data)
except (ConnectionError, Timeout, TooManyRedirects) as e:
    print(e)    
    {{< /tab >}}
    {{< tab name="Java" codelang="java" >}} 
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

## Interact with Elastos Token Sidechain
- Get the asset list of this token chain
{{< tabs >}}
    {{< tab name="Bash" codelang="bash" >}} 
curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"method":"getassetlist"}' http://localhost:21616
    {{< /tab >}}
    {{< tab name="Go" codelang="go" >}} 
package main

import (
    "bytes"
    "fmt"
    "io/ioutil"
    "log"
    "net/http"
    "net/url"
    "os"
)

func main() {
    client := &http.Client{}
    reqDataStr := []byte(`{"method":"getassetlist"}`)
    req, err := http.NewRequest(http.MethodPost, fmt.Sprintf("http://%s:%d","localhost", 21616), bytes.NewBuffer(reqDataStr))
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    req.Header.Set("Accepts", "application/json")
    req.Header.Set("Content-Type", "application/json")
    res, err := client.Do(req)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    defer res.Body.Close()
    data, err := ioutil.ReadAll(res.Body)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    fmt.Println(string(data));
}
    {{< /tab >}}
    {{< tab name="Python" codelang="py" >}} 
from requests import Request, Session
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects
import json

url = "http://{0}:{1}".format("localhost", 21616)
headers = {
    'Accepts': 'application/json',
    'Content-Type': 'application/json'
}

session = Session()
session.headers.update(headers)

try:
    d = {"method":"getassetlist"}
    response = session.post(url, data=json.dumps(d)) 
    data = json.loads(response.text)
    print(data)
except (ConnectionError, Timeout, TooManyRedirects) as e:
    print(e)    
    {{< /tab >}}
    {{< tab name="Java" codelang="java" >}} 
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}

## Interact with Elastos ETH Sidechain
- Get the current price per gas in wei
{{< tabs >}}
    {{< tab name="Bash" codelang="bash" >}} 
curl -H 'Content-Type: application/json' -H 'Accept:application/json' --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}' http://localhost:21636
    {{< /tab >}}
    {{< tab name="Go" codelang="go" >}} 
package main

import (
    "bytes"
    "fmt"
    "io/ioutil"
    "log"
    "net/http"
    "net/url"
    "os"
)

func main() {
    client := &http.Client{}
    reqDataStr := []byte(`{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}`)
    req, err := http.NewRequest(http.MethodPost, fmt.Sprintf("http://%s:%d","localhost", 21636), bytes.NewBuffer(reqDataStr))
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    req.Header.Set("Accepts", "application/json")
    req.Header.Set("Content-Type", "application/json")
    res, err := client.Do(req)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    defer res.Body.Close()
    data, err := ioutil.ReadAll(res.Body)
    if err != nil {
      log.Print(err)
      os.Exit(1)
    }
    fmt.Println(string(data));
}
    {{< /tab >}}
    {{< tab name="Python" codelang="py" >}} 
from requests import Request, Session
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects
import json

url = "http://{0}:{1}".format("localhost", 21636)
headers = {
    'Accepts': 'application/json',
    'Content-Type': 'application/json'
}

session = Session()
session.headers.update(headers)

try:
    d = {"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}
    response = session.post(url, data=json.dumps(d)) 
    data = json.loads(response.text)
    print(data)
except (ConnectionError, Timeout, TooManyRedirects) as e:
    print(e)    
    {{< /tab >}}
    {{< tab name="Java" codelang="java" >}} 
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
    {{< /tab >}} 
{{< /tabs >}}