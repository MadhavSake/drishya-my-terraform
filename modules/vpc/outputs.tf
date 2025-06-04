output "vpc_id" {
  description = "VPC network ID"
  value       = google_compute_network.vpc_network.id
}

output "network_self_link" {
  description = "Self link of the VPC network"
  value       = google_compute_network.vpc_network.self_link
}

output "network_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.vpc_network.name
}

# Private subnet (GKE)
output "subnet_id" {
  description = "Subnetwork ID (private)"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_self_link" {
  description = "Self link of the private subnet"
  value       = google_compute_subnetwork.subnet.self_link
}

output "subnet_name" {
  description = "Name of the private subnet"
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_ip_cidr_range" {
  description = "IP CIDR range of the private subnet"
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}

# Public subnet
output "public_subnet_id" {
  description = "Subnetwork ID (public)"
  value       = google_compute_subnetwork.public_subnet.id
}

output "public_subnet_self_link" {
  description = "Self link of the public subnet"
  value       = google_compute_subnetwork.public_subnet.self_link
}

output "public_subnet_name" {
  description = "Name of the public subnet"
  value       = google_compute_subnetwork.public_subnet.name
}

output "pods_range_name" {
  description = "Name of the secondary range for GKE Pods"
  value       = var.pods_range_name
}

output "services_range_name" {
  description = "Name of the secondary range for GKE Services"
  value       = var.services_range_name
}

