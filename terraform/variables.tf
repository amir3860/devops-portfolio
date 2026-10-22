variable "github_user" {
  type = string
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "host_port" {
  type    = number
  default = 8001
}
