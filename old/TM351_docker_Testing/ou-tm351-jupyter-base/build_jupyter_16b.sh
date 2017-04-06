#!/usr/bin/env bash
          
for PYTHONVER in 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

  $PIP install --upgrade pip

  #The important thing in the following is to ensure the notebook style works
  #  with the extensions.
  #This means watching the notebook elements closely?
  #Allowing Jupyter machinery to upgrade should be okay?
  $PIP install ipython-genutils==0.1.0
  $PIP install jupyter-core==4.0.6
  $PIP install nbformat==4.0.1
  
  $PIP install ipython==4.0.1
  $PIP install jupyter-client==4.1.1
  $PIP install ipykernel==4.2.1

  $PIP install notebook==4.0.6
  
  $PIP install nbconvert==4.1.0
  
  $PIP install jupyter-console==4.0.3
  $PIP install jupyter==1.0.0
  
done
