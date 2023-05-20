module "test" {
  source     = "./modules/environment"
  env_name   = "test_env"
  mongo_root_user = "admin"
  mongo_root_password = var.mongo_root_password
}

