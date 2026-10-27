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

resource "google_network_connectivity_hub" "hub" {
  project         = var.project_id
  name            = var.name
  description     = var.description
  labels          = var.labels
  export_psc      = var.export_psc
  preset_topology = var.preset_topology
}

resource "google_network_connectivity_group" "default" {
  project     = var.project_id
  hub         = google_network_connectivity_hub.hub.id
  name        = var.group_name
  description = var.group_description
  labels      = var.group_labels

  dynamic "auto_accept" {
    for_each = length(var.auto_accept_projects) > 0 ? [""] : []
    content {
      auto_accept_projects = var.auto_accept_projects
    }
  }
}

resource "google_network_connectivity_spoke" "vpc" {
  for_each    = var.vpc_spokes
  project     = coalesce(each.value.project_id, var.project_id)
  name        = each.key
  location    = "global"
  description = each.value.description
  labels      = each.value.labels
  hub         = google_network_connectivity_hub.hub.id
  group       = google_network_connectivity_group.default.id

  linked_vpc_network {
    uri                   = each.value.uri
    exclude_export_ranges = each.value.exclude_export_ranges
    include_export_ranges = each.value.include_export_ranges
  }
}
