resource "google_compute_address" "external_ip" {
  name         = var.name
  region       = var.region
  project      = var.project_id
  address_type = "EXTERNAL"
}

