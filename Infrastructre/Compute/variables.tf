# variable "gcloud-project" {
#   default = "abletogcpproject"
# }

# variable "gcloud-region" {
#   default = "us-east1-b"
# }

variable "network-name" {
  default = "gcpsubnet"
}

variable "subnet1" {
  default = "gcpsubnet1"
}

variable "compute-image" {
  default = "ubuntu-1604-xenial-v20170328"
}

variable "zone" {
  default = "us-east1-b"
}
