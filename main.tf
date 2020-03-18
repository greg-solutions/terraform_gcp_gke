resource "google_compute_network" "vpc_network" {
  name = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode = var.routing_mode
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

resource "google_compute_subnetwork" "public_subnet" {
  count = var.subnetwork_count
  ip_cidr_range = cidrsubnet(var.subnetwork_cidr, 8, count.index)
  name = lower(format("%s-zone-%d", var.network_name, count.index))
  network = google_compute_network.vpc_network.self_link

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling = 0.5
    metadata = "INCLUDE_ALL_METADATA"
  }
}