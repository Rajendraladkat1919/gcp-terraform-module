# Vendored upstream modules

Copied from Cloud Foundation Fabric for the organization stage and the hub-and-spoke networking stage. Child modules that those stages pull in (through `project-factory` and `net-vpc-factory`) are included. Recipe folders are unchanged and are not applied.

| Field | Value |
|---|---|
| Upstream | https://github.com/GoogleCloudPlatform/cloud-foundation-fabric |
| Tag | v59.1.0 |
| Commit | e6005a63339fff29550260d8ac1384d591c8f865 |
| Licence | Apache-2.0 (headers retained in each file) |

Copied with `git archive` at the commit above, not from a working tree.
`versions.tofu` was removed. `compute-vm`, `net-lb-int`, `data-catalog-policy-tag`, and `dataplex-aspect-types` were removed because the Dev hub and spoke does not use appliances, policy tags, or aspect types. `project-factory` no longer calls the last two.

| Module | Tree hash (sha256 over sorted file hashes) |
|---|---|
| organization | 6410ca2258c14d8e7a8a2eed9f91acfb40fe40a89824b6f638957ea19b6e12cc |
| project | 1b423388a50c3ad1d3c5e28d61c7ed57374ea34864880a577b6c2033da3bd749 |
| project-factory | 4a822a1f93dccafc0a9d40138a6596a34daea173980c755fe8533cc2fa53737b |
| folder | 083339240ab795a864b1ab09fe6109d3b4e122ce4c1004a51bf7f8fba8de9ae5 |
| billing-account | 9f93c627e76aaac192a50ccb47a702b6027714663271e4159ac73184c78c772b |
| iam-service-account | 12c167b6af067bcf36aae2aa90edb1366591e3f3e7744a99f07afdb0f4731b87 |
| net-vpc | 6ca01160d545235d1e1d3ec967e65dfdffa6c325f9d35629d3ce57a7e5482631 |
| net-vpc-factory | 17af155fd173ad14d79d6f594cade3349e0a355d3bdc7dc6422212b877877965 |
| net-vpc-firewall | c9e8f84bd703fa6566ec37358cd27f3d4c1f8abfcf66fb16e39ff748316d3920 |
| net-firewall-policy | bc883284fe15260e03ad9b3e16d3481105951e4e2b78618c1a37101c4edb5bdf |
| dns | 083b092ee54db1c85ff3dcc4cb18940458bcb09b83724320139946f580124f97 |
| dns-response-policy | 0316337cb978f987afb34d93c5287bfcb0dfe5f6883d7e21ab39b79d2a579b62 |
| net-address | 527b82841b545c15f06a31c5a586c432bd56a21320f47fb685be10a0a55fe154 |
| net-cloudnat | e83c3c4553e070846e904a08092b20923d3f68654ab85d498af40e292d04e96b |
| net-vpn-ha | 03957ac4ed022c817f067086d23450d14846db1e156167f349b6ea2f3fcd6a90 |
| net-vlan-attachment | 081e3fc42ce55063f4fb88eb928d13302775715ad87199068f6f9225e609f469 |
| gcs | 2bde2d550f139314b1b969dfae02450f8fa009071b91b656707ec8bd9b6ba58e |
| kms | 0b18659f318d65e0e13a35a076ef425959805135bc81db280cafa0c439ebab50 |
| logging-bucket | 6d67fa1c8e7096d590f4d377985ee430e2f85edebb180011ce772011be752f58 |
| pubsub | e8c89fbebe9ce816a2a99df372e5c3acb66040e29d7d8caed5a13e707b8e630a |
| bigquery-dataset | 774a589d8dffd723e50b5d75b88e6e9fb444b3c8c0d89f0a6d7295234a688b1e |
| secret-manager | a573561193ee9fc0296a9a3f1c38c01df86663d02a4abb3fefd01fd80a84a962 |

## Added for the landing-zone sketch

Fabric v59.1.0 does not ship these as standalone modules. `ncc-hub` follows `fast/stages/2-networking/factory-ncc.tf` (hub, default group, VPC spokes). `iam-workload-identity-pool` follows the GitHub template in `modules/project/identity-providers-defs.tf`. `ncc-spoke-ra` was not copied: it creates router-appliance spokes, and this landing zone does not use appliances.

| Module | Source inside v59.1.0 | Tree hash |
|---|---|---|
| `ncc-hub` | `fast/stages/2-networking/factory-ncc.tf` | `8fb409eb93d3fe7aa4aa8b3085dbc6f6d15587a7b3db7e03a20cc08a08778762` |
| `iam-workload-identity-pool` | `modules/project/identity-providers.tf`, `identity-providers-defs.tf` | `e179520a9597b8595da8b42287c91a593f5ff94b3a4a9c0cedb760f227adea0d` |
| `naming` | Written here. Not copied from Fabric. Shared project and bucket names for the bootstrap and landing-zone repositories. | n/a |
