resource "aws_launch_template" "ec2" {
  name_prefix   = var.name
  image_id      = var.ami_id
  instance_type = var.instance_type
  ebs_optimized = false
  user_data     = base64encode(data.template_file.ec2.rendered)

  monitoring {
    enabled = false
  }

  network_interfaces {
    associate_public_ip_address = false
    # security_groups             = [var.vpc_default_sg]
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_type           = "gp2"
      volume_size           = var.volume_size
      delete_on_termination = true
    }
  }
}

resource "aws_autoscaling_group" "ec2" {
  name = var.name

  # availability_zones  = var.availability_zones
  # vpc_zone_identifier = var.subnet_ids
  max_size         = var.max_size
  min_size         = var.min_size
  desired_capacity = var.desired_capacity

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]

  launch_template {
    id      = aws_launch_template.ec2.id
    version = "$Latest"
  }

  # target_group_arns         = []
  target_group_arns         = []
  health_check_type         = "EC2"
  health_check_grace_period = 900
  default_cooldown          = 900
  termination_policies      = ["OldestLaunchConfiguration", "OldestInstance"]
  suspended_processes       = ["ReplaceUnhealthy"]
}
