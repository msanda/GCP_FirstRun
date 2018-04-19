resource "google_sql_database_instance" "test-db" {
  name             = "test-instance"
  project          = "abletogcpproject"
  region           = "us-east1"
  database_version = "MYSQL_5_6"

  settings {
    tier = "db-f1-micro"
  }

  // No need for replica for this case
  //replica_configuration = [""]
}

// This is not secure . but used to setup the site for testing purposes

resource "google_sql_user" "default" {
  name     = "default"
  project  = "abletogcpproject"
  instance = "${google_sql_database_instance.test-db.name}"
  host     = "%"
  password = "simpletest"
}
