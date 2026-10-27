# Names shared by gcp-foundation-bootstrap and gcp-infrastructure-lz.
# Nothing here creates a resource.

locals {
  tier = "pr"

  core_project_names = {
    iac_core = "${local.tier}-iac-core"
    billing  = "${local.tier}-billing"
    logging  = "${local.tier}-logging"
  }

  core_project_ids = {
    for k, v in local.core_project_names : k => "${var.prefix}-${v}"
  }

  # One identity runs Terraform for bootstrap, the landing zone and every workload project.
  # The account id is not prefixed. sa-billing-reader and sa-logging-reader are not in this map.
  automation_service_account_ids = {
    execute = "dev-terraform-execute"
  }

  state_bucket_names = {
    bootstrap = "${local.tier}-tfstate-bootstrap"
    lz        = "${local.tier}-tfstate-lz"
  }

  # Shell projects created by bootstrap stage 2-network-projects under Infrastructure / Network.
  # With prefix demo these are demo-pr-net-core, demo-prod-net-spoke, demo-non-prod-net-spoke.
  network_project_names = {
    hub     = "${local.tier}-net-core"
    prod    = "prod-net-spoke"
    nonprod = "non-prod-net-spoke"
  }

  network_project_ids = {
    for k, v in local.network_project_names : k => "${var.prefix}-${v}"
  }

  environments = {
    prod = {
      code        = "pr"
      folder_name = "Prod"
    }
    nonprod = {
      code        = "np"
      folder_name = "Non-Prod"
    }
  }
}
