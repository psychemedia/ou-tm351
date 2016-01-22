FROM mongo:3.0.7

# Simple mongo db seeding data
RUN mkdir -p /tmpdatafiles
#The ADD will automatically uncompress a zipped file
ADD ./data/small_accidents.tar.bz2 /tmpdatafiles/

CMD mongorestore --host mongodb --drop --db accidents /tmpdatafiles/small_accidents