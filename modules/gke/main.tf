resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range
    services_secondary_range_name = var.services_range
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28" # You can customize this block range if needed
  }

  deletion_protection = false
}

# 🔹 Default Node Pool
resource "google_container_node_pool" "default" {
  name       = "${var.cluster_name}-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  project    = var.project_id

  node_locations     = ["asia-south1-a"]
  initial_node_count = 0

  autoscaling {
    min_node_count = 0
    max_node_count = 3
  }

  node_config {
    machine_type    = var.machine_type
    disk_size_gb    = 20
    service_account = var.service_account_email
	
	# ✅ Disable public IP
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
    
    metadata = {
      disable-legacy-endpoints = "true"
      enable-metadata-server = "true"
    }

    labels = {
      env = "dev"
      type = "default"
    }

    taint {
      key    = "role"
      value  = "default"
      effect = "NO_SCHEDULE"
    }
  }
}

# 🔹 Backend Node Pool
resource "google_container_node_pool" "backendnp" {
  name       = "backendnp"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  project    = var.project_id

  node_locations     = ["asia-south1-a"]
  initial_node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type    = "e2-standard-4"
    disk_size_gb    = 20
    service_account = var.service_account_email

    # ✅ Disable public IP
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
    
    metadata = {
      disable-legacy-endpoints = "true"
      enable-metadata-server = "true"
    }

    labels = {
      env = "dev"
      type = "backend"
    }

    taint {
      key    = "role"
      value  = "backend"
      effect = "NO_SCHEDULE"
    }
  }
}

# 🔹 DB Node Pool
resource "google_container_node_pool" "dbnp" {
  name       = "dbnp"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  project    = var.project_id

  node_locations     = ["asia-south1-a"]
  initial_node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type    = "e2-highmem-8"
    disk_size_gb    = 20
    service_account = var.service_account_email
	
    # ✅ Disable public IP
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }

    metadata = {
      disable-legacy-endpoints = "true"
      enable-metadata-server = "true"
    }    

    labels = {
      env = "dev"
      type = "db"
    }

    taint {
      key    = "role"
      value  = "db"
      effect = "NO_SCHEDULE"
    }
  }
}

# 🔹 System Node Pool
resource "google_container_node_pool" "systempool" {
  name       = "systempool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  project    = var.project_id

  node_locations     = ["asia-south1-a"]
  initial_node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type    = "e2-medium"
    disk_size_gb    = 20
    service_account = var.service_account_email
	
	# ✅ Disable public IP
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }

    metadata = {
      disable-legacy-endpoints = "true"
      enable-metadata-server = "true"
    }

    labels = {
      env  = "dev"
      type = "system"
    }

    taint {
      key    = "role"
      value  = "system"
      effect = "NO_SCHEDULE"
    }
  }
}
