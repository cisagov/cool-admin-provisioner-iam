# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "users" {
  type        = list(string)
  description = "A list containing the usernames of users that exist in the Users account who are allowed to provision any environment.  Example: [ \"firstname1.lastname1\", \"firstname2.lastname2\" ]."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "admin_provisioners_group_name" {
  type        = string
  description = "The name of the IAM group whose members are allowed to provision any environment."
  default     = "admin_provisioners"
}

variable "provision_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy in the Users account that allows the admin provisioner group to assume all roles needed in order to provision any environment."
  default     = "Allows the admin provisioner group to assume all roles needed in order to provision any environment."
}

variable "provision_policy_name" {
  type        = string
  description = "The name of the IAM policy in the Users account that allows the admin provisioner group to assume all roles needed in order to provision any environment."
  default     = "AssumeProvisionAnyEnvironment"
}

variable "provision_role_name" {
  type        = string
  description = "The name of the IAM role in an account that includes all permissions necessary to provision the environment in that account.  If this role does not exist in an account, an environment cannot be provisioned in that account."
  default     = "ProvisionAccount"
}

variable "startstopssmsession_role_name" {
  type        = string
  description = "The name of the IAM role in an account that includes all permissions necessary to start and stop an SSM session in that account."
  default     = "StartStopSSMSession"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
