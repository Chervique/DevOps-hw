variable "aws-id" {
  description = "The username for the DB master user"
  type        = string
  sensitive   = true
}

variable "aws-key" {
  description = "The password for the DB master user"
  type        = string
  sensitive   = true
}