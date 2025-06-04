variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "network" {
  description = "VPC network name or self link"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for firewall rule names"
  type        = string
}

variable "ssh_source_ip" {
  description = "IP range allowed for SSH access"
  type        = string
}
