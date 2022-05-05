module "label_name_db" {
  source     = "git::github.com/xoap-io/terraform-aws-misc-label?ref=v0.1.0"
  context    = var.context
  attributes = ["db", var.name]
}
module "label_name_user" {
  source     = "git::github.com/xoap-io/terraform-aws-misc-label?ref=v0.1.0"
  context    = var.context
  attributes = ["user", var.name]
}
resource "mysql_database" "this" {
  name = module.label_name_db.id
}
resource "random_password" "this" {
  length = 32
}
resource "mysql_user" "this" {
  user               = module.label_name_user.id
  plaintext_password = random_password.this.result
  host               = "%"
}
resource "mysql_grant" "this" {
  database = mysql_database.this.name
  user     = mysql_user.this.user
  host     = "%"
  privileges = [
    "SELECT", "INSERT", "UPDATE", "DELETE", "CREATE", "DROP", "REFERENCES", "INDEX", "ALTER", "CREATE TEMPORARY TABLES",
    "LOCK TABLES", "EXECUTE", "CREATE VIEW", "SHOW VIEW", "CREATE ROUTINE", "ALTER ROUTINE", "EVENT", "TRIGGER"
  ]
}
