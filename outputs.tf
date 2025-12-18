output "function_app_id" {
  value = azurerm_linux_function_app.employee_function.id
}

output "function_app_default_hostname" {
  value = azurerm_linux_function_app.employee_function.default_hostname
}

output "principal_id" {
  description = "The Service Principal / Managed Identity Object ID of the Function App"
  value       = azurerm_function_app.example.identity[0].principal_id
}
