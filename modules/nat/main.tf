resource "google_compute_router" "nat_router" {
  name    = var.router_name
  network = var.vpc_network
  region  = var.region
}

resource "google_compute_router_nat" "nat_config" {
  name                                = var.nat_name
  router                              = google_compute_router.nat_router.name
  region                              = var.region
  nat_ip_allocate_option              = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  enable_endpoint_independent_mapping = true

  log_config {
    enable = true
    filter = "ALL"
  }

  # Optional: enable if using manual IP allocation
  # nat_ips = var.nat_ips
}
