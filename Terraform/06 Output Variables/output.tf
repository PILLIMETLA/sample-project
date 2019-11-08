output "ip" {
  value = ["${aws_instance.ec2example.public_ip}"]
}