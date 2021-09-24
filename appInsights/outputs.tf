output "application_insights_instrumentation_key" {
  description = "The Instrumentation Key for this Application Insights component"
  value       = azurerm_application_insights.application_insights.instrumentation_key
  sensitive   = true
}

output "application_insights_app_id" {
  description = "The App ID associated with this Application Insights component."
  value       = azurerm_application_insights.application_insights.app_id
}

output "application_insights_connection_string" {
  description = "The Connection String for this Application Insights component"
  value       = azurerm_application_insights.application_insights.connection_string
  sensitive   = true
}