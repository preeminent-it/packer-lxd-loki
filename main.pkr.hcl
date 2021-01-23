// Image
source "lxd" "main" {
  image        = "${var.source.image}"
  output_image = "${var.source.name}"
  publish_properties = {
    description = "${var.source.description}"
  }
}

// Build
build {
  sources = ["source.lxd.main"]

  // Create directories for Loki
  provisioner "shell" {
    inline = [
      "mkdir -p /etc/loki/tls ${var.loki_home}"
    ]
  }

  // Create Loki system user
  provisioner "shell" {
    inline = [
      "useradd --system --home ${var.loki_home} --shell /bin/false ${var.loki_user}"
    ]
  }

  // Install loki
  provisioner "shell" {
    inline = [
      "curl -sLO https://github.com/grafana/loki/releases/download/v${var.loki_version}/loki-linux-amd64.zip &&",
      "unzip loki-linux-amd64.zip loki-linux-amd64 && mv loki-linux-amd64 /usr/local/bin/loki &&",
      "rm loki-linux-amd64.zip"
    ]
  }

  // Add Loki config
  provisioner "file" {
    source      = "files/etc/loki"
    destination = "/etc/"
  }

  // Add Loki service
  provisioner "file" {
    source      = "files/etc/systemd/system/loki.service"
    destination = "/etc/systemd/system/loki.service"
  }

  // Set file ownership and enable the service
  provisioner "shell" {
    inline = [
      "chown -R ${var.loki_user}: /etc/loki ${var.loki_home}",
      "systemctl enable loki"
    ]
  }
}
