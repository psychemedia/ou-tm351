#!/usr/bin/env bash
#export DOCKER_ID_USER="psychemedia"
#docker login

## docker tag my_image $DOCKER_ID_USER/my_image
## docker push $DOCKER_ID_USER/my_image

docker push psychemedia/ou-tm351-postgres-test

docker push psychemedia/ou-tm351-openrefine-test

docker push psychemedia/ou-tm351-minimal-test
docker push psychemedia/ou-tm351-base-test
docker push psychemedia/ou-tm351-jupyter-custom-test
docker push psychemedia/ou-tm351-jupyter-custom-pystack-test

docker push psychemedia/ou-tm351-mongo-simple-test 
docker push psychemedia/ou-tm351-jupyter-custom-pystack-mongoshard-test