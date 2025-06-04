output "router_name" {
  description = "Name of the Cloud Router"
  value       = google_compute_router.nat_router.name
}

output "nat_name" {
  description = "Name of the Cloud NAT configuration"
  value       = google_compute_router_nat.nat_config.name
}

output "region" {
  description = "Region of the NAT"
  value       = google_compute_router_nat.nat_config.region
}
