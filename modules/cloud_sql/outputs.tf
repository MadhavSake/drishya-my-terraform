output "instance_name" {
  description = "Cloud SQL instance name"
  value       = google_sql_database_instance.postgres_instance.name
}

output "instance_connection_name" {
  description = "Instance connection name (used in connection strings)"
  value       = google_sql_database_instance.postgres_instance.connection_name
}

output "private_ip" {
  description = "Private IP address of the instance (if applicable)"
  value       = google_sql_database_instance.postgres_instance.private_ip_address
}

output "public_ip" {
  description = "Public IP address of the instance (if applicable)"
  value       = google_sql_database_instance.postgres_instance.public_ip_address
}


output "instance_self_link" {
  value = google_sql_database_instance.postgres_instance.self_link
}
