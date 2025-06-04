output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_master_version" {
  value = google_container_cluster.primary.master_version
}

output "default_node_pool_name" {
  value = google_container_node_pool.default.name
}

output "default_node_pool_node_count" {
  value = google_container_node_pool.default.initial_node_count
}

