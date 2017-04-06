#docker build --rm -t psychemedia/ou-tm351-jupyter-base-test .

FROM psychemedia/ou-tm351-base-test

MAINTAINER tony.hirst@gmail.com

ENV DOCKERBUILD 1

# Base machine

#Build the Jupyter server
ADD build_jupyter.sh /tmp/jupyter/build_jupyter.sh
ADD config /tmp/jupyter/config

RUN /tmp/jupyter/build_jupyter.sh
RUN rm -rf /tmp/jupyter

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888


CMD /usr/local/bin/jupyter notebook --ip=0.0.0.0 --y --log-level=WARN --no-browser --notebook-dir=/notebooks
