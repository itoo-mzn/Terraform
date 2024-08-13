terraform {
  # 扱うリソースのプロバイダーと、そのバージョンを指定
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    # コンテナ内部でnginxが使っているポート
    internal = 80
    # コンテナ外部から通信を受け付けるポート
    external = 8000
  }
}
