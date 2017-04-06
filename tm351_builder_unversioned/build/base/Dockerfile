#docker build --rm -t psychemedia/ou-tm351-base-test .

FROM psychemedia/ou-tm351-minimal-test

MAINTAINER tony.hirst@gmail.com

ENV DOCKERBUILD 1

# Base machine
ADD basepackages.sh  /tmp/basepackages.sh
ADD basepy.sh  /tmp/basepy.sh

RUN /tmp/basepackages.sh
RUN /tmp/basepy.sh

# Clean up from build
RUN rm -f /tmp/base*.sh