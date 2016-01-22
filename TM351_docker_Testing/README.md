ou-tm351-docker
===============

Scribble pad repo for sharing ideas around TM351 docker implementation...

__Not for use as part of the course__

Usage:

- I tend to go from the Kitematic command line;
- create the containers, eg `cd ou-tm351-jupyter-base; docker build -t psychemedia/ou-tm351-jupyter-base .`
- note there are some dependences, such as: `ou-tm351-jupyter-base` -> `ou-tm351-jupyter-custom` -> `ou-tm351-pystack`
- to fire up the built containers: `docker-compose up -d`