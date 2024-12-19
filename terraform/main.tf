terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}

provider "docker" {
  host = "unix:///Users/jeffryrodriguez/Library/Containers/com.docker.docker/Data/docker-cli.sock"
}

resource "docker_image" "node_app" {
  name         = "jeffrood/node-app:latest"
  keep_locally = false
}

resource "docker_image" "python_app" {
  name         = "jeffrood/python-app:latest"
  keep_locally = false
}

resource "docker_container" "node_app" {
  name  = "node_app_container"
  image = docker_image.node_app.name
  ports {
    internal = 3000
    external = 3000
  }
}

resource "docker_container" "python_app" {
  name  = "python_app_container"
  image = docker_image.python_app.name
  ports {
    internal = 5000
    external = 5000
  }
}
