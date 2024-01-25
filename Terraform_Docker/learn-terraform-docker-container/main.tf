terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
}

# In terminal type each command below in sequence
# - terraform init
# - terraform fmt
# - terraform validate
# - terraform apply
# - terraform show
# - terraform state
# - terraform state list


# Change ports external value to 8080
# In terminal type each command below in sequence
# - terraform init
# - terraform apply
# - terraform destroy