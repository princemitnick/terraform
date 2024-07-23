terraform {
  required_providers {
    docker = {
      source="kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}


provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx_server"
  ports {
    internal = 80
    external = 8889
  }
}

resource "docker_image" "mysql" {
  name = "mysql:5.7"
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql_server"
  env = [
    "MYSQL_ROOT_PASSWORD=mysql",
    "MYSQL_DATABASE=mydb",
    "MYSQL_USER=prince",
    "MYSQL_PASSWORD=prince"
  ]
  ports {
    internal = 3306
    external = 3390
  }
}

