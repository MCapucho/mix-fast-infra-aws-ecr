variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = map(string)
  default     = {
    "name" : "mixfast"
    "company" : "fiap"
  }
}

variable "name" {
  type = string
  default = "mixfast"
}

variable "image_tag_mutability" {
  type = string
  default = "IMMUTABLE"
}