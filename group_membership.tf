# Put admin provisioner users in the appropriate group.
resource "aws_iam_user_group_membership" "admin_provisioners" {
  provider = aws.users
  for_each = toset(var.users)

  user = each.key

  groups = [
    aws_iam_group.admin_provisioners.name
  ]
}
