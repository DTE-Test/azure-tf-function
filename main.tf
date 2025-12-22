resource "azurerm_service_plan" "plan" {
  name                = "${var.name}-${var.environment}-plan"
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = "Y1"
  os_type             = "Linux"
}

resource "azurerm_storage_account" "func_storage" {
  name                     = "${var.name}funcsa"
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_linux_function_app" "func" {
  name                = "${var.name}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.plan.id
  storage_account_name = azurerm_storage_account.func_storage.name
  storage_account_access_key = azurerm_storage_account.func_storage.primary_access_key


  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    COSMOS_ENDPOINT          = var.cosmos_endpoint
  COSMOS_KEY       = var.cosmos_key
  COSMOS_DATABASE  = var.cosmos_database
  COSMOS_CONTAINER = "${var.cosmos_container}-container"
    FUNCTIONS_WORKER_RUNTIME = "node"
   # WEBSITE_RUN_FROM_PACKAGE = "1"
  }

  site_config {
    always_on = false

    application_stack {
      node_version = "22"
    }
  }
  # depends_on = [
  #   azurerm_private_endpoint.cosmos_pe,
  #   azurerm_private_dns_zone_virtual_network_link.vnet_link
  # ]
}