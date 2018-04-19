resource "google_sql_database_instance" "test-db" {
  name   = "test-instance"
  region = "${var.gce_region}"

  settings {
    tier = "db-f1-micro"
  }
}
