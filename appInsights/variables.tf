variable "application_insights_name" {
  description = "Application insight name"
  type        = string
}

variable "application_insights_location" {
  description = "azure location for app insights"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name for app insights"
  type        = string
}

variable "application_type" {
  type    = string
  default = "web"
}
