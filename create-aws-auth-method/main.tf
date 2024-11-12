resource "vault_auth_backend" "vault_auth_aws" {
  type = "aws"

}

resource "vault_aws_auth_backend_client" "vault_auth_aws" {
  backend    = vault_auth_backend.vault_auth_aws.path
  access_key = aws_iam_access_key.vault_auth_admin.id
  secret_key = aws_iam_access_key.vault_auth_admin.secret
}

resource "vault_policy" "db_policy" {
  name = "db-policy"

  policy = <<EOT
path "auth/token/lookup-self" {
  capabilities = ["read"]
}
# Allow tokens to renew themselves
path "auth/token/renew-self" {
    capabilities = ["update"]
}
# Allow tokens to revoke themselves
path "auth/token/revoke-self" {
    capabilities = ["update"]
}
path "db/" {
  capabilities = ["read","list"]
}
path "db/*" {
  capabilities = ["read","list"]
}
path "aws-master/" {
  capabilities = ["read","list"]
}
path "aws-master/*" {
  capabilities = ["read","list"]
}
EOT
}


resource "vault_aws_auth_backend_role" "vault_aws_auth_role" {
  backend                         = vault_auth_backend.vault_auth_aws.path
  role                            = "test-role"
  auth_type                       = "iam"
  bound_iam_principal_arns        = [aws_iam_role.vault_auth_aws_role.arn]
  token_ttl                       = 300
  token_max_ttl                   = 300
  token_policies                  = [vault_policy.db_policy.name]
}