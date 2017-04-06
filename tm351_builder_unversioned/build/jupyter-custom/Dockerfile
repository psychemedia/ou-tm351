#docker build --rm -t psychemedia/ou-tm351-jupyter-custom-test .

FROM psychemedia/ou-tm351-jupyter-base-test

MAINTAINER tony.hirst@gmail.com

ENV DOCKERBUILD 1

# Base machine

#Build the Jupyter server
ADD jupyter_*.sh /tmp/jupyter/
ADD jupyter_custom_files /tmp/jupyter/jupyter_custom_files

RUN /tmp/jupyter/jupyter_nbextensions.sh
RUN /tmp/jupyter/jupyter_styling.sh

RUN rm -rf /tmp/jupyter
