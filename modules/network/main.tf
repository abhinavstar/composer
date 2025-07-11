resource "google_compute_network" "composer_vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "composer_subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = "10.10.0.0/24"
  region                   = var.region
  network                  = google_compute_network.composer_vpc.self_link
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.10.1.0/24"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.10.2.0/24"
  }
}
