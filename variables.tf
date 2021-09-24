variable "resource_group_name" {
  description = "Resource Group name to host keyvault"
  type        = string
}

variable "resource_group_location" {
  description = "resource group location"
  type        = string
}

variable "keyvault_name" {
  description = "Key vault name"
  type        = string
}

variable "keyvault_owner_identifiers" {
  description = "object ids to be added with owner permissions as keyvault policy"
  type        = string
}

variable "application_insights_name" {
  description = "Application insight name"
  type        = string
}
