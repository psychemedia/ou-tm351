#!/usr/bin/env bash
#Set the base build directory to the one containing this script
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Keep track of build datetime
$THISDIR/version.sh

#Build script for building machine
$THISDIR/base/basepackages.sh
#$THISDIR/base/basepy.sh


#Jupyter space
#$THISDIR/jupyter-base/build_jupyter.sh
#$THISDIR/jupyter-custom/jupyter_nbextensions.sh
#$THISDIR/jupyter-custom/jupyter_styling.sh

#Local extensions currently a bit broken...
#$THISDIR/jupyter-custom/jupyter_extensions.sh

#$THISDIR/pystack/build_tm351_stack.sh

$THISDIR/openrefine/openrefine.sh

#$THISDIR/postgres/postgresql.sh

#$THISDIR/mongo/mongo.sh
#$THISDIR/mongo/simple/mongo_simple.sh
#$THISDIR/mongo/sharded/mongo_cluster.sh

#tidy up
apt-get autoremove -y && apt-get clean && updatedb

