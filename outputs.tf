# output "function_app_id" {
#   value = azurerm_linux_function_app.employee_function.id
# }

# output "function_app_default_hostname" {
#   value = azurerm_linux_function_app.employee_function.default_hostname
# }

# output "principal_id" {
#   description = "The Service Principal / Managed Identity Object ID of the Function App"
#   value       = azurerm_linux_function_app.employee_function.identity[0].principal_id
# }

output "function_app_name" {
  value = azurerm_linux_function_app.this.name
}

output "function_app_id" {
  value = azurerm_linux_function_app.this.id
}

output "principal_id" {
  value = azurerm_linux_function_app.this.identity[0].principal_id
}

output "default_hostname" {
  value = azurerm_linux_function_app.this.default_hostname
}

output "app_insights_instrumentation_key" {
  value     = azurerm_application_insights.app_insights.instrumentation_key
  sensitive = true
}
