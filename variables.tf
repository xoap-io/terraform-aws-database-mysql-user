variable "name" {
  type        = string
  description = "Name of the vpc to create"
}
variable "host" {
  type        = string
  description = "mySQL server address"
}
variable "context" {
  type = object({
    organization = string
    environment  = string
    account      = string
    product      = string
    tags         = map(string)
  })
  description = "Default context for naming and tagging purpose"
}
