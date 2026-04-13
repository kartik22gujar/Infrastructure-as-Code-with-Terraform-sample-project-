
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
	host = "unix:///var/run/docker.sock"
 }

# Pull Docker image
resource "docker_image" "nginx_image" {
  name = var.image_name
}

# Create Docker container
resource "docker_container" "nginx_container" {
  name  = var.container_name
  image = docker_image.nginx_image.image_id

  ports {
    internal = 80
    external = var.external_port
  }
}
