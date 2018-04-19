variable "gcloud-project" {
  default = "abletogcpproject"
}

variable "gcloud-region" {
  default = "default-us-east1"
}

variable "network-name" {
  default = "GCPSubnet"
}

variable "subnet1" {
  default = " GCPSubnet1"
}

variable "subnet2" {
  default = "GCPSubnet1"
}

variable "subnetwork-region" {
  default = "us-east1"
}

variable "ip_cidr_range1" {
  default = "10.0.0.0/24"
}

variable "ip_cidr_range2" {
  default = "10.0.1.0/24"
}

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

//Create Compute

