#!/bin/bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#DEBUG TOOLS
#systemctl list-units | grep refine
#journalctl -u refine.service


apt-get -y update && apt-get install -y wget ant unzip openjdk-8-jre-headless &&	apt-get clean -y


echo "Setting up OpenRefine: "

#Prep for download
mkdir -p /opt
mkdir -p /root

if [ ! -f /opt/openrefine.done ]; then
	echo "Downloading OpenRefine..."
	if [ ! -f $THISDIR/root/openrefine-linux-2.7-rc.2.tar.gz ]; then
		/usr/bin/wget -q --no-check-certificate  -P /root https://github.com/OpenRefine/OpenRefine/releases/download/2.7-rc.2/openrefine-linux-2.7-rc.2.tar.gz
	else
		cp $THISDIR/root/openrefine-linux-2.7-rc.2.tar.gz /root/openrefine-linux-2.7-rc.2.tar.gz
	fi
	echo "...downloaded OpenRefine"
	
	echo "Unpacking OpenRefine..."
	tar -xzf /root/openrefine-linux-2.7-rc.2.tar.gz -C /opt  && rm /root/openrefine-linux-2.7-rc.2.tar.gz
	#Unpacks to: /opt/openrefine-2.7-rc.2
	touch /opt/openrefine.done
	echo "...unpacked OpenRefine"
else
	echo "...already downloaded and unpacked OpenRefine"
fi


#If not the Docker build, set up the services
if [[ -z "${DOCKERBUILD}" ]]; then

	if [[ -z "${AUTHBUILD}" ]]; then
		cp $THISDIR/services/refine.service /lib/systemd/system/refine.service
	else
		cp $THISDIR/services/refine_auth.service /lib/systemd/system/refine.service
	fi
	
	# Enable autostart
	systemctl enable refine.service

	# Refresh service config
	systemctl daemon-reload

	#(Re)start service
	systemctl restart refine.service
fi
