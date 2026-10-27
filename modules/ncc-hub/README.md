# NCC hub

Network Connectivity Center hub, one spoke group, and VPC spokes. This is the hub drawn on `demo-pr-net-core`: center `hub-0`, edge spokes `prod-0` and `nonprod-0`.

Cloud Foundation Fabric v59.1.0 has no standalone module for this. Its `ncc-spoke-ra` module creates a router-appliance spoke and is not used here. The resources match `fast/stages/2-networking/factory-ncc.tf` at that pin.

```hcl
module "ncc" {
  source     = "../../ncc-hub"
  project_id = "demo-pr-net-core"
  name       = "hub-0"

  auto_accept_projects = [
    "demo-pr-net-core",
    "demo-prod-net-spoke",
    "demo-non-prod-net-spoke",
  ]

  vpc_spokes = {
    prod-0 = {
      uri        = module.prod_vpc.self_link
      project_id = "demo-prod-net-spoke"
    }
    nonprod-0 = {
      uri        = module.nonprod_vpc.self_link
      project_id = "demo-non-prod-net-spoke"
    }
  }
}
```

VPN and Interconnect spokes stay with `net-vpn-ha` and `net-vlan-attachment`. This module attaches VPC networks only.
