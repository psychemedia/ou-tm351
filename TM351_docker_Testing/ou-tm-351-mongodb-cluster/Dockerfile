FROM mongo:3.0.7

# Simple mongo db seeding data
RUN mkdir -p /tmpdatafiles
#ADD will automatically uncompress a zipped file
ADD ./data/accidents-0912.tar.bz2 /tmpdatafiles/

CMD mongorestore --host mongodb --drop --db accidents /tmpdatafiles/dump-0912

