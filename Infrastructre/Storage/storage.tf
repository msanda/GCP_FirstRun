backend "gcs" {
  bucket  = "${TF_ADMIN}"
  path    = "/terraform.tfstate"
  project = "${TF_ADMIN}"
}
