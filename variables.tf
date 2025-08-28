variable "api_token" {
  type    = string
  ephemeral = true
  sensitive = true
} 

variable "password" {
  type = string
  ephemeral = true
  sensitive = true
}
