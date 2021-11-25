variable "awsid" {
  description = "The username for the DB master user"
  type        = string
  sensitive   = true
}

variable "awskey" {
  description = "The password for the DB master user"
  type        = string
  sensitive   = true
}