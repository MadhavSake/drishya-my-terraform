provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable required APIs
module "project_services" {
  source       = "../../modules/project-services"
  enabled_apis = var.enabled_apis
}

# VPC and subnets
module "vpc" {
  source                   = "../../modules/vpc"
  vpc_name                 = var.vpc_name
  routing_mode             = var.routing_mode
  subnet_name              = var.subnet_name
  subnet_cidr              = var.subnet_cidr
  region                   = var.region
  private_ip_google_access = var.private_ip_google_access
  pods_range_name          = var.pods_range_name
  pods_ip_range            = var.pods_ip_range
  services_range_name      = var.services_range_name
  services_ip_range        = var.services_ip_range
  public_subnet_name       = var.public_subnet_name
  public_subnet_cidr       = var.public_subnet_cidr

  depends_on = [module.project_services]
}

# Firewall rules
module "firewall" {
  source        = "../../modules/firewall"
  project_id    = var.project_id
  network       = module.vpc.vpc_id
  name_prefix   = "dev"
  ssh_source_ip = var.ssh_source_ip

  depends_on = [module.project_services]
}

# GKE cluster
module "gke_cluster" {
  source                = "../../modules/gke"
  project_id            = var.project_id
  region                = var.region
  cluster_name          = var.cluster_name
  network               = module.vpc.vpc_id
  subnetwork            = module.vpc.subnet_self_link
  pods_range            = module.vpc.pods_range_name
  services_range        = module.vpc.services_range_name
  machine_type          = var.machine_type
  service_account_email = var.service_account_email

  depends_on = [module.project_services]
}

# Cloud SQL Postgres (using private IP)
/* module "cloud_sql_postgres" {
  source                 = "../../modules/cloud_sql"
  project_id             = var.project_id
  region                 = var.region
  vpc_network_self_link  = module.vpc.network_self_link
  instance_name          = "dev-postgres-instance"
  database_name          = "app_db"
  database_user          = "app_user"
  password               = var.db_password
  ipv4_enabled           = false
  deletion_protection    = false

  depends_on = [module.project_services]
}
*/
# Cloud NAT
module "nat" {
  source                 = "../../modules/nat"
  router_name            = "dev-nat-router"
  nat_name               = "dev-nat-config"
  vpc_network            = module.vpc.network_self_link
  region                 = var.region
  nat_ip_allocate_option = "AUTO_ONLY"

  depends_on = [module.project_services]
}

# Container Registry
module "gcr" {
  source     = "../../modules/gcr"
  project_id = var.project_id
  region     = var.region
  repo_name  = var.repo_name
  depends_on = [module.project_services]
}

module "static_ip" {
  source     = "../../modules/static_ip"
  name       = "artisan-client-frontend-dev"
  region     = var.region
  project_id = var.project_id
}
