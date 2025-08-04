variable "aws_region" {
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "db_username_ssm" {
  description = "SSM parameter for DB username"
}

variable "db_password_ssm" {
  description = "SSM parameter for DB password"
}
