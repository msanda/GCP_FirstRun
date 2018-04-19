provider "google" {
  credentials = "${file("../secrets/account_gc.json")}"
  project     = "${var.gcloud-project}"
  region      = "${var.gcloud-region}"
}

// Create network 

module "network" {
  source = "Network"
}

module "compute" {
  source = "Compute"
}

module "database" {
  source = "services"
}

//Create Compute

