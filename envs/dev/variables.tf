variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for resources (e.g. asia-south1)"
  type        = string
}

# Use only one of these: region vs location
# We will use region everywhere, including Artifact Registry
# Remove this if not used explicitly elsewhere
# variable "location" {
#   description = "Location/region for resources"
#   type        = string
# }

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "pods_range" {
  description = "Secondary IP range name for pods"
  type        = string
}

variable "services_range" {
  description = "Secondary IP range name for services"
  type        = string
}

variable "machine_type" {
  description = "Machine type for GKE node pool"
  type        = string
}

variable "service_account_email" {
  description = "Service account email used by GKE nodes"
  type        = string
}

variable "enabled_apis" {
  description = "List of Google APIs to enable"
  type        = list(string)
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "routing_mode" {
  description = "VPC routing mode (REGIONAL or GLOBAL)"
  type        = string
  default     = "REGIONAL"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
}

variable "private_ip_google_access" {
  description = "Enable Private Google Access on subnet"
  type        = bool
  default     = true
}

variable "ssh_source_ip" {
  description = "CIDR IP allowed for SSH access"
  type        = string
}

variable "repo_name" {
  description = "Artifact Registry repo name"
  type        = string
}

variable "bucket_name" {
  description = "Cloud Storage bucket name"
  type        = string
}

variable "pods_range_name" {
  description = "Name of the secondary IP range for pods"
  type        = string
}

variable "pods_ip_range" {
  description = "CIDR block for pods IP range"
  type        = string
}

variable "services_range_name" {
  description = "Name of the secondary IP range for services"
  type        = string
}

variable "services_ip_range" {
  description = "CIDR block for services IP range"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
}

variable "static_ip_name" {
  description = "Name for the reserved static IP address"
  type        = string
  default     = "dev-external-ip"
}

