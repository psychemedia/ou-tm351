#docker build --rm -t psychemedia/ou-tm351-openrefine-test .

# Base machine
FROM psychemedia/ou-tm351-minimal-test

MAINTAINER tony.hirst@gmail.com

ENV DOCKERBUILD 1


#Build OpenRefine
ADD openrefine.sh /tmp/openrefine/openrefine.sh
ADD root /tmp/openrefine/root

RUN /tmp/openrefine/openrefine.sh
RUN rm -rf /tmp/openrefine

EXPOSE 3334

RUN mkdir -p /openrefine_projects

VOLUME /openrefine_projects

CMD /opt/openrefine-2.7-rc.2/refine -p 3334 -i 0.0.0.0 -d /openrefine_projects 

