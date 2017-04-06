#!/usr/bin/env bash


#Things like this should soon be possible (Q2 2017?) in Dockerfile:
#ARG IMAGESTUB=psychemedia/ou-tm351-test-
#FROM ${IMAGESTUB}minimal
#Then add s/thing like this to docker build:
## --build-arg IMAGESTUB=psychemedia/ou-tm351-17J- 
#Then use `args` with docker-compose


#This file will build the separate containers individually from the command line

#Bootstrap everything off a common root
IMAGESTUB=psychemedia/ou-tm351-


docker build --rm -t ${IMAGESTUB}minimal-test minimal/

docker build --rm -t ${IMAGESTUB}base-test base/

docker build --rm -t ${IMAGESTUB}jupyter-base-test jupyter-base/
docker build --rm -t ${IMAGESTUB}jupyter-custom-test jupyter-custom/
docker build --rm -t ${IMAGESTUB}jupyter-custom-pystack-test pystack/
docker build --rm -t ${IMAGESTUB}jupyter-custom-pystack-mongoshard-test mongo/sharded/

docker build --rm -t ${IMAGESTUB}openrefine-test openrefine/

docker build --rm -t ${IMAGESTUB}postgres-test postgres/

docker build --rm -t  ${IMAGESTUB}mongo-simple-test mongo/simple/