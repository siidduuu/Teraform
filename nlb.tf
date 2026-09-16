resource "aws_lb" "network_lb" {
  name               = "assignment-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  tags = { Environment = "assignment" }
}
