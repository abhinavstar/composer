output "network_self_link" {
  value = google_compute_network.composer_vpc.self_link
}

output "subnetwork_self_link" {
  value = google_compute_subnetwork.composer_subnet.self_link
}

output "pods_secondary_range_name" {
  value = "pods"
}

output "services_secondary_range_name" {
  value = "services"
}
