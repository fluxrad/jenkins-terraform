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

## Access

```
ssh core@<ip of the jenkins master> -L 8080:localhost:8080
```

Then fire up your browser and go to http://localhost:8080

## Teardown

To delete this stack.

```
# First taint the instance, so it gets torn down before the volume attachment
terraform taint -module=jenkins-master aws_instance.jenkins 
terraform destroy
```

## Todo

* Format the ext4 volume automatically. At present, when you first create the
  stack, you'll need to login and run `mkfs.ext4 /dev/xvdf` on the jenkins
  master.

* ELB for jenkins. Right now you have to SSH to the master and port forward
  port 8080
