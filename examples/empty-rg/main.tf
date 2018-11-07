module "empty-rg" {
  source = "../../modules/empty-resource-group"

  name = "${random_string.rg-name.result}"
}

resource "random_string" "rg-name" {
  length  = 80
  upper   = true
  lower   = true
  number  = true
  special = false
}
