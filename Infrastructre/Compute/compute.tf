// Create google compute instance
variable "gcloud-project" {
  default = "abletogcpproject"
}

variable "gcloud-region" {
  default = "us-east1-b"
}

resource "google_compute_instance" "default" {
  project      = "${var.gcloud-project}"
  zone         = "${var.gcloud-region}"
  name         = "tf-compute-1"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20170328"
    }
  }

  network_interface {
    //Want to place this machine in the subnet 
    subnetwork = "gcpsubnet1"

    access_config = {0.0.0.0}
  }

  metadata {
    environment = "test"
    project     = "AbleTo"
  }
}

output "instance_id" {
  value = "${google_compute_instance.default.self_link}"
}
