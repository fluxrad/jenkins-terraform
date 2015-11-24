output "jenkins_security_group_id" {
   value = "${aws_security_group.jenkins_security_group.id}"
}

output "jenkins_id" {
  value = "${aws_instance.jenkins.id}"
}

output "jenkins_dns" {
  value = "${aws_instance.jenkins.public_dns}"
}
