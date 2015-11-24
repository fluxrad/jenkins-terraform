jenkins-terraform
=================

A demonstration of how to bootstrap a Jenkins server on CoreOS using Terraform.

## Bootstrap

1. Edit `variables.tf` with your configuration.
1. `terraform get` 
1. `terraform apply`

## Temporary stuff you still have to when you first bootstrap the cluster.

You shouldn't need to do this if you're replacing an existing instance.

1. Log into the jenkins master 
  1. `sudo mkfs.ext4 /dev/xvdf`
  1. `sudo systemctl restart mnt-jenkins.mount`
  1. `sudo systemctl restart jenkins`

## Todo

* Format the ext4 volume automatically. At present, when you first create the
  stack, you'll need to login and run `mkfs.ext4 /dev/xvdf` on the jenkins
  master.

* ELB for jenkins. Right now you have to SSH to the master and port forward
  port 8080




