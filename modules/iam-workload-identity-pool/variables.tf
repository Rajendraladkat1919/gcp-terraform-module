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

variable "project_id" {
  description = "Project that hosts the pool. On the sketch this is demo-pr-iac-core."
  type        = string
}

variable "pool_id" {
  description = "Workload Identity pool id."
  type        = string
  default     = "github"
}

variable "provider_id" {
  description = "Workload Identity provider id inside the pool."
  type        = string
  default     = "github"
}

variable "display_name" {
  description = "Pool display name. Defaults to pool_id."
  type        = string
  default     = null
}

variable "description" {
  description = "Pool description."
  type        = string
  default     = "GitHub Actions OIDC."
}

variable "disabled" {
  description = "Disable the pool and the provider."
  type        = bool
  default     = false
}

variable "attribute_condition" {
  description = "CEL condition that must pass before tokens are accepted. Pin this to the GitHub org, for example assertion.repository_owner == 'demo'."
  type        = string
  default     = null
}

variable "attribute_mapping" {
  description = "Extra attribute mappings merged on top of the Fabric GitHub template."
  type        = map(string)
  default     = {}
}

variable "issuer_uri" {
  description = "OIDC issuer. Defaults to GitHub Actions."
  type        = string
  default     = "https://token.actions.githubusercontent.com"
}

variable "allowed_audiences" {
  description = "Extra OIDC audiences. Leave empty to use the provider resource name, which is what GitHub Actions expects."
  type        = list(string)
  default     = []
}
