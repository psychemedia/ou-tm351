#!/bin/bash -e

echo "Installing postgres..."

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#Install postgres packages
apt-get -y update && apt-get install -y  postgresql postgresql-client 

#Additionally bring in command line tools to help with data grab
apt-get install -y curl zip unzip bzip2 wget

#If not the Docker build, set up the services
if [[ -z "${DOCKERBUILD}" ]]; then
	if [ ! -f /opt/postgresql.done ]; then
		sudo su - postgres <<-EOF
			psql -f ${THISDIR}/config/config_tm351.sql
		EOF
	fi
fi

touch /opt/postgresql.done

echo "...postgres done"


