provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name 
  associate_public_ip_address = true

  count = 3 # create three similar EC2 instances

  tags = {
    Name = "Server ${count.index}"
  }  

  user_data = file("user_data.sh") #Script to update ubuntu

  vpc_security_group_ids = [
    aws_security_group.sg_default_ports.id,
  ]

}

resource "aws_security_group" "sg_default_ports" {
  name = "web-access-group"
  description = "Allow traffic on port 80 (HTTP), 443 (HTTP) and 22(SSH)"

  tags = {
    Name = "Security Group - Default Ports"
  }

  ingress { #Allow traffic on port 80 (HTTP)
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress { #Allow traffic on port 443 (HTTPS)
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress { #Allow traffic to port 22 (SSH)
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  egress { #Allow traffic to leave the AWS instance
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }  

}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.server.*.public_ip
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.server.*.public_dns
}