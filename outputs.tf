output "cluster_name" {
  value = google_container_cluster.google_container_cluster.name
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "cluster_zone" {
  value = google_container_cluster.google_container_cluster.zone
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "cluster_username" {
  value = google_container_cluster.google_container_cluster.master_auth[0].username
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "cluster_password" {
  value = google_container_cluster.google_container_cluster.master_auth[0].password
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "endpoint" {
  value = google_container_cluster.google_container_cluster.endpoint
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "instance_group_urls" {
  value = google_container_cluster.google_container_cluster.instance_group_urls
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "node_config" {
  value = google_container_cluster.google_container_cluster.node_config
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "node_pools" {
  value = google_container_cluster.google_container_cluster.node_pool
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "client_certificate" {
  value = base64decode(google_container_cluster.google_container_cluster.master_auth.0.client_certificate)
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "client_key" {
  value = base64decode(google_container_cluster.google_container_cluster.master_auth.0.client_key)
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "cluster_ca_certificate" {
  value = base64decode(google_container_cluster.google_container_cluster.master_auth.0.cluster_ca_certificate)
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "access_token" {
  value = data.google_client_config.config.access_token
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

output "cluster_ip_cidr" {
  value = google_container_cluster.google_container_cluster.cluster_ipv4_cidr
}

output "node_tags" {
  value = var.node_tags
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}