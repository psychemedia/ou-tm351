FROM psychemedia/ou-tm351-jupyter-custom

MAINTAINER tony.hirst@gmail.com

#Add the additional TM351 stack elements
ADD build_tm351_stack_16b.sh /tmp/build_tm351_stack.sh
RUN bash /tmp/build_tm351_stack.sh


# Clean up from build
RUN rm -f /tmp/build_tm351_stack.sh

RUN apt-get clean -y

