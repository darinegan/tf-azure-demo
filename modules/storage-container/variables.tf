# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "name" {
  description = "The name of the resource group."
}

variable "sa_name" {
  description = "The name of the storage account."
}

variable "sa_cntnr_name" {
  description = "The name of the storage container."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "location" {
  description = "The location of the resource group."
  default     = "westus"
}

variable "sa_tier" {
  description = "The tier of the storage account."
  default     = "Standard"
}

variable "sa_replication_type" {
  description = "The type of replication used for the storage account."
  default     = "LRS"
}
