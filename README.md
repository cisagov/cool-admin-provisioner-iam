# cool-admin-provisioner-iam #

[![GitHub Build Status](https://github.com/cisagov/cool-admin-provisioner-iam/workflows/build/badge.svg)](https://github.com/cisagov/cool-admin-provisioner-iam/actions)

This is a Terraform deployment for creating IAM resources for those
users allowed to provision any environment in the COOL.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).
- User accounts for all users must have been created previously.  We
  recommend using the
  [`cisagov/cool-users-non-admin`](https://github.com/cisagov/cool-users-non-admin)
  repository to create users.

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
  variables (see [Inputs](#inputs) below for details):

  ```hcl
  users = [
    "firstname1.lastname1",
    "firstname2.lastname2"
  ]
  ```

1. Run the command `terraform init`.
1. Run the command `terraform apply -var-file=<workspace_name>.tfvars`.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 4.9 |
| aws.users | ~> 4.9 |
| terraform | n/a |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_group.admin_provisioners](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.admin_provisioners](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.provision](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user_group_membership.admin_provisioners](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_caller_identity.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.provision](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_provisioners\_group\_name | The name of the IAM group whose members are allowed to provision any environment. | `string` | `"admin_provisioners"` | no |
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| provision\_policy\_description | The description to associate with the IAM policy in the Users account that allows the admin provisioner group to assume all roles needed in order to provision any environment. | `string` | `"Allows the admin provisioner group to assume all roles needed in order to provision any environment."` | no |
| provision\_policy\_name | The name of the IAM policy in the Users account that allows the admin provisioner group to assume all roles needed in order to provision any environment. | `string` | `"AssumeProvisionAnyEnvironment"` | no |
| provision\_role\_name | The name of the IAM role in an account that includes all permissions necessary to provision the environment in that account.  If this role does not exist in an account, an environment cannot be provisioned in that account. | `string` | `"ProvisionAccount"` | no |
| startstopssmsession\_role\_name | The name of the IAM role in an account that includes all permissions necessary to start and stop an SSM session in that account. | `string` | `"StartStopSSMSession"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| users | A list containing the usernames of users that exist in the Users account who are allowed to provision any environment.  Example: [ "firstname1.lastname1", "firstname2.lastname2" ]. | `list(string)` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| admin\_provisioners\_group | The IAM group whose members are allowed to provision any environment. |
| admin\_provisioners\_policy | The IAM policy in the Users account that allows the admin provisioners group to assume the provisioning role in any account. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is just the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
