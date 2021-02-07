terraform {
  backend "gcs" {
    bucket = "wrr-cicd-tf-state"
    prefix = "terraform-state/cicd/wrr-cicd-main"
  }
}
