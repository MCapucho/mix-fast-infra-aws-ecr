resource "aws_ecr_repository" "mixfast_ecr_repository" {
  name = var.name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}

resource "aws_ecr_repository" "mixfastpagamento_ecr_repository" {
  name = "${var.name}pagamento"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}

resource "aws_ecr_repository" "mixfastproducao_ecr_repository" {
  name = "${var.name}producao"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}
