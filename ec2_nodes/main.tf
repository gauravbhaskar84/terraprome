resource "aws_instance" "test-instance" {
  count           = var.instance_count
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id

  security_groups = [
    "${aws_security_group.allow_ssh.id}",
    "${aws_security_group.allow_outbound.id}"
  ]

tags = {
  Name = "Prometheus-Node-${count.index + 1}",
  Team = "DevOps",
  OS   = "Linux"
  }
}
