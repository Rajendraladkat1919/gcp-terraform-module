# naming

Names shared by `gcp-foundation-bootstrap` and `gcp-infrastructure-lz`. Creates nothing.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | ~> 1.16.6 |

## Providers

No providers.

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| prefix | Short organization prefix used in every project id and bucket name, for example demo. Lowercase letters and digits, 2 to 10 characters. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| automation\_service\_account\_emails | Email of the Terraform executor, keyed by execute. The account id is dev-terraform-execute in the iac-core project. |
| automation\_service\_account\_ids | Account id (the part before the @) of the Terraform executor. The only key is execute. |
| core\_project\_ids | Project id of each org-level core project, keyed by iac\_core, billing, logging. |
| core\_project\_names | Project name (without prefix) of each org-level core project. |
| environments | Environment short code and folder display name, keyed by prod and nonprod. |
| hub\_project\_id | Project id of the network hub project. |
| hub\_project\_name | Project name (without prefix) of the network hub project. |
| iac\_core\_project\_id | Project id of the iac-core project that hosts the automation identities and is billed for API usage. |
| network\_project\_ids | Project id of the hub and of each Shared VPC host, keyed by hub, prod and nonprod. |
| network\_project\_names | Project name (without prefix) of the hub and of each Shared VPC host. |
| spoke\_project\_ids | Project id of the spoke (Shared VPC host) project of each environment. |
| spoke\_project\_names | Project name (without prefix) of the spoke project of each environment. |
| state\_bucket\_full\_names | Full GCS bucket names of the Terraform state buckets. |
| state\_bucket\_names | Bucket name suffixes (the gcs module adds the prefix). |
<!-- END_TF_DOCS -->
