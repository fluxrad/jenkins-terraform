module "jenkins-master" {
  source = "./jenkins-master"
  vpc_id = "${var.vpc_id}"
  subnet_id = "${var.vpc_subnets.us-east-1b}"
  availability_zone = "us-east-1b"
  key_name = "${var.key_name}"
}
