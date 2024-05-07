# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "users" {
  description = "A list containing the usernames of users that exist in the Users account who are allowed to provision any environment.  Example: [ \"firstname1.lastname1\", \"firstname2.lastname2\" ]."
  type        = list(string)
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  type        = string
}

variable "admin_provisioners_group_name" {
  default     = "admin_provisioners"
  description = "The name of the IAM group whose members are allowed to provision any environment."
  type        = string
}

variable "provision_policy_description" {
  default     = "Allows the admin provisioner group to assume all roles needed in order to provision any environment."
  description = "The description to associate with the IAM policy in the Users account that allows the admin provisioner group to assume all roles needed in order to provision any environment."
  type        = string
}

variable "provision_policy_name" {
  default     = "AssumeProvisionAnyEnvironment"
  description = "The name of the IAM policy in the Users account that allows the admin provisioner group to assume all roles needed in order to provision any environment."
  type        = string
}

variable "provision_role_name" {
  default     = "ProvisionAccount"
  description = "The name of the IAM role in an account that includes all permissions necessary to provision the environment in that account.  If this role does not exist in an account, an environment cannot be provisioned in that account."
  type        = string
}

variable "startstopssmsession_role_name" {
  default     = "StartStopSSMSession"
  description = "The name of the IAM role in an account that includes all permissions necessary to start and stop an SSM session in that account."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  type        = map(string)
}
