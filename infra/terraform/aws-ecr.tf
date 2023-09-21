resource "aws_ecr_repository" "mixfast_ecr_repository" {
  name = "${var.name}-ecr"

  tags = var.tags
}