terraform {
  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

resource "google_project_service" "service_networking" {
  project = var.project_id
  service = "servicenetworking.googleapis.com"
}

resource "google_compute_global_address" "private_ip_alloc" {
  name          = "sql-private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc_network_self_link
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                  = var.vpc_network_self_link
  service                  = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]

  depends_on = [google_project_service.service_networking]
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.vpc_network_self_link
    }
  }

  deletion_protection = var.deletion_protection

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

# ✅ Poll for readiness using gcloud
resource "null_resource" "wait_for_sql_availability" {
  depends_on = [google_sql_database_instance.postgres_instance]

  provisioner "local-exec" {
    command = <<EOT
echo "Waiting for Cloud SQL instance to be RUNNABLE..."
for i in {1..60}; do
  STATUS=$(gcloud sql instances describe ${google_sql_database_instance.postgres_instance.name} --project=${var.project_id} --format='value(state)')
  echo "Attempt $i: status = $STATUS"
  if [ "$STATUS" = "RUNNABLE" ]; then
    echo "Cloud SQL instance is ready."
    sleep 10
    exit 0
  fi
  sleep 10
done
echo "ERROR: Cloud SQL instance did not become RUNNABLE in time"
exit 1
EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "google_sql_database" "default_db" {
  name     = var.database_name
  instance = google_sql_database_instance.postgres_instance.name

  depends_on = [null_resource.wait_for_sql_availability]
}

resource "google_sql_user" "default_user" {
  name     = var.database_user
  instance = google_sql_database_instance.postgres_instance.name
  password = var.password

  depends_on = [null_resource.wait_for_sql_availability]
}

