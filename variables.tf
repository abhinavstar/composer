variable "project_id" {}
variable "region" {}
variable "environment_name" {}
variable "network_name" { default = "composer-vpc" }
variable "subnet_name" { default = "composer-subnet" }
variable "image_version" { default = "composer-2.5.3-airflow-2.7.3" }
variable "python_version" { default = "3" }
variable "environment_size" { default = "ENVIRONMENT_SIZE_SMALL" }
variable "env_variables" {
  type = map(string)
  default = {}
}
variable "airflow_variables" {
  type = map(string)
  default = {}
}
