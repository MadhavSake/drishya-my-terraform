resource "google_compute_firewall" "allow-internal" {
  name    = "${var.name_prefix}-allow-internal"
  network = var.network
  project = var.project_id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["10.0.0.0/8"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.name_prefix}-allow-ssh"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.ssh_source_ip]
}

resource "google_compute_firewall" "allow-http-https" {
  name    = "${var.name_prefix}-allow-web"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-gke" {
  name    = "${var.name_prefix}-allow-gke"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["10250", "30000-32767"]
  }

  source_ranges = ["10.0.0.0/8"]
}
