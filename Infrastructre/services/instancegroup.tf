resource "google_compute_instance_group" "webend" {
  name        = "scaled webservices"
  description = "Scalled web group"

  instances = [
    "${google_compute_instance.}",
  ]
}
