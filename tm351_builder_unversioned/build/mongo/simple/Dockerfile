#docker build --rm -t psychemedia/ou-tm351-mongo-simple-test .
FROM mongo:3.4.3


# Simple mongo db seeding data
RUN mkdir -p /tmpdatafiles
#The ADD will automatically uncompress a zipped file
ADD ./data/small_accidents.tar.bz2 /tmpdatafiles/

#http://stackoverflow.com/a/33601894/454773
RUN mkdir -p /data/db2 \
    && echo "dbpath = /data/db2" > /etc/mongodb.conf \
    && chown -R mongodb:mongodb /data/db2

RUN mongod --fork --logpath /var/log/mongodb.log --dbpath /data/db2 --smallfiles && mongorestore --drop --db accidents /tmpdatafiles/small_accidents && mongod --dbpath /data/db2 --shutdown  && chown -R mongodb /data/db2

VOLUME /data/db2

CMD ["mongod", "--config", "/etc/mongodb.conf", "--smallfiles"]