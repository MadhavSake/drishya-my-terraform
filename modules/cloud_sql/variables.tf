variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "vpc_network_self_link" {
  description = "VPC self_link for private IP setup"
  type        = string
}

variable "instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "dev-postgres-instance"
}

variable "database_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "POSTGRES_14"
}

variable "tier" {
  description = "Machine type tier for Cloud SQL"
  type        = string
  default     = "db-f1-micro"
}

variable "ipv4_enabled" {
  description = "Enable public IP"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "database_name" {
  description = "Database name"
  type        = string
  default     = "app_db"
}

variable "database_user" {
  description = "Database user name"
  type        = string
  default     = "app_user"
}

variable "password" {
  description = "Password for database user"
  type        = string
  sensitive   = true
}
