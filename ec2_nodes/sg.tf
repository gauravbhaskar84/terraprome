resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id
# SSH - Just in case if we plan to install node exporter manually or for troubleshooting
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.x.0.0/16"]
  }
# Considering we have our internal IPs in this Range, to access the metrics of our instances from our browser/machine
  ingress {
    from_port   = 7100
    to_port     = 7100
    protocol    = "tcp"
    cidr_blocks = ["10.x.0.0/16"]
  }
# Considering this is our Subnet CIDR where Prometheus Server is launched
  ingress {
    from_port   = 7100
    to_port     = 7100
    protocol    = "tcp"
    cidr_blocks = ["10.y.0.0/25"]
  }
}

resource "aws_security_group" "allow_outbound" {
  name        = "allow-all-outbound"
  description = "Allow all outbound traffic"
  vpc_id      = var.vpc_id
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
