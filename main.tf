resource "google_container_cluster" "google_container_cluster" {
  name = format("%s-cluster", var.cluster_name)
  initial_node_count = var.initial_node_count
  min_master_version = data.google_container_engine_versions.cluster_engine_version.latest_master_version
  network = var.network
  subnetwork = var.subnetwork
  remove_default_node_pool = true
  logging_service = var.logging_service
  monitoring_service = var.monitoring_service
  // Use legacy ABAC until these issues are resolved:
  //   https://github.com/mcuadros/terraform-provider-helm/issues/56
  //   https://github.com/terraform-providers/terraform-provider-kubernetes/pull/73
  enable_legacy_abac = true

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.master_authorized_networks_config
      content {
        cidr_block = cidr_blocks.value.cidr_block
        display_name = lookup(cidr_blocks.value, "display_name", null)
      }
    }
  }

  master_auth {
    username = var.cluster_master_username
    password = var.cluster_master_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name = "pool-node"
  cluster = google_container_cluster.google_container_cluster.name

  node_config {
    preemptible = true
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size_gb
    disk_type = var.node_disk_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = var.oauth_scopes
  }
  initial_node_count = var.initial_node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair = "true"
    auto_upgrade = "true"
  }
}