provider "google" {
  credentials = file("gcp-account.json")
  project     = "your-project-id"
  region      = "us-central1"
  zone        = "us-central-a"
}

resource "google_compute_instance" "data_example" {
  count        = 3
  name         = "data-example-instance-${count.index}"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-stream-9"
    }
  }

  network_interface {
    network = "default"
    access_config{}
  }
}
