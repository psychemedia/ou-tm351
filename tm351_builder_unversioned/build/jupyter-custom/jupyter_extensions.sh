#!/bin/bash -e

#location of the original config files
#THis is relative to calling script which is in ../monolithic_build.sh
JUPYTERSRC=./jupyter-custom/jupyter_custom_files

# EVERYTHING BELOW HERE SHOULD JUST WORK....


#------- PROFILE: tm351MT -------
#------- Jupyter does not have a notion of profiles -------

###

IPYTHONDIR=$(/usr/local/bin/ipython locate)

JUPYTERDATADIR=$(/usr/local/bin/jupyter --data-dir)
JUPYTERCONFIGDIR=$(/usr/local/bin/jupyter --config-dir)


echo "Ensuring default jupyter directories available"
#Ensure directories are available
mkdir -p $JUPYTERDATADIR
mkdir -p $JUPYTERCONFIGDIR


#These directories are where the original source files are located for the build
TM351CUSTOMFILEPATH=$JUPYTERSRC/custom
TM351NBEXTENSIONSFILEPATH=$JUPYTERSRC/nbextensions
TM351NBCONFIGFILEPATH=$JUPYTERSRC/nbconfig
TM351TPLEXTENSIONSFILEPATH=$JUPYTERSRC/extensions
TM351TPLTEMPLATESFILEPATH=$JUPYTERSRC/templates


#Directories on the VM that need to exist
NBEXTENSIONS=$JUPYTERDATADIR/nbextensions
TPLEXTENSIONS=$JUPYTERDATADIR/extensions
TPLTEMPLATES=$JUPYTERDATADIR/templates #not sure about this
CUSTOMISATIONS=$JUPYTERCONFIGDIR/custom

echo "Ensuring required jupyter sub-directories available"
mkdir -p $NBEXTENSIONS
mkdir -p $TPLEXTENSIONS
mkdir -p $TPLTEMPLATES
mkdir -p $CUSTOMISATIONS

#Startup files
echo "Ensuring jupyter startup files available"
STARTUP=$IPYTHONDIR/profile_default/startup
mkdir -p $STARTUP
cp $TM351CUSTOMFILEPATH/tm351_start.ipy $STARTUP/tm351_start.ipy

#Styling and branding extensions
echo "Ensuring jupyter customisation files available"
cp $TM351CUSTOMFILEPATH/* $JUPYTERCONFIGDIR/custom/

#Preloaded extensions config file
JUPYTERNBCUSTOMCONFIGDIR=$JUPYTERCONFIGDIR/nbconfig
mkdir -p $JUPYTERNBCUSTOMCONFIGDIR
cp $TM351NBCONFIGFILEPATH/* $JUPYTERNBCUSTOMCONFIGDIR/

#Extensions
echo "Ensuring jupyter extensions files available"
cp -r $TM351NBEXTENSIONSFILEPATH/* $NBEXTENSIONS/

#nbconvert templating extensions
echo "Ensuring jupyter template extension files available"
cp -r $TM351TPLEXTENSIONSFILEPATH/* $TPLEXTENSIONS/
cp -r $TM351TPLTEMPLATESFILEPATH/* $TPLTEMPLATES/

#---
jupyter nbextension enable odszip/main
jupyter nbextension enable commentateCodeCell/main
jupyter nbextension enable activityCodeCell/main
jupyter nbextension enable answer_button/main
#---

#restart the service
sudo systemctl restart jupyter.service