provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sap_vm" {
  ami           = "ami-0c55b159cbfafe1f0"  # Choose SAP-supported AMI (Amazon Linux 2 / RHEL)
  instance_type = "t3.xlarge"

  key_name      = "sap-key"  # Ensure this key pair exists in AWS
  security_groups = ["default"]

  tags = {
    Name = "SAP-VM"
  }
}

output "instance_ip" {
  value = aws_instance.sap_vm.public_ip
}
