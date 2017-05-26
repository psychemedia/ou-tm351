#!/usr/bin/env bash

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for PYTHONVER in 3 ; do
  PYTHON="python$PYTHONVER"
  #PIP="pip$PYTHONVER"
  PIP="pip"
  $PIP install --upgrade pip

  #The important thing in the following is to ensure the notebook style works
  #  with the extensions.
  #This means watching the notebook elements closely?
  #Allowing Jupyter machinery to upgrade should be okay?
  $PIP install ipython-genutils
  $PIP install jupyter-core
  $PIP install nbformat
  
  $PIP install ipython
  $PIP install jupyter-client
  $PIP install ipykernel

  $PIP install notebook
  
  $PIP install nbconvert
  
  $PIP install jupyter-console
  $PIP install jupyter
  
  $PIP install nbdime
  
done

mkdir -p /vagrant/notebooks

#Define a custom config dir
JUPYTERCONFIGDIR=$(/usr/local/bin/jupyter --config-dir)
mkdir -p $JUPYTERCONFIGDIR

cp $THISDIR/config/jupyter_notebook_config.py $JUPYTERCONFIGDIR/jupyter_notebook_config.py
	
#If not the Docker build, set up the services
if [[ -z "${DOCKERBUILD}" ]]; then

	if [[ -z "${AUTHBUILD}" ]]; then
		cp $THISDIR/services/jupyter.service /lib/systemd/system/jupyter.service
	else
		#Secure setup
		cp $THISDIR/services/jupyter_auth.service /lib/systemd/system/jupyter.service
		#Override the config
		cp $THISDIR/config/jupyter_notebook_config_auth.py $JUPYTERCONFIGDIR/jupyter_notebook_config.py
	fi
	
	# Enable autostart
	systemctl enable jupyter.service

	# Refresh service config
	systemctl daemon-reload

	#(Re)start service
	systemctl restart jupyter.service
fi