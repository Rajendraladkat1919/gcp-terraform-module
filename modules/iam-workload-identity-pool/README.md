# GitHub Workload Identity pool

One Workload Identity pool and a GitHub Actions OIDC provider. `gcp-foundation-bootstrap` calls this from `demo-pr-iac-core`. The attribute mapping is the GitHub template from Cloud Foundation Fabric v59.1.0 `modules/project/identity-providers-defs.tf`.

Bind `roles/iam.workloadIdentityUser` on each automation service account with `iam-service-account`. The member is `principalSet://iam.googleapis.com/${module.github_oidc.pool_name}/attribute.repository/ORG/REPO`.

```hcl
module "github_oidc" {
  source     = "../../iam-workload-identity-pool"
  project_id = "demo-pr-iac-core"
  pool_id    = "github"

  attribute_condition = "assertion.repository_owner == 'demo'"
}
```

`cicd-runners` uses this same pool. It does not create a second pool.
