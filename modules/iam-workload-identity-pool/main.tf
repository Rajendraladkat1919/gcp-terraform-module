/**
 * Copyright 2025 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  # Same mapping as Cloud Foundation Fabric modules/project/identity-providers-defs.tf (github).
  github_attribute_mapping = {
    "google.subject"             = "assertion.sub"
    "attribute.sub"              = "assertion.sub"
    "attribute.actor"            = "assertion.actor"
    "attribute.repository"       = "assertion.repository"
    "attribute.repository_owner" = "assertion.repository_owner"
    "attribute.ref"              = "assertion.ref"
    "attribute.fast_sub"         = "\"repo:\" + assertion.repository + \":ref:\" + assertion.ref"
    "attribute.workflow"         = "assertion.workflow"
    "attribute.job_workflow_ref" = "assertion.job_workflow_ref"
    "attribute.event_name"       = "assertion.event_name"
    "attribute.pr_review_sub"    = "\"event:\" + assertion.event_name + \":workflow:\" + assertion.workflow"
  }
}

resource "google_iam_workload_identity_pool" "default" {
  project                   = var.project_id
  workload_identity_pool_id = var.pool_id
  display_name              = coalesce(var.display_name, var.pool_id)
  description               = var.description
  disabled                  = var.disabled
}

resource "google_iam_workload_identity_pool_provider" "github" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.default.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name                       = var.provider_id
  description                        = "GitHub Actions."
  disabled                           = var.disabled
  attribute_condition                = var.attribute_condition
  attribute_mapping                  = merge(local.github_attribute_mapping, var.attribute_mapping)

  oidc {
    issuer_uri        = var.issuer_uri
    allowed_audiences = var.allowed_audiences
  }
}
