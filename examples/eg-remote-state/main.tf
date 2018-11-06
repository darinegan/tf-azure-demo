module "remote-state" {
  source = "../../modules/storage-container"

  name          = "tfstate-rg"
  sa_name       = "${lower(random_string.sa-name.result)}"
  sa_cntnr_name = "tfstate-sa-cntnr"
}

resource "random_string" "sa-name" {
  length  = 24
  upper   = false
  number  = true
  special = false
}
