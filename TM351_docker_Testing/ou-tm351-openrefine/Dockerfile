FROM ubuntu:14.04

MAINTAINER tony.hirst@gmail.com

# Install Headless JRE after updating installed packages.
RUN apt-get clean -y && apt-get -y update && apt-get -y upgrade && \
 	apt-get install -y wget ant unzip openjdk-7-jre-headless && \
 	apt-get clean -y

##22/01/16 - mac/docker toolbox 1.9.1i
##Currently failing at "Setting up ca-certificates-java (20130815ubuntu1) ..."
##See: https://github.com/docker/docker/issues/18180

#Download OpenRefine
RUN wget --no-check-certificate https://github.com/OpenRefine/OpenRefine/releases/download/2.6-rc1/openrefine-linux-2.6-rc1.tar.gz 

#Unpack OpenRefine and tidy up
RUN tar -xzf openrefine-linux-2.6-rc1.tar.gz  && rm openrefine-linux-2.6-rc1.tar.gz

EXPOSE 3333
RUN mkdir /mnt/refine
CMD ["openrefine-2.6-rc1/refine", "-i", "0.0.0.0", "-d", "/mnt/refine"]
