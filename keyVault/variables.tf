variable "resource_group_name" {
  description = "Resource Group name to host keyvault"
  type        = string
}

variable "keyvault_location" {
  description = "key vault location"
  type        = string
}


variable "keyvault_tenant_id" {
  description = "the tenant id of service principal who is creating the keyvault"
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

variable "keyvault_applicationInsights_ConnectionString" {
  description = "Application Insights connection string"
  type        = string
}

variable "keyvault_applicationInsights_InstrumentationKey" {
  description = "Application Insights Instrumentation key"
  type        = string
}


