variable "elastic_api_key" {
  description = "API key for Elastic Cloud"
  type        = string
  sensitive   = true
}

variable "elasticsearch_password" {
  description = "Password for the elastic user"
  type        = string
  sensitive   = true
}
