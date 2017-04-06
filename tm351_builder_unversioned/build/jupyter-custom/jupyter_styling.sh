#!/bin/bash -e

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

JUPYTERSRC=${THISDIR}/jupyter_custom_files

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
TM351NBCONFIGFILEPATH=$JUPYTERSRC/nbconfig
TM351TPLEXTENSIONSFILEPATH=$JUPYTERSRC/extensions
TM351TPLTEMPLATESFILEPATH=$JUPYTERSRC/templates


#Directories on the VM that need to exist
TPLEXTENSIONS=$JUPYTERDATADIR/extensions
TPLTEMPLATES=$JUPYTERDATADIR/templates #not sure about this
CUSTOMISATIONS=$JUPYTERCONFIGDIR/custom

echo "Ensuring required jupyter sub-directories available"
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


#nbconvert templating extensions
echo "Ensuring jupyter template extension files available"
cp -r $TM351TPLEXTENSIONSFILEPATH/* $TPLEXTENSIONS/
cp -r $TM351TPLTEMPLATESFILEPATH/* $TPLTEMPLATES/


#If not the Docker build, set up the services
if [[ -z "${DOCKERBUILD}" ]]; then
	systemctl restart jupyter.service
fi