//Frist Create instance Template
resource "google_compute_instance_template" "default" {
  count = "1"

  project = "abletogcpproject"

  name = "abletogcproject-template"

  machine_type = "f1-micro"

  region = "us-east1"

  tags = ["dev", "ableto"]

  labels = {
    environment = "dev"
  }

  network_interface {
    subnetwork = "${var.subnet1}"

    address            = ""
    subnetwork_project = "abletogcpproject"

    access_config {
      // Ephemeral IP
      nat_ip = ""
    }
  }

  can_ip_forward = "false"

  disk {
    auto_delete = true

    boot = true

    //source_image = "ubuntu-1604-xenial-v20170328"
    //use custom image with wordpress
    source_image = "ableto-wordpress-image-opt"

    type = "PERSISTENT"
  }

  metadata {
    enable-oslogin = "True"
    startup-script = "/mysqlproxy/cloud_sql_proxy -instances=abletogcpproject:us-east1:abletogc-database=tcp:3306 &"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_health_check" "autohealing" {
  name                = "health-check"
  check_interval_sec  = 60
  timeout_sec         = 60
  healthy_threshold   = 8
  unhealthy_threshold = 10

  http_health_check {
    request_path = "/heartbeat"
    port         = 80
  }
}

resource "google_compute_instance_group_manager" "default" {
  description = "compute VM Instance Group"

  count = "1"

  project = "abletogcpproject"

  name = "abletogcproject-template"

  base_instance_name = "abletogc-grouped"
  instance_template  = "${google_compute_instance_template.default.self_link}"
  zone               = "us-east1-b"
  update_strategy    = "RESTART"

  // we want 2 deployed instances

  target_size = "2"
  named_port {
    name = "http"

    port = "80"
  }
  auto_healing_policies = {
    health_check = "${google_compute_health_check.autohealing.self_link}"

    initial_delay_sec = "300"
  }

  /*   provisioner "local-exec" {
    when = "destroy"

    command = "echo 'goodbye'"
  }
  provisioner "local-exec" {
    when = "create"

    command = "apt-get update"

    interpreter = ["sh", "-c"]
  } */
}

resource "google_compute_autoscaler" "default" {
  count = "1"

  project = "abletogcpproject"

  name = "abletogcproject-template"

  zone = "${var.zone}"

  target = "${google_compute_instance_group_manager.default.self_link}"

  autoscaling_policy = {
    max_replicas = "3"

    min_replicas = "1"

    cooldown_period = "60"
  }
}
