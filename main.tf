terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "web_server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["http-server", "https-server"]
}

output "instance_ip_internal" {
  value = google_compute_instance.web_server.network_interface[0].network_ip
}

output "instance_ip_external" {
  value = google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip
}
