resource "aws_ssm_parameter" "db_user" {
  name  = "/ecommerce/db/username"
  type  = "String"
  value = "adminuser"
}

resource "aws_ssm_parameter" "db_pass" {
  name  = "/ecommerce/db/password"
  type  = "SecureString"
  value = "SuperSecret123!"
}
