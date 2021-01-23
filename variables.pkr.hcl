variable "source" {
  type = map(string)
  default = {
    description = "Loki - Ubuntu 20.04"
    image       = "base-ubuntu-focal"
    name        = "loki-ubuntu-focal"
  }
}

variable "loki_home" {
  type    = string
  default = "/opt/loki"
}

variable "loki_version" {
  type    = string
  default = "2.1.0"
}

variable "loki_user" {
  type    = string
  default = "loki"
}
