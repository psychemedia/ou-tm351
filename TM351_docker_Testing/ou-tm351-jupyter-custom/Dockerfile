FROM psychemedia/ou-tm351-jupyter-base

MAINTAINER tony.hirst@gmail.com

#Customise the notebooks
ADD jupyter_16b /tmp/jupyter
ADD jupyter_extensions_16b.sh /tmp/jupyter_extensions.sh
RUN bash /tmp/jupyter_extensions.sh


# Clean up from build
RUN rm -f /tmp/jupyter_extensions.sh
RUN rm -f -r /tmp/jupyter


