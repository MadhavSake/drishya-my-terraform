# Enable Artifact Registry API
resource "google_project_service" "artifact_registry" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

# Create Docker Artifact Registry repository
resource "google_artifact_registry_repository" "docker_repo" {
  provider = google
  project  = var.project_id
  location = var.region

  repository_id = var.repo_name
  description   = "Docker repository in Artifact Registry"
  format        = "DOCKER"
}

