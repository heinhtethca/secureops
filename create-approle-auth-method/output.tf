output "db_role_id" {
    description = "rold-id-for-db"
    value = vault_approle_auth_backend_role.db_role.role_id
  
}

output "db_secret_id" {
    description = "secret-id-for-db"
    value = vault_approle_auth_backend_role_secret_id.db_secret_id.secret_id
    sensitive = true
  
}