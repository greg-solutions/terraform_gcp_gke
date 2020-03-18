variable "project_id" {
  description = "Global project ID"
  default = "kyma-dev"
}

variable "subnetwork_cidr" {
  description = "(Required) The range of IP addresses belonging to this subnetwork secondary range. Provide this property when you create the subnetwork. Ranges must be unique and non-overlapping with all primary and secondary IP ranges within a network. Only IPv4 is supported."
  default = "10.10.0.0/16"
}

variable "region" {
  default = "europe-west6"
}

variable "zone" {
  default = "europe-west6-a"
}