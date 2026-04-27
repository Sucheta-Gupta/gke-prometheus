module "network" {
  source = "../../modules/network"
  name   = "prod-vpc"
  cidr   = "10.0.0.0/16"
  region = var.region
}

module "gke" {
  source                               = "../../modules/gke"
  name                                 = "dev-gke"
  region                               = var.region
  network                              = module.network.network
  subnet                               = module.network.subnet
  project_id                           = var.project_id
  node_pools                           = var.node_pools
  enable_private_nodes                 = var.enable_private_nodes
  enable_private_endpoint              = var.enable_private_endpoint
  master_global_access_enabled         = var.master_global_access_enabled
  master_authorized_cidr_blocks        = var.master_authorized_cidr_blocks
  gcp_public_cidrs_access_enabled      = var.gcp_public_cidrs_access_enabled
  private_endpoint_enforcement_enabled = var.private_endpoint_enforcement_enabled
}