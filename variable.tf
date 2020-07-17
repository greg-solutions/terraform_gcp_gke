variable "network" {
  type = string
  default = "(Required) Network for cluster"
}
variable "subnetwork" {
  type = string
  default = "(Required) Subnet for cluster"
}

variable "cluster_version" {
  type = string
  default = "latest"
}
variable "cluster_name" {
  type = string
  default = "test"
}
variable "initial_node_count" {
  type = number
  default = 1
}
variable "max_node_count" {
  type = number
  default = 3
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}
variable "min_node_count" {
  type = number
  default = 1
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}
variable "node_machine_type" {
  type = string
  default = "n1-standard-4"
  description = "The name of a Google Compute Engine machine type. Defaults to n1-standard-4. To create a custom machine type, value should be set as specified here."
}
variable "node_disk_size_gb" {
  type = number
  default = 100
  description = "Size of disk on worker nodes."
}

variable "node_disk_type" {
  type = string
  default = "pd-standard"
  description = "Type of disk o worker nodes."
}
variable "cluster_master_username" {
  type = string
  default = ""
}
variable "cluster_master_password" {
  type = string
  default = ""
}
variable "logging_service" {
  type = string
  default = "logging.googleapis.com/kubernetes"
}
variable "monitoring_service" {
  type = string
  default = "monitoring.googleapis.com/kubernetes"
}
variable "oauth_scopes" {
  type = list(string)
  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
  description = "The set of Google API scopes to be made available on all of the node VMs under the 'default' service account. These can be either FQDNs, or scope aliases. The following scopes are necessary to ensure the correct functioning of the cluster:"
}

variable "master_authorized_networks_config" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default     = [
    {
      cidr_block = "0.0.0.0/0"
      display_name = "all-for-dev"
    }
  ]
}
variable "node_tags" {
  description = "(Optional) Tags for nodes"
  type = list(string)
  default = []
}
variable "http_load_balancing" {
  description = "(Optional) The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster. set true to disable."
  type = bool
  default = true
}
variable "preemptible" {
  description = "Enable or Disable node pool preemptible instances"
  type = bool
  default = true
}
variable "node_pool_name" {
  default = "pool-node"
}