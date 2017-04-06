echo "Setting up simple mongo..."

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f /opt/mongo_simple.done ]; then
	
	echo -n "Seed base mongodb"
	mkdir -p /tmpdatafiles
	cp $THISDIR/data/small_accidents.tar.bz2 /root/small_accidents.tar.bz2
	tar xvjf /root/small_accidents.tar.bz2 -C /tmpdatafiles
	mongorestore --drop --db accidents --port=27351 /tmpdatafiles/small_accidents
	rm -rf /tmpdatafiles/
	echo "...done base mongodb"
	
	touch /opt/mongo_simple.done
	
else
	echo "...already setup and seeded simple mongo"
fi