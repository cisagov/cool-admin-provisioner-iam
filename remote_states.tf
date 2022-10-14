# ------------------------------------------------------------------------------
# Retrieves state data from a Terraform backend. This allows use of
# the root-level outputs of one or more Terraform configurations as
# input data for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/users.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to set up "production" and "staging" remote states.
  workspace = "production"
}
