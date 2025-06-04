variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "routing_mode" {
  description = "Routing mode (REGIONAL or GLOBAL)"
  type        = string
  default     = "REGIONAL"
}

variable "subnet_name" {
  description = "Name of the private subnet (GKE nodes)"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the private subnet"
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

variable "region" {
  description = "Region for the subnets"
  type        = string
}

variable "private_ip_google_access" {
  description = "Enable private Google access for the private subnet"
  type        = bool
  default     = true
}

variable "pods_range_name" {
  description = "Name of the secondary range for GKE Pods"
  type        = string
}

variable "pods_ip_range" {
  description = "CIDR range for GKE Pods"
  type        = string
}

variable "services_range_name" {
  description = "Name of the secondary range for GKE Services"
  type        = string
}

variable "services_ip_range" {
  description = "CIDR range for GKE Services"
  type        = string
}

