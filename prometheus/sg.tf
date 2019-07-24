resource "aws_security_group" "allow_prome_ssh" {
  name        = "allow-prome-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id
# This is required if in case we want to troubleshoot by any chance
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.x.0.0/16"]
  }
# This is required to access Prometheus URL from the local machine
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["10.x.0.0/16"]
  }
}

resource "aws_security_group" "allow_prome_outbound" {
  name        = "allow-prome-outbound"
  description = "Allow all outbound traffic"
  vpc_id      = var.vpc_id
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}