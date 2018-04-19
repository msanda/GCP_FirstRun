//Firewall Rules to only allow ssh, HTTP and HTTPS
// we will be blocking icmp request later for now we wil allow request so we can ping our vm
resource "google_compute_firewall" "ssh" {
  name    = "webandssh-ssh"
  network = "${google_compute_network.platform.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
