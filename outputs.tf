output "admin_provisioners_group" {
  description = "The IAM group whose members are allowed to provision any environment."
  value       = aws_iam_group.admin_provisioners
}

output "admin_provisioners_policy" {
  description = "The IAM policy in the Users account that allows the admin provisioners group to assume the provisioning role in any account."
  value       = aws_iam_policy.provision
}
