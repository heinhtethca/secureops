resource "vault_auth_backend" "tfc_approle" {
  type = "approle"
  
}

resource "vault_policy" "db_secret_policy" {
  name = "db-secret-policy"

  policy = <<EOT
path "db/" {
  capabilities = ["read","list"]
}
path "db/*" {
  capabilities = ["read","list"]
}
path "auth/token/create" 
{
  capabilities = ["update"]
}
EOT
}

resource "vault_approle_auth_backend_role" "db_role" {
  backend        = vault_auth_backend.tfc_approle.path
  role_name      = "db-role"
  token_policies = [vault_policy.db_secret_policy.name]
  token_ttl = 600
  token_max_ttl = 1200
}

resource "vault_approle_auth_backend_role_secret_id" "db_secret_id" {
  backend   = vault_auth_backend.tfc_approle.path
  role_name = vault_approle_auth_backend_role.db_role.role_name

}