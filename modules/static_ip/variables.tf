variable "name" {
  description = "Name of the static IP address"
  type        = string
}

variable "region" {
  description = "Region in which to reserve the IP address"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

