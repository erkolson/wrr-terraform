terraform {
  backend "gcs" {
    bucket = "tf-state-wrr-vpn"
    prefix = "terraform-state"
  }
}
