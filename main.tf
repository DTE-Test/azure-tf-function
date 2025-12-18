resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

# Storage Account (must be globally unique)
resource "azurerm_storage_account" "function_storage" {
  name                     = substr("${var.storage_account_prefix}${random_integer.suffix.result}", 0, 24)
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Application Insights
resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

# App Service Plan (Linux Consumption Plan, works on Free / Student)
resource "azurerm_service_plan" "function_plan" {
  name                = "${var.function_app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type   = "Linux"
  sku_name = "Y1"   # Consumption (FREE tier eligible)
}


# Linux Function App
resource "azurerm_linux_function_app" "employee_function" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key
  functions_extension_version = "~4" 

  site_config {
    application_stack {
      node_version = "18"
    }

    always_on = false
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = "node"
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights.instrumentation_key
    CosmosDBConnectionString       = var.cosmos_db_connection_string
    ENVIRONMENT                    = var.environment
  }
}


# Outputs
output "app_insights_instrumentation_key" {
  value = azurerm_application_insights.app_insights.instrumentation_key
}

output "function_app_name" {
  value = azurerm_linux_function_app.employee_function.name
}

output "function_app_url" {
  value = azurerm_linux_function_app.employee_function.default_hostname
}
