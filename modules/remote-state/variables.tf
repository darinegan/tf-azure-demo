# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "location" {
  description = "The location of the resource group."
  default     = "westus"
}

variable account_tier {
  description = "The tier of the storage account."
  default     = "Standard"
}

variable account_replication_type {
  description = "The type of replication used for the storage account."
  default     = "LRS"
}
