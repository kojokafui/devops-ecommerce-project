data "aws_ssm_parameter" "db_user" {
  name = var.db_username_ssm
}

data "aws_ssm_parameter" "db_pass" {
  name = var.db_password_ssm
  with_decryption = true
}

resource "aws_db_subnet_group" "this" {
  name = "ecommerce-db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "this" {
  identifier           = "ecommerce-db"
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = data.aws_ssm_parameter.db_user.value
  password             = data.aws_ssm_parameter.db_pass.value
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot  = true
  publicly_accessible  = false
}
