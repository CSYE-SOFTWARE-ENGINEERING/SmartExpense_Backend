packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "app_version" {
  type    = string
  default = "${env("GITHUB_SHA")}"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "smartexpense" {
  ami_name      = "smartexpense-backend-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"] # Canonical
  }
  ssh_username = "ubuntu"
  tags = {
    Name        = "SmartExpense Backend"
    Environment = "Production"
    Version     = "${var.app_version}"
  }
}

build {
  name    = "smartexpense-backend"
  sources = [
    "source.amazon-ebs.smartexpense"
  ]
  
  provisioner "shell" {
    inline = [
      "echo Installing dependencies...",
      "sudo apt-get update",
      "sudo apt-get install -y openjdk-21-jdk",
      "sudo apt-get install -y nginx"
    ]
  }
  
  provisioner "file" {
    source      = "target/*.jar"
    destination = "/home/ubuntu/app.jar"
  }
  
  provisioner "shell" {
    inline = [
      "echo 'Setting up systemd service'",
      "sudo tee /etc/systemd/system/smartexpense.service > /dev/null <<EOT",
      "[Unit]",
      "Description=SmartExpense Backend",
      "After=network.target",
      "",
      "[Service]",
      "Type=simple",
      "User=ubuntu",
      "WorkingDirectory=/home/ubuntu",
      "ExecStart=/usr/bin/java -jar /home/ubuntu/app.jar",
      "Restart=on-failure",
      "",
      "[Install]",
      "WantedBy=multi-user.target",
      "EOT",
      "sudo systemctl enable smartexpense.service",
      "sudo systemctl start smartexpense.service"
    ]
  }
}
