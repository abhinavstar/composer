variable "project_id" {}
variable "region" {}
variable "environment_name" {}
variable "image_version" {}
variable "python_version" {}
variable "environment_size" {}
variable "env_variables" {
  type = map(string)
  default = {}
}
variable "airflow_variables" {
  type = map(string)
  default = {}
}
variable "network_self_link" {}
variable "subnetwork_self_link" {}
variable "pods_secondary_range_name" {}
variable "services_secondary_range_name" {}
