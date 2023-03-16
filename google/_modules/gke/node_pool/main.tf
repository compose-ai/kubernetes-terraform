resource "google_container_node_pool" "current" {
  name     = var.pool_name
  project  = var.project
  cluster  = var.cluster_name
  location = var.location

  initial_node_count = var.initial_node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_locations = var.node_locations

  #
  #
  # Node config
  node_config {
    service_account = var.disable_per_node_pool_service_account ? var.service_account_email : google_service_account.current[0].email

    oauth_scopes = local.oauth_scopes

    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type

    image_type   = var.image_type
    machine_type = var.machine_type
    preemptible  = var.preemptible

    labels = var.metadata_labels

    tags = var.metadata_tags

    workload_metadata_config {
      mode = var.node_workload_metadata_config
    }

    guest_accelerator {
      type  = var.guest_accelerator_type
      count = var.guest_accelerator_count
    }

    taint = var.taint
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }
}
