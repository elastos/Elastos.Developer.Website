# Requirements: jsdoc (npm)

dir=$(pwd)
mkdir -p ../static/references/trinity_plugins
cd ../../Elastos.Trinity.ToolChains/doc
./gen_plugins_doc.sh
cp -r out/* $dir/../static/references/trinity_plugins/
cd $dir
