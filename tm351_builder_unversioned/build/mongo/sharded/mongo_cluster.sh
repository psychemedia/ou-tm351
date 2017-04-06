#!/bin/bash

#Crib: https://premaseem.wordpress.com/2016/02/14/mongodb-script-to-run-sharding-with-replica-set-on-local-machine/

#DEBUG TOOLS
#systemctl list-units | grep mongo
#sudo lsof -iTCP -sTCP:LISTEN | grep mongo
#journalctl -u mongodb.service

echo "Setting up mongo cluster..."

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

MONGOD_PORT=27017

cp $THISDIR/etc/mongo-shards-down /etc/mongo-shards-down
chmod a+x /etc/mongo-shards-down

cp $THISDIR/etc/mongo-shards-up /etc/mongo-shards-up
chmod a+x /etc/mongo-shards-up

#--------------

echo "killing mongod and mongos"
killall mongod
killall mongos

sleep 3
if [[ -z "${DOCKERBUILD}" ]]; then
	systemctl restart mongodb
fi

sleep 5

echo "removing data files"
#sudo rm -rf /data/config
#sudo rm -rf /data/shard*

rm -rf /data/config
rm -rf /data/shard*

#Create shard folders
mkdir -p /data/shard0/rs0
chmod -R a+rwx /data/shard0/rs0

mkdir -p /data/shard1/rs0
chmod -R a+rwx /data/shard1/rs0

mkdir -p /data/shard2/rs0
chmod -R a+rwx /data/shard2/rs0

#Create configsvr folder
mkdir -p /data/config/config-a
chmod -R a+rwx  /data/config/config-a

##

#Fire up the servers
/etc/mongo-shards-up

#add the shards
echo "Connecting to mongos and enabling sharding"
# add shards and enable sharding on the test db
mongo < ${THISDIR}/createshards.js


#--------- SEED THE DATABASE WITH SOME DATA

##Copy across and unpack the data files into the VM
echo "Copy some data across (if required)..."
if [ ! -f /root/accidents-0912.tar.bz2 ]; then
	cp $THISDIR/data/accidents-0912.tar.bz2 /root/accidents-0912.tar.bz2
fi
echo "...data copied"

echo "Unpack some data (if required)..."
if [ ! -f /tmpdatafiles/dump-0912 ]; then
	mkdir -p /tmpdatafiles
	tar xvjf /root/accidents-0912.tar.bz2 -C /tmpdatafiles
fi
echo "...unpacking done"

echo "Try a restore..."
mongorestore --port=$MONGOD_PORT /tmpdatafiles/dump-0912
echo "...restore done"

##Tidy up
rm -rf /tmpdatafiles

echo "...set up mongo cluster"

#fi

/etc/mongo-shards-down

touch /opt/mongo_cluster.done
