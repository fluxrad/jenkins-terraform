resource "aws_security_group" "jenkins_security_group" {
    name = "jenkins_security_group"
    description = "Jenkins Security Group"
    vpc_id = "${var.vpc_id}"

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_ebs_volume" "jenkins_ebs_volume" {
    availability_zone = "${var.availability_zone}"
    size = 100
    tags {
        Name = "jenkins_volume"
    }
}

resource "aws_instance" "jenkins" {
    # CoreOS 766.5.0
    ami = "ami-37bdc15d"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    vpc_security_group_ids = [ "${aws_security_group.jenkins_security_group.id}" ]

    subnet_id = "${var.subnet_id}"

    root_block_device = {
        volume_type = "gp2"
        volume_size = 10
        delete_on_termination = true
    }

    user_data = "${file("${path.module}/files/user_data.yaml")}"

    tags = {
      Name = "jenkins"
    }

    depends_on = [ "aws_ebs_volume.jenkins_ebs_volume" ]
}

resource "aws_volume_attachment" "jenkins_ebs" {
    device_name = "/dev/xvdf"
    volume_id = "${aws_ebs_volume.jenkins_ebs_volume.id}"
    instance_id = "${aws_instance.jenkins.id}"
}
