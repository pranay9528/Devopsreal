resource "aws_instance" "this" {

    ami                       = var.ami_id
    instance_type             = var.instance_type
    key_name                  = var.key_name
    vpc_security_group_ids    = var.vpc_security_group_ids
    subnet_id                 = var.subnet_id
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                echo "Hello from terraform module lab" > /var/www/html/index.html
                EOF
    tags = {
        Name = var.instance_name
    }
}