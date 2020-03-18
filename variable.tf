variable "network" {
}

variable "subnetwork" {
}

variable "cluster_version" {
  default = "latest"
}

variable "cluster_name" {
  default = "test"
}

variable "initial_node_count" {
  default = 1
}

variable "max_node_count" {
  default = 3
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}
variable "min_node_count" {
  default = 1
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}
variable "node_machine_type" {
  default = "n1-standard-4"
  description = "The name of a Google Compute Engine machine type. Defaults to n1-standard-4. To create a custom machine type, value should be set as specified here."
}

variable "cluster_master_username" {
  default = ""
}

variable "cluster_master_password" {
  default = ""
}
variable "logging_service" {
  default = "logging.googleapis.com/kubernetes"
}
variable "monitoring_service" {
  default = "monitoring.googleapis.com/kubernetes"
}

variable "oauth_scopes" {
  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
  description = "The set of Google API scopes to be made available on all of the node VMs under the 'default' service account. These can be either FQDNs, or scope aliases. The following scopes are necessary to ensure the correct functioning of the cluster:"
}
