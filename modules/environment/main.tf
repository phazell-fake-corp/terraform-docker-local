terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

# Networks
resource "docker_network" "env" {
  name = var.env_name
}

# Volumes
resource "docker_volume" "mongo_vol" {
  name = "mongo_vol"
}

# Containers
resource "docker_container" "mongo" {
  image        = "mongo:5.0"
  name         = "${var.env_name}_mongo"
  network_mode = docker_network.env.name
  hostname = "${var.env_name}_mongo"
  ports {
    internal = 27017
    external = 27017
  }
  env = [
    "MONGO_INITDB_ROOT_USERNAME=${var.mongo_root_user}", 
    "MONGO_INITDB_ROOT_PASSWORD=${var.mongo_root_password}",
    "MONGO_INITDB_DATABASE='fake-corp'"
  ]
  volumes {
    container_path  = "/docker-entrypoint-initdb.d/mongo-init.sh"
    read_only = true
    host_path = "/Users/user1/fake-corp/terraform-docker-local/mongo-init.sh"
    volume_name = "mongo_vol"
  }
}


