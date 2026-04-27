resource "google_container_node_pool" "pools" {
    for_each = var.node_pools
    name = each.key
    cluster  = google_container_cluster.primary.name
    location = var.region

    autoscaling {
      min_node_count  = each.value.min_node_count
      max_node_count  = each.value.max_node_count
      location_policy = each.value.node_pool_location_policy
    }

    node_config {
      machine_type = each.value.machine_type

      labels = each.value.labels
      disk_size_gb = each.value.disk_size_gb
  }
}