project_id              = "project-beacon-460705"
region                  = "asia-south1"
location                = "asia-south1"

cluster_name            = "drishya-gke-cluster-dev"
machine_type            = "e2-medium"
service_account_email   = "gke-service-account-dev@project-beacon-460705.iam.gserviceaccount.com"

vpc_name                = "drishya-vpc-dev"
routing_mode            = "REGIONAL"
subnet_name             = "dev-subnet"
subnet_cidr             = "10.10.0.0/24"
private_ip_google_access = true
ssh_source_ip           = "203.0.113.4/32"

# Removed: network and subnetwork
# network     = "drishya-vpc-dev"
# subnetwork  = "projects/project-beacon-460705/regions/asia-south1/subnetworks/dev-subnet"

pods_range              = "gke-pods-range"
services_range          = "gke-services-range"

enabled_apis = [
  "compute.googleapis.com",
  "container.googleapis.com",
  "sqladmin.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com"
]

repo_name               = "gke-docker-repo"
bucket_name             = "drishya-stage-state-bucket"

#db_password             = "ilovemyindian@1947"

pods_range_name         = "gke-pods-range"
pods_ip_range           = "10.20.0.0/16"
services_range_name     = "gke-services-range"
services_ip_range       = "10.21.0.0/20"

# ✅ New for public subnet
public_subnet_name      = "public-subnet"
public_subnet_cidr      = "10.10.1.0/24"

