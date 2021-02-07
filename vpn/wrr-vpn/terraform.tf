# terraform {
#   backend "gcs" {
#     bucket = "tf-state-wrr-vpn"
#     prefix = "terraform-state"
#   }
# }

terraform {
  backend "gcs" {
    bucket = "wrr-cicd-tf-state"
    prefix = "terraform-state/vpn/wrr-vpn"
  }
}
