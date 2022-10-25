# The policy document that allows assumption of all roles needed in order to
# provision any environment.
data "aws_iam_policy_document" "provision" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:iam::*:role/${var.provision_role_name}",
      "arn:aws:iam::*:role/${var.startstopssmsession_role_name}",
    ]

    sid = "AllowAllAccountRoles"
  }

  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    effect = "Allow"

    resources = local.additional_required_roles

    sid = "AllowAdditionalRequiredRoles"
  }
}

# The policy that allows assumption of all roles needed in order to provision
# assessment environments.
resource "aws_iam_policy" "provision" {
  provider = aws.users

  description = var.provision_policy_description
  name        = var.provision_policy_name
  policy      = data.aws_iam_policy_document.provision.json
}
