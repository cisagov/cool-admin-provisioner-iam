# An IAM group for admin provisioners.
resource "aws_iam_group" "admin_provisioners" {
  provider = aws.users

  name = var.admin_provisioners_group_name
}

# Attach the policy that allows assumption of the provisioners role.
resource "aws_iam_group_policy_attachment" "admin_provisioners" {
  provider = aws.users

  group      = aws_iam_group.admin_provisioners.name
  policy_arn = aws_iam_policy.provision.arn
}
