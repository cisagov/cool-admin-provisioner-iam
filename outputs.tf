output "admin_provisioners_group" {
  value       = aws_iam_group.admin_provisioners
  description = "The IAM group whose members are allowed to provision any environment."
}

output "admin_provisioners_policy" {
  value       = aws_iam_policy.provision
  description = "The IAM policy in the Users account that allows the admin provisioners group to assume the provisioning role in any account."
}
