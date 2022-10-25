# ------------------------------------------------------------------------------
# Retrieves state data from a Terraform backend. This allows use of
# the root-level outputs of one or more Terraform configurations as
# input data for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "dns_certboto" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-dns-certboto/terraform.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to set up "production" and "staging" remote states.
  workspace = "production"
}

data "terraform_remote_state" "images_parameterstore-production" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-images-parameterstore/terraform.tfstate"
  }

  workspace = "production"
}

data "terraform_remote_state" "images_parameterstore-staging" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-images-parameterstore/terraform.tfstate"
  }

  workspace = "staging"
}

data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/master.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  # There is only one environment for this account, so there is
  # no need to set up "production" and "staging" remote states.
  workspace = "production"
}

data "terraform_remote_state" "terraform" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/terraform.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  # There is only one environment for this account, so there is
  # no need to set up "production" and "staging" remote states.
  workspace = "production"
}

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
