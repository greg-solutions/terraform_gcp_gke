data "google_container_engine_versions" "cluster_engine_version" {
  version_prefix = "latest"
}

data "google_client_config" "config" {
}
