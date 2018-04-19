variable "gcloud-project" {
  default = "abletogcpproject"
}

variable "gcloud-region" {
  default = "default-us-east1"
}

provider "google" {
  credentials = "${file("../account_gc.json")}"

  #credentials = "${file("C:\Users\msand\Documents\Personal Github\GCP_FirstRun\secrets\account_gc.json")}"
  project = "${var.gcloud-project}"
  region  = "${var.gcloud-region}"
}
