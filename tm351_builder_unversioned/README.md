Install a recent version of vagrant and Virtualbox

Speed up repeated builds
`vagrant plugin install vagrant-cachier`

Use correct Guest Additions
`vagrant plugin install vagrant-vbguest`


## Build with vagrant:

`vagrant up`

Jupyter notebook: port *35100*
OpenRefine: port *35101*

For web host provisioning:

- `vagrant up --provider=digital ocean: export DIGITAL_OCEAN_TOKEN="YOUR TOKEN HERE"`
- `vagrant up --provider=linode: export LINODE_API_KEY="YOUR KEY HERE"`


Web host provisioning set a password for authenticated access to service.

Set the environment variable from the command line:

 - password for authenticated services (default is: *tm351*): `export TMP_PASS="123"`

There is an example of this running in the current build... (see port *35188* for welcome page and ports *35180*/*35181* for authenticated access (user: __tm351__, (default) password: __tm351__).

## Run with docker:
`docker-compose up` (docker needs to be running!)


## Build AWS AMI:

Need to set up a security group to accept traffic on service ports cia (AWS Security Credentials console)[https://console.aws.amazon.com/iam/home?nc2=h_m_sc#/security_credential].

`zip -r quickbuild.zip quickbuild -x *.vagrant* -x *.DS_Store -x *.git* -x *.ipynb_checkpoints* -x *.scraps* *.pem*`

`mkdir -p toupload && zip -r toupload/quickbuild.zip quickbuild -x *.vagrant* -x *.DS_Store -x *.git* -x *.ipynb_checkpoints* -x *.pem*`
 
Pack the machine:
`packer build -var 'aws_access_key=YOUR_KEY' -var 'aws_secret_key=YOUR_SECRET' awspacker.json`

Also need to take care bringing the machine down. See running (metered) items via [console](https://eu-west-1.console.aws.amazon.com). *Remove the AMI by first deregistering it on the AWS AMI management page. Next, delete the associated snapshot on the AWS snapshot management page.*

## Associated blog posts

[Course Apps in the the Cloud – Experimenting With Open Refine on Digital Ocean, Linode and AWS / Amazon EC2 Web Services](https://blog.ouseful.info/2017/03/30/course-apps-in-the-the-cloud-experimenting-with-open-refine-on-digital-ocean-linode-and-aws-amazon-ec2-web-services/)

[Simple Authenticated Access to VM Services Using NGINX and Vagrant Port Forwarding](https://blog.ouseful.info/2017/04/03/simple-authenticated-access-to-vm-services-using-nginx-and-vagrant-port-forwarding/)

[Getting Web Services Up and Running on Amazon Web Services (AWS) Using Vagrant and the AWS CLI](https://blog.ouseful.info/2017/04/06/getting-web-services-up-and-running-on-amazon-web-services-aws-using-vagrant-and-the-aws-cli/)

[Getting Web Services Up and Running on MicroSoft Azure Using Vagrant and the Azure CLI](https://blog.ouseful.info/2017/04/06/getting-web-services-up-and-running-on-microsoft-azure-using-vagrant-and-the-azure-cli/)

## TO DO

The mongo shard server uses fixed `sleep` time to wait for services to come up; really should monitor status of mongo (eg look in `tail` of log file for "listening" or similar is one trick I saw somewhere?) as the guard.


#----

zipper:
`zip -r tm351_builder_unversioned.zip tm351_builder_unversioned -x *.vagrant* -x *openrefine_proj* -x *.DS_Store -x *.git* -x *.ipynb_checkpoints* -x *.scraps* -x *quick* -x *logs/* -x *touploa* -x *.dbshell* -x *.pem*`


## Versioning

Linux packages: `dpkg -l` or `sudo apt-get install -y apt-show-versions && apt-show-versions`

Python packages: `pip3 freeze`

??But how can we easily use this info for a *build-to-versions* build?

Old `apt-get` packages probably not available in current package archive?

For python, maybe:

- build machine
- `pip3 freeze  > requirements_THISBUILD.txt` then use `pip3 install -r requirements_THISBUILD.txt` and disable or ignore other `pip3` install items (may need some work on build files? Maybe wrap them in a test of a `$REBUILD` environment variable?)

## Debug
`systemctl list-units | grep mongo`
`sudo lsof -iTCP -sTCP:LISTEN | grep mongo`
`journalctl -u mongodb.service`

## BUILDING

`vagrant up && vagrant reload` so updates are properly installed