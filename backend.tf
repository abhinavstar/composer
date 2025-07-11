terraform {
  backend "gcs" {
    bucket  = "my-terraform-state-bucket-1"
    prefix  = "composer/envs/prod"
  }
}
