variable "network_name" {
  default = "development"
  description = "Name of the network resource."
}

variable "subnetwork_cidr" {
  default = "10.10.0.0/16"
  description = "The range of internal addresses that are owned by this subnetwork. "
}

variable "auto_create_subnetworks" {
  default = false
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
}

variable "subnetwork_count" {
  default = 1
  description = "Count of subnetworks"
}

variable "routing_mode" {
  default = "REGIONAL"
  description = "The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnetworks of this network, across regions."
}

variable "delete_default_routes_on_create" {
  default = false
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation. Defaults to false."
}