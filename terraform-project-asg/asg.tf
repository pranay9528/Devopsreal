resource "aws_launch_template" "web" {
  name_prefix   = "terraform-web"
  image_id      = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.my_sg.id
  ]
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }
  user_data = base64encode(<<-EOF
    #!/bin/bash
    export DEBAIN_FRONTEND=noninteractive
    apt-get update -y
    apt-get install -y nginx 
    systemctl enable nginx
    systemctl start nginx
    mkdir -p /var/www/html
    cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>KumarStack</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f4f7fb;
            text-align:center;
            padding-top:80px;
        }

        h1{
            color:#1f2937;
            font-size:48px;
        }

        p{
            color:#555;
            font-size:22px;
        }

        .card{
            width:700px;
            margin:auto;
            background:white;
            padding:40px;
            border-radius:15px;
            box-shadow:0 10px 30px rgba(0,0,0,.1);
        }

        .button{
            display:inline-block;
            margin-top:25px;
            padding:12px 25px;
            background:#2563eb;
            color:white;
            text-decoration:none;
            border-radius:8px;
        }
    </style>
</head>

<body>

<div class="card">
<h1>KumarStack</h1>

<p>AWS • Terraform • GitHub Actions • Docker • Kubernetes</p>

<p>This website is deployed automatically using Terraform and an Auto Scaling Group.</p>

<a class="button" href="#">Projects Coming Soon</a>

</div>

</body>
</html>
HTML
    EOF
  )
}
resource "aws_lb_target_group" "web_tg" {
  name     = "asg-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id
  health_check {
    path = "/"
    port = "80"
  }
}
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity = 2
  min_size         = 2
  max_size         = 4
  vpc_zone_identifier = [
    module.network.public_subnet_id,
    module.network.public_subnet_2_id
  ]
  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}