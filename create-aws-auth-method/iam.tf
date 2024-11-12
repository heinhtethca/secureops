#create vault auth admin
resource "aws_iam_user" "vault_auth_admin" {
  name = "vault-auth-admin"
  path = "/"

  tags = {
    name = "vault-auth-admin"
  }
}

resource "aws_iam_access_key" "vault_auth_admin" {
  user = aws_iam_user.vault_auth_admin.name
}

data "aws_iam_policy_document" "vault_auth_policy" {
  statement {
    sid    = "VaultAWSAuthMethod"
    effect = "Allow"
    actions = [
        "ec2:DescribeInstances",
        "iam:GetInstanceProfile",
        "iam:GetUser",
        "iam:ListRoles",
        "iam:GetRole"
     ]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "vault_auth_policy" {
  name   = "vault_auth_policy"
  user   = aws_iam_user.vault_auth_admin.name
  policy = data.aws_iam_policy_document.vault_auth_policy.json
}

resource "aws_iam_role" "vault_auth_aws_role" {
  name               = "vault_auth_aws_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json # (not shown)

}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_instance_profile" "vault-client" {
  name = "instead-profile-role"
  role = aws_iam_role.vault_auth_aws_role.id
}