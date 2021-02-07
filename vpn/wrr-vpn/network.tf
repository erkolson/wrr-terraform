

resource "google_compute_network" "vpn_network" {
  name = "vpn-network"
}

resource "google_compute_subnetwork" "east" {
  name          = "east1"
  ip_cidr_range = "10.100.0.0/16"
  region        = "us-east1"
  network       = google_compute_network.vpn_network.id
}

resource "google_compute_subnetwork" "west" {
  name          = "west1"
  ip_cidr_range = "10.101.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.vpn_network.id
}

resource "google_compute_firewall" "ipsec_ingress" {
  name = "pritunl-ingress"
  network = google_compute_network.vpn_network.name

  allow {
    protocol = "udp"
    ports = ["500", "4500"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["pritunl"]
}

resource "google_compute_firewall" "pritunl_management" {
  name = "pritunl-management"
  network = google_compute_network.vpn_network.name

  allow {
    protocol = "tcp"
    ports = ["80", "443"]
  }

  source_ranges = [
    "23.124.20.64/32",
    "0.0.0.0/0" # actually need this for letsencrypt
  ]

  target_tags = ["pritunl"]
}


resource "google_compute_firewall" "ssh" {
  name = "vpn-ssh"
  network = google_compute_network.vpn_network.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
