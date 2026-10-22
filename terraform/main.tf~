terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name = "ghcr.io/${var.github_user}/devops-portfolio:${var.image_tag}"
}

resource "docker_container" "app" {
  name  = "portfolio"
  image = docker_image.app.image_id
  env   = ["APP_VERSION=${var.image_tag}"]

  ports {
    internal = 8000
    external = var.host_port
  }

  healthcheck {
    test     = ["CMD", "python", "-c", "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')"]
    interval = "30s"
    timeout  = "5s"
    retries  = 3
  }
}
