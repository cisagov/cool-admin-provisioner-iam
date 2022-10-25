# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which Terraform is
# authorized.  This is used to calculate the session names for assumed roles.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "default" {}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Extract the user name of the current caller for use
  # as assume role session names.
  caller_user_name = split("/", data.aws_caller_identity.default.arn)[1]

  # Assumption of the following additional roles is required to successfully
  # provision environments.
  additional_required_roles = [
    data.terraform_remote_state.dns_certboto.outputs.provisioncertificatereadroles_role.arn,
    data.terraform_remote_state.images_parameterstore-production.outputs.parameterstorereadonly_role.arn,
    data.terraform_remote_state.images_parameterstore-production.outputs.provisionparameterstorereadroles_role.arn,
    data.terraform_remote_state.images_parameterstore-staging.outputs.parameterstorereadonly_role.arn,
    data.terraform_remote_state.images_parameterstore-staging.outputs.provisionparameterstorereadroles_role.arn,
    data.terraform_remote_state.master.outputs.organizationsreadonly_role.arn,
    data.terraform_remote_state.terraform.outputs.access_terraform_backend_role.arn
  ]
}
