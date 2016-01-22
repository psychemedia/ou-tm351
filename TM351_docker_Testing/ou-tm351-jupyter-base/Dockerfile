FROM ubuntu:14.04

MAINTAINER tony.hirst@gmail.com

# Base machine
RUN apt-get clean && apt-get -y update && apt-get -y upgrade && \
    apt-get install -y bash-completion vim curl zip unzip bzip2 && \
    apt-get install -y build-essential gcc && \
    apt-get install -y g++ gfortran && \
    apt-get install -y libatlas-base-dev libfreetype6-dev libpng-dev libhdf5-serial-dev && \
    apt-get install -y git python3 python3-dev python3-pip && \
    pip3 install --upgrade pip

#Build the Jupyter server
ADD build_jupyter_16b.sh /tmp/build_jupyter.sh
RUN bash /tmp/build_jupyter.sh

# Clean up from build
RUN rm -f /tmp/build_jupyter.sh
RUN rm -f -r /tmp/jupyter

RUN apt-get clean -y

##The following fails for some reason?
#RUN sudo 

RUN mkdir /notebooks
VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD ["/notebook.sh"]
