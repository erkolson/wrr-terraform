

###############################################################################
# E A S T   I N S T A N C E
###############################################################################
resource "google_compute_address" "east_external" {
  name         = "east-ipv4-external"
  network_tier = "STANDARD"
  region       = "us-east1"
}

resource "google_compute_instance" "pritunl_east" {
  name = "pritunl-east"
  machine_type = "n1-standard-1"
  zone = "us-east1-b"

  tags = ["pritunl"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.east.name

    access_config {
      network_tier = "STANDARD"
      nat_ip = google_compute_address.east_external.address
    }
  }

  can_ip_forward = true
}

###############################################################################
# W E S T   I N S T A N C E
###############################################################################
#  whoops on the name here :-/
resource "google_compute_address" "west_external" {
  name         = "east-ipv4-external"
  network_tier = "STANDARD"
  region       = "us-west1"
}

resource "google_compute_instance" "pritunl_west" {
  name = "pritunl-west"
  machine_type = "n1-standard-1"
  zone = "us-west1-b"

  tags = ["pritunl"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.west.name

    access_config {
      network_tier = "STANDARD"
      nat_ip = google_compute_address.west_external.address
    }
  }

  can_ip_forward = true
}


###############################################################################
# O U T P U T S
###############################################################################

output "east_external_ip" {
  value = google_compute_address.east_external.address
}

output "west_external_ip" {
  value = google_compute_address.west_external.address
}
