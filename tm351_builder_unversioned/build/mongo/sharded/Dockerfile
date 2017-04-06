#docker build --rm -t psychemedia/ou-tm351-jupyter-custom-pystack-mongoshard-test .
#This is a kludge and installs mongo into the same container as the notebooks
FROM psychemedia/ou-tm351-jupyter-custom-pystack-test

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list && apt-get update && apt-get install -y mongodb-org

ADD data /tmp/mongosharded/data
ADD etc /tmp/mongosharded/etc
ADD mongo_cluster.sh /tmp/mongosharded/mongo_cluster.sh
ADD createshards.js /tmp/mongosharded/createshards.js

ENV MONGO_LOG /tmp/mongolog
RUN mkdir -p /tmp/mongolog

WORKDIR /tmp/mongosharded

RUN ./mongo_cluster.sh

RUN rm -r /tmp/mongosharded