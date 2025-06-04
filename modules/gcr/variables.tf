variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for the Artifact Registry repository"
  type        = string
  default     = "us-central1"
}

variable "repo_name" {
  type        = string
  description = "Name of the Docker repository"
}

