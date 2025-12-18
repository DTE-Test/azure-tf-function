output "function_app_id" {
  value = azurerm_linux_function_app.employee_function.id
}

output "function_app_default_hostname" {
  value = azurerm_linux_function_app.employee_function.default_hostname
}
