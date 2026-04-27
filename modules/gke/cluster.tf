resource "google_container_cluster" "primary" {
  name     = var.name
  location = var.region

  network    = var.network
  subnetwork = var.subnet

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {}

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  release_channel {
    channel = "REGULAR"
  }


  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint

    master_global_access_config {
      enabled = var.master_global_access_enabled
    }
  }

  # Control Plane Security
  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.master_authorized_cidr_blocks
      content {
        cidr_block = cidr_blocks.value
      }
    }

    gcp_public_cidrs_access_enabled      = var.gcp_public_cidrs_access_enabled
    private_endpoint_enforcement_enabled = var.private_endpoint_enforcement_enabled
  }

}

 