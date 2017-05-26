#!/bin/bash -e

apt-get install -y pandoc && apt-get clean

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing bundler extensions..."

echo "...odszip install..."
#Install the ODSzip extension package
pip3 install --upgrade --force-reinstall ${THISDIR}/jupyter_custom_files/nbextensions/odszip

#Enable the ODSzip extension
jupyter bundlerextension enable --py odszip.download  --sys-prefix
echo "...odszip done"


echo "...wordexport install..."
#Install the wordexport (.docx exporter) extension package
pip3 install --upgrade --force-reinstall ${THISDIR}/jupyter_custom_files/nbextensions/wordexport

#Enable the wordexport extension
jupyter bundlerextension enable --py wordexport.wordexport  --sys-prefix
echo "...wordexport done"



echo "...done bundler extensions"

#restart the service
sudo systemctl restart jupyter.service