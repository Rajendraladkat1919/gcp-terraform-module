output "automation_service_account_emails" {
  description = "Email of the Terraform executor, keyed by execute. The account id is dev-terraform-execute in the iac-core project."
  value = {
    for k, v in local.automation_service_account_ids :
    k => "${v}@${local.core_project_ids["iac_core"]}.iam.gserviceaccount.com"
  }
}

output "automation_service_account_ids" {
  description = "Account id (the part before the @) of the Terraform executor. The only key is execute."
  value       = local.automation_service_account_ids
}

output "core_project_ids" {
  description = "Project id of each org-level core project, keyed by iac_core, billing, logging."
  value       = local.core_project_ids
}

output "core_project_names" {
  description = "Project name (without prefix) of each org-level core project."
  value       = local.core_project_names
}

output "environments" {
  description = "Environment short code and folder display name, keyed by prod and nonprod."
  value       = local.environments
}

output "hub_project_id" {
  description = "Project id of the network hub project."
  value       = local.network_project_ids["hub"]
}

output "hub_project_name" {
  description = "Project name (without prefix) of the network hub project."
  value       = local.network_project_names["hub"]
}

output "iac_core_project_id" {
  description = "Project id of the iac-core project that hosts the automation identities and is billed for API usage."
  value       = local.core_project_ids["iac_core"]
}

output "network_project_ids" {
  description = "Project id of the hub and of each Shared VPC host, keyed by hub, prod and nonprod."
  value       = local.network_project_ids
}

output "network_project_names" {
  description = "Project name (without prefix) of the hub and of each Shared VPC host."
  value       = local.network_project_names
}

output "spoke_project_ids" {
  description = "Project id of the spoke (Shared VPC host) project of each environment."
  value = {
    for env in ["prod", "nonprod"] : env => local.network_project_ids[env]
  }
}

output "spoke_project_names" {
  description = "Project name (without prefix) of the spoke project of each environment."
  value = {
    for env in ["prod", "nonprod"] : env => local.network_project_names[env]
  }
}

output "state_bucket_full_names" {
  description = "Full GCS bucket names of the Terraform state buckets."
  value       = { for k, v in local.state_bucket_names : k => "${var.prefix}-${v}" }
}

output "state_bucket_names" {
  description = "Bucket name suffixes (the gcs module adds the prefix)."
  value       = local.state_bucket_names
}
