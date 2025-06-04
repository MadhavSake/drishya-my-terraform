output "address" {
  description = "The external static IP address"
  value       = google_compute_address.external_ip.address
}

output "self_link" {
  description = "The self-link of the reserved static IP"
  value       = google_compute_address.external_ip.self_link
}

