output "vpc_id" {
  description = "The ID of the created VPC network"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "The ID of the created subnet"
  value       = module.vpc.subnet_id
}

output "subnet_self_link" {
  description = "The self link of the created subnet"
  value       = module.vpc.subnet_self_link
}

output "gke_cluster_name" {
  description = "Name of the GKE cluster"
  value       = module.gke_cluster.cluster_name
}

output "gke_cluster_endpoint" {
  description = "Endpoint of the GKE cluster"
  value       = module.gke_cluster.endpoint
}

output "gke_cluster_version" {
  description = "Master version of the GKE cluster"
  value       = module.gke_cluster.cluster_master_version
}

output "gke_default_node_pool_name" {
  description = "Name of the default node pool"
  value       = module.gke_cluster.default_node_pool_name
}

output "gke_default_node_pool_node_count" {
  description = "Node count of the default node pool"
  value       = module.gke_cluster.default_node_pool_node_count
}

# Artifact Registry Docker repo output (renamed from GCR)
output "artifact_registry_repo_url" {
  description = "Docker Artifact Registry repo URL"
  value       = module.gcr.repo_url
}

output "public_subnet_self_link" {
  description = "The self link of the public subnet"
  value       = module.vpc.public_subnet_self_link
}

output "public_subnet_name" {
  description = "The name of the public subnet"
  value       = module.vpc.public_subnet_name
}

output "external_static_ip" {
  description = "Reserved external static IP address"
  value       = module.static_ip.address
}

