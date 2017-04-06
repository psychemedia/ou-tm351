#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t' 

#Remove any requirements for a password
#Simply run the notebook server
#jupyter notebook --no-browser --port 8888  --ip=* 
jupyter notebook --ip=0.0.0.0 --y --log-level=WARN --no-browser --notebook-dir=/notebooks
