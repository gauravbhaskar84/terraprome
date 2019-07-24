resource "aws_instance" "test-instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id

  security_groups = [
    "${aws_security_group.allow_prome_ssh.id}",
    "${aws_security_group.allow_prome_outbound.id}"
  ]

provisioner "file" {
  source="./files/script.sh"
  destination="/tmp/script.sh"
}

provisioner "file" {
  source="./config/prometheus.yml"
  destination="/tmp/prometheus.yml"
}

provisioner "file" {
  source="./systemd/prometheus.service"
  destination="/tmp/prometheus.service"
}

provisioner "remote-exec" {
  inline=[
     "chmod +x /tmp/script.sh",
     "sudo /tmp/script.sh"
  ]
}

connection {
    type = "ssh"
    timeout = "1m"
    agent = false
    host = aws_instance.test-instance.private_ip
    user = var.instance_username
    private_key = file("${var.private_key_path}")
  }

tags = {
  Name = "Prometheus",
  Team = "DevOps",
  OS = "Linux"
  }
}