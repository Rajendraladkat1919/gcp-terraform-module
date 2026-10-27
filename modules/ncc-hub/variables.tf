/**
 * Copyright 2026 Google LLC
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
  description = "Project that hosts the NCC hub. On the sketch this is demo-pr-net-core."
  type        = string
}

variable "name" {
  description = "Hub name. On the sketch this is hub-0."
  type        = string
}

variable "description" {
  description = "Hub description."
  type        = string
  default     = "Terraform-managed."
}

variable "labels" {
  description = "Labels applied to the hub."
  type        = map(string)
  default     = {}
}

variable "export_psc" {
  description = "Export Private Service Connect subnets from spoke VPCs into the hub."
  type        = bool
  default     = true
}

variable "preset_topology" {
  description = "Hub topology. The sketch labels the hub as a star control plane."
  type        = string
  default     = "STAR"
  validation {
    condition     = contains(["MESH", "STAR", "HYBRID_INSPECTION"], var.preset_topology)
    error_message = "preset_topology must be MESH, STAR, or HYBRID_INSPECTION."
  }
}

variable "group_name" {
  description = "Group that VPC spokes join. The sketch uses the default group."
  type        = string
  default     = "default"
}

variable "group_description" {
  description = "Group description."
  type        = string
  default     = "Terraform-managed."
}

variable "group_labels" {
  description = "Labels applied to the group."
  type        = map(string)
  default     = {}
}

variable "auto_accept_projects" {
  description = "Project ids or numbers whose spokes join the group without a proposal. Include the hub project and each spoke project."
  type        = list(string)
  default     = []
}

variable "vpc_spokes" {
  description = "VPC spokes attached to the hub. Keys are spoke names, such as prod-0 and nonprod-0. uri is the VPC self link. project_id defaults to the hub project."
  type = map(object({
    uri                   = string
    project_id            = optional(string)
    description           = optional(string, "Terraform-managed.")
    labels                = optional(map(string), {})
    exclude_export_ranges = optional(list(string))
    include_export_ranges = optional(list(string))
  }))
  default  = {}
  nullable = false
}
