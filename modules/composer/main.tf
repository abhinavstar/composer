resource "google_service_account" "composer_sa" {
  account_id   = "${var.environment_name}-sa"
  display_name = "Composer Environment Service Account"
}

resource "google_project_iam_member" "composer_sa_roles" {
  for_each = toset([
    "roles/composer.worker",
    "roles/composer.environmentAndStorageObjectViewer",
    "roles/storage.objectAdmin",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
  ])

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.composer_sa.email}"
}

resource "google_composer_environment" "composer_env" {
  name   = var.environment_name
  region = var.region

  config {
    software_config {
      image_version  = var.image_version
      python_version = var.python_version
      env_variables  = var.env_variables
    }

    node_config {
      service_account = google_service_account.composer_sa.email
      network         = var.network_self_link
      subnetwork      = var.subnetwork_self_link
      ip_allocation_policy {
        use_ip_aliases                = true
        cluster_secondary_range_name = var.pods_secondary_range_name
        services_secondary_range_name = var.services_secondary_range_name
      }
    }

    environment_size = var.environment_size
  }
}
