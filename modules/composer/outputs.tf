output "composer_airflow_uri" {
  value = google_composer_environment.composer_env.config.0.airflow_uri
}
