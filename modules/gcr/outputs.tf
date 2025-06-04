output "project_id" {
  description = "The GCP project ID where Artifact Registry is enabled"
  value       = var.project_id
}

output "repo_url" {
  description = "Artifact Registry Docker repository URL"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repo_name}"
}

