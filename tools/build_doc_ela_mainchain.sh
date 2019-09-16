
dir=$(pwd)
mkdir -p ../static/references/ela_mainchain

# REST API
wget -O ela_rest_api_temp.md https://raw.githubusercontent.com/elastos/Elastos.ELA/master/docs/Restful_API.md
sed  -e '/\[CONTENT\]/r ela_rest_api_temp.md' -e "s///"  ../content/elastos_blockchain/reference/restapi/ela_mainchain.md.placeholder > temp.md
# Do some cleanup (remove the existing title)
sed  -e 's/# The RESTFUL API Of Elastos Node//' temp.md > ../content/elastos_blockchain/reference/restapi/ela_mainchain.md
rm ela_rest_api_temp.md
rm temp.md

# RPC API
wget -O ela_rpc_api_temp.md https://raw.githubusercontent.com/elastos/Elastos.ELA/master/docs/jsonrpc_apis.md
sed  -e '/\[CONTENT\]/r ela_rpc_api_temp.md' -e "s///"  ../content/elastos_blockchain/reference/rpc/ela_mainchain.md.placeholder > ../content/elastos_blockchain/reference/rpc/ela_mainchain.md
rm ela_rpc_api_temp.md