output "firewall_rules" {
  description = "Names of created firewall rules"
  value = [
    google_compute_firewall.allow-internal.name,
    google_compute_firewall.allow-ssh.name,
    google_compute_firewall.allow-http-https.name,
    google_compute_firewall.allow-gke.name,
  ]
}
