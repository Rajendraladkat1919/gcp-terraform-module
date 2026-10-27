# gcp-terraform-module

Trust level: Medium. Nothing in this repository is applied on its own.

Shared Terraform modules for the landing zone, copied from [Cloud Foundation Fabric](https://github.com/GoogleCloudPlatform/cloud-foundation-fabric) **v59.1.0** (`e6005a63339fff29550260d8ac1384d591c8f865`). The pin and a hash per module are in [modules/PROVENANCE.md](modules/PROVENANCE.md).

`gcp-foundation-bootstrap` calls `project`, `gcs`, `kms`, `iam-service-account`, `secret-manager`, and `iam-workload-identity-pool`. `gcp-infrastructure-lz` calls `folder`, `project`, `net-vpc`, `net-cloudnat`, `net-firewall-policy`, `dns`, `dns-response-policy`, and `ncc-hub`.

| Module | Used for |
|---|---|
| `organization`, `folder`, `project`, `project-factory`, `billing-account`, `iam-service-account`, `iam-workload-identity-pool` | Organization setup and GitHub OIDC |
| `gcs`, `kms`, `secret-manager`, `logging-bucket`, `pubsub`, `bigquery-dataset` | State, secrets, and data services |
| `net-vpc`, `net-vpc-factory`, `net-vpc-firewall`, `net-firewall-policy`, `ncc-hub` | Hub and spoke VPCs, and the NCC hub |
| `dns`, `dns-response-policy`, `net-address`, `net-cloudnat` | DNS and egress |
| `net-vpn-ha`, `net-vlan-attachment` | HA VPN and interconnect, added when a real peer exists |

`compute-vm`, `net-lb-int`, `data-catalog-policy-tag`, and `dataplex-aspect-types` are not in this library. The Dev hub and spoke does not use them.
