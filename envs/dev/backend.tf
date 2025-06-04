terraform {
  backend "gcs" {
    bucket = "drishya-stage-state-bucket"
    prefix = "terraform/state/dev"
  }
}
