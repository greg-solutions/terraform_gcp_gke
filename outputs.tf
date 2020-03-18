output "cluster_name" {
  value = google_container_cluster.google_container_cluster.name
}

output "cluster_zone" {
  value = google_container_cluster.google_container_cluster.zone
}

output "cluster_username" {
  value = google_container_cluster.google_container_cluster.master_auth[0].username
}

output "cluster_password" {
  value = google_container_cluster.google_container_cluster.master_auth[0].password
}

output "endpoint" {
  value = google_container_cluster.google_container_cluster.endpoint
}

output "instance_group_urls" {
  value = google_container_cluster.google_container_cluster.instance_group_urls
}

output "node_config" {
  value = google_container_cluster.google_container_cluster.node_config
}

output "node_pools" {
  value = google_container_cluster.google_container_cluster.node_pool
}

output "client_certificate" {
  value = base64decode(google_container_cluster.google_container_cluster.master_auth.0.client_certificate)
}

output "client_key" {
  value = base64decode(google_container_cluster.google_container_cluster.master_auth.0.client_key)
}

output "cluster_ca_certificate" {
  value = base64decode(google_container_cluster.google_container_cluster.master_auth.0.cluster_ca_certificate)
}

output "access_token" {
  value = data.google_client_config.config.access_token
}