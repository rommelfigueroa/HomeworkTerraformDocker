terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.container.name
  ports {
    internal = 80
    external = 8000
  }
}

# In terminal type each command below in sequence
# - terraform init
# - terraform apply
# - docker ps
# - terraform destroy