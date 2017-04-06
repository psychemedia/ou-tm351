#!/usr/bin/env bash

#Build script for building machine
apt-get clean && apt-get -y update && apt-get -y upgrade && apt-get install -y bash-completion vim curl zip unzip bzip2 wget && apt-get install -y build-essential gcc && apt-get install -y g++ gfortran && apt-get install -y libatlas-base-dev libfreetype6-dev libpng-dev libhdf5-serial-dev

