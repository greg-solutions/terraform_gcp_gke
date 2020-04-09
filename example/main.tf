module "gke" {
  source = "../"
  network = module.vpc.networks[0]
  subnetwork = module.vpc.subnetworks_name[0]
  cluster_name = var.cluster_name
  node_machine_type = "n1-standard-2"
  node_disk_size_gb = "10"
  min_node_count = 1
  max_node_count = 3
  node_count = 1
  master_authorized_networks_config = [
    {
      cidr_block = module.vpc.ip_cidr_ranges[0]
      display_name = "Subnets"
    },
    {
      cidr_block = "32.133.20.1/32"
      display_name = "Developer-1"
    },
  ]
  cluster_version = "1.15.11-gke.1"
}