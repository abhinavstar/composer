provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source        = "./modules/network"
  project_id    = var.project_id
  region        = var.region
  network_name  = var.network_name
  subnet_name   = var.subnet_name
}

module "composer" {
  source                     = "./modules/composer"
  project_id                 = var.project_id
  region                     = var.region
  environment_name           = var.environment_name
  image_version              = var.image_version
  python_version             = var.python_version
  env_variables              = var.env_variables
  environment_size           = var.environment_size
  airflow_variables          = var.airflow_variables
  network_self_link          = module.network.network_self_link
  subnetwork_self_link       = module.network.subnetwork_self_link
  pods_secondary_range_name  = module.network.pods_secondary_range_name
  services_secondary_range_name = module.network.services_secondary_range_name
}
