# Running the TM351 Constainers Using DockerCloud.

The various TM351 services have been defined in a set of Dockr containers that can be run together using *Docker Compose*.

To run the linked services:

- sign up to DockerCloud
- link a cloud host to your DockerCloud account (I use Digital Ocean)
- create a stack using this [test stack file](https://raw.githubusercontent.com/psychemedia/ou-tm351/master/tm351_builder_unversioned/docs/stacks/tm351_test_stack.yaml)
- launch a node (I tend to use a 2GB memory / 40GB storage machine)
- launch the stack on the node
- remember to turn the nodes off when you aren't using them; (not sure if/how data containers can be persisted, for free? Or deleted if they incur a storage charge?)

Note that the services are all unauthenticated, though may be possible to reuse elements of eg the cloud builds (eg AWS) to use nginx as authenticating proxy, set up Jupyter credentials, etc?

View the services at the dockercloud identified links using `http:` rather than `tcp:`.

TO DO:

- provide linked data volumes for the `notebook` and `openrefine` containers?
