resource "aws_launch_template" "web" {
  name_prefix   = "terraform-web"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name = "terraform-key"
  vpc_security_group_ids = [
    aws_security_group.my_sg.id
  ]
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }
  user_data = base64encode(file("user-data.sh"))
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