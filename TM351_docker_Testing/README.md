# ou-tm351-docker

Scribble pad repo for sharing ideas around TM351 docker implementation...

The containers are available on dockerhub, for example:

- [psychemedia/ou-tm351-pystack](https://hub.docker.com/r/psychemedia/ou-tm351-pystack/)
- [psychemedia/ou-tm351-openrefine](https://hub.docker.com/r/psychemedia/ou-tm351-openrefine/)

__Not for use as part of the course__

## Usage:

- I tend to go from the Kitematic command line;
- create the containers, eg `cd ou-tm351-jupyter-base; docker build -t psychemedia/ou-tm351-jupyter-base .`
- note there are some dependences, such as: `ou-tm351-jupyter-base` -> `ou-tm351-jupyter-custom` -> `ou-tm351-pystack`
- to fire up the built containers: `docker-compose up -d`

## docker-machine - Digital Ocean

Quick start for getting up and running on [Digital Ocean](https://www.digitalocean.com/?refcode=0dc8918c828f).

- download the `docker-compose.yml` file to the current directory (that's the only file you should need - the container images are prebuilt on dockerhub).

```
docker-machine ls
#kitematic usess: default

#Create a droplet on Digital Ocean
docker-machine create -d digitalocean --digitalocean-access-token YOUR_ACCESS_TOKEN --digitalocean-region lon1 --digitalocean-size 4gb ou-tm351-test 

#Check the IP address of the machine
docker-machine ip ou-tm351-test

#Display information about the machine
docker-machine env ou-tm351-test
#This returns necessary config details
#For example:
##export DOCKER_TLS_VERIFY="1"
##export DOCKER_HOST="tcp://IP_ADDRESS:2376"
##export DOCKER_CERT_PATH="/Users/YOUR-USER/.docker/machine/machines/ou-tm351-test"
##export DOCKER_MACHINE_NAME="ou-tm351-test"
# Run this command to configure your shell: 
# eval $(docker-machine env ou-tm351-test)

#Set the environment variables as recommended
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://IP_ADDRESS:2376"
export DOCKER_CERT_PATH="/Users/YOUR-USER/.docker/machine/machines/ou-tm351-test"

#Run command to set current docker-machine
eval "$(docker-machine env ou-tm351-test)"

#If the docker-compose.yml file is in .
docker-compose up -d
#This will launch the linked containers on Digital Ocean

#The notebooks should now be viewable at:
#http://IP_ADDRESS:35180

#OpenRefine should now be viewable at:
#http://IP_ADDRESS:35181

#To stop the machine
docker-machine stop ou-tm351-test
#To remove the Digital Ocean droplet (so you stop paying for it...
docker-machine rm ou-tm351-test

#Reset the current docker machine to the Kitematic machine
eval "$(docker-machine env default)"
```