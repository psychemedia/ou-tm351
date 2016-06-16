#!/bin/bash

cp /vagrant/multi-server-config/mongo_path.sh /etc/profile.d/mongo_path.sh
#All this contains is: export PATH=/etc/mongodb/bin:$PATH


#if [ ! -f ~/mongo_installed ]
#then
	echo "Installing mongo: "
	#HOWTO: http://docs.mongodb.org/manual/tutorial/install-mongodb-on-linux/

	echo " - make dir"
	mkdir -p mongoinstall

	echo " - download distro"
	#Download 32 bit distro
	curl --silent -O https://fastdl.mongodb.org/linux/mongodb-linux-i686-3.0.7.tgz
	

	echo " - unpack"
	#unpack
	tar -zxvf mongodb-linux-i686-3.0.7.tgz -C mongoinstall
	#And then tidy up
	rm -f mongodb-linux-i686-3.0.7.tgz
	
	echo " - make base dir"
	mkdir -p /etc/mongodb
	
	echo " - make standard /data/db dir just in case"
	mkdir -p /data/db
	chmod -R a+rwx /data/db
	
	echo " - copy files"
	cp -r -n mongoinstall/mongodb-linux-i686-3.0.7/. /etc/mongodb
	cp -r -n /vagrant/multi-server-config/etc/mongod.conf /etc/mongod.conf
	cp -r -n /vagrant/multi-server-config/etc/init/mongod.conf /etc/init/mongod.conf
	cp -r -n /vagrant/multi-server-config/etc/init.d/mongod /etc/init.d/mongod
	chmod 755 /etc/init.d/mongod
	
	echo -n " - export path"
	#Will this path actually be exported?
	#export PATH=/etc/mongodb/bin:$PATH

	
	#tidy up install files
	echo " - tidy up"
	rm -r mongoinstall
	echo -n " done install"
	
#  touch ~/mongo_installed
#fi

#setup and seed the multi-server config
#if [ ! -f ~/mongodb_seeded ]
#then
	echo -n "Grab mongo multiconfig data"
	##Copy across and unpack the data files into the VM
	echo "Unpack some data..."
	mkdir -p /tmpdatafiles
	cp /vagrant/multi-server-config/accidents-0912.tar.bz2 /root/accidents-0912.tar.bz2
	tar xvjf /root/accidents-0912.tar.bz2 -C /tmpdatafiles

	##Run the configuration files to create folders as required
	##Fire up shards and initialise database
	echo "Run multi_config script..."
	sudo /usr/local/bin/ipython /vagrant/multi-server-config/multi_config.ipy
			
	##Tidy up
	rm -rf /tmpdatafiles
    echo "done multiconfig..."
#	touch ~/mongodb_seeded
