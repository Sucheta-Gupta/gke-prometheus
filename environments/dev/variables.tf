variable "project_id" {}
variable "region" {}

variable "node_pools" {
  description = "Map of Node pools and their configuration"
  type = map(object({
    machine_type              = string
    min_node_count            = number
    max_node_count            = number
    node_pool_location_policy = string
    disk_size_gb              = number
    labels                    = map(string)
  }))
}

variable "enable_private_nodes" {
  description = "Enable private nodes"
  type        = bool
  default     = true
}
variable "enable_private_endpoint" {
  description = "Enable private endpoint"
  type        = bool
  default     = true
}

variable "master_global_access_enabled" {
  description = "Enable master global access"
  type        = bool
  default     = true
}

# Master Authorized Networks
variable "master_authorized_cidr_blocks" {
  description = "List of CIDR blocks for master authorized networks"
  type        = list(string)
}

variable "gcp_public_cidrs_access_enabled" {
  description = "Enable GCP public CIDRs access"
  type        = bool
  default     = false
}

variable "private_endpoint_enforcement_enabled" {
  description = "Enable private endpoint enforcement"
  type        = bool
  default     = true
}