#!/bin/bash

#Install mongodb

echo "Installing mongo..."


if [ ! -f /opt/mongo_installed.done ]
then

	#HOWTO: http://docs.mongodb.org/manual/tutorial/install-mongodb-on-linux/
	echo " - get key"
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
	echo " - add repo"
	echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
	echo " - update package lists"
	apt-get update
		
	#Download and install 64 bit distro
	echo " - install package(s)"
	apt-get install -y mongodb-org

	echo -n "...done install"
	
  touch /opt/mongo_installed.done
else
	echo "...already installed"
fi 

echo " - update mongo conf files"
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $THISDIR/etc/mongodb.conf /etc/mongodb.conf
cp $THISDIR/services/mongodb.service /lib/systemd/system/mongodb.service

systemctl enable mongodb
systemctl daemon-reload
systemctl restart mongodb



#chown mongodb ${THISDIR}/sharded/mongo_cluster.sh
#chown :mongodb ${THISDIR}/sharded/mongo_cluster.sh

#Additionally bring in command line tools to help with data grab
apt-get install -y curl zip unzip bzip2 wget
