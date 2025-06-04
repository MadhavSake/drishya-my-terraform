resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
}

# Private subnet for GKE (with secondary IP ranges)
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = var.private_ip_google_access

  secondary_ip_range {
    range_name    = var.pods_range_name
    ip_cidr_range = var.pods_ip_range
  }

  secondary_ip_range {
    range_name    = var.services_range_name
    ip_cidr_range = var.services_ip_range
  }
}

# Public subnet (for bastion or other public services)
resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = false
}

