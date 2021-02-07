
data "google_organization" "org" {
  # domain = "sortconsulting.com"
  organization = "313471443368"
}

data "google_billing_account" "billing" {
  # display_name    = "wrr-billing"
  billing_account = "01CD45-0FCCB3-527822"
  open            = true
}

resource "google_folder" "admin" {
  display_name = "admin"
  parent       = data.google_organization.org.name
}

resource "google_folder" "cicd" {
  display_name = "cicd"
  parent       = data.google_organization.org.name
}

module "cicd-proj-main" {
  source            = "terraform-google-modules/project-factory/google//modules/gsuite_enabled"
  version           = "~> 10.1"
  billing_account   = data.google_billing_account.billing.id
  org_id            = data.google_organization.org.id
  create_group      = false
  name              = "wrr-cicd-main"
  folder_id         = google_folder.cicd.id
  bucket_name       = "wrr-cicd-tf-state"
  bucket_project    = "wrr-cicd-main"
  bucket_location   = "US"
  bucket_versioning = true
}

resource "google_folder" "nonprod" {
  display_name = "nonprod"
  parent       = data.google_organization.org.name
}

resource "google_folder" "vpn" {
  display_name = "vpn"
  parent       = data.google_organization.org.name
}
