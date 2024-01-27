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

resource "aws_ecr_repository_policy" "this" {
  repository = aws_ecr_repository.mixfast_ecr_repository.name
  policy     = <<EOF
 {
   "Version": "2008-10-17",
   "Statement": [
     {
       "Sid": "policy ecr access repository",
       "Effect": "Allow",
       "Principal": "*",
       "Action": [
         "ecr:BatchCheckLayerAvailability",
         "ecr:BatchGetImage",
         "ecr:CompleteLayerUpload",
         "ecr:GetDownloadUrlForLayer",
         "ecr:GetLifecyclePolicy",
         "ecr:InitiateLayerUpload",
         "ecr:PutImage",
         "ecr:UploadLayerPart"
       ]
     }
   ]
 }
 EOF
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.mixfast_ecr_repository.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "last 10 docker images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
    }]
  })
}