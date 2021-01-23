# Packer LXD - Loki

## Build
```bash
packer build .
```

## Requirements

* packer 1.6.6 (or earlier supporting hcl2)
* a working lxd installation

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| loki\_home | n/a | `string` | `"/opt/loki"` | no |
| loki\_user | n/a | `string` | `"loki"` | no |
| loki\_version | n/a | `string` | `"2.1.0"` | no |
| source | n/a | `map(string)` | <pre>{<br>  "description": "Loki - Ubuntu 20.04",<br>  "image": "base-ubuntu-focal",<br>  "name": "loki-ubuntu-focal"<br>}</pre> | no |
