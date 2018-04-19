variable "gcloud-project" {
  default = "abletogcpproject"
}

variable "gcloud-region" {
  default = "default-us-east1"
}

//Must be Lowercases
variable "network-name" {
  default = "gcpsubnet"
}

variable "subnet1" {
  default = "gcpsubnet1"
}

variable "subnet2" {
  default = "gcpsubnet2"
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

variable "compute-image" {
  default = "ubuntu-1604-xenial-v20170328"
}
