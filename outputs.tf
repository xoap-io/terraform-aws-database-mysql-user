output "username" {
  value       = mysql_user.this.user
  description = "Created name of the user"
}
output "password" {
  value       = random_password.this.result
  description = "Created password for the user"
}
output "database" {
  value       = module.label_name_db.id
  description = "Created name of the database"
}
output "host" {
  value       = var.host
  description = "Targeted host for creation"
}
