provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "michalExample" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "michalExample" {
  name                     = "michalstorageaccount"
  resource_group_name      = azurerm_resource_group.michalExample.name
  location                 = azurerm_resource_group.michalExample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "michalExample" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "michalExample" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.michalExample.id
  storage_account_name       = azurerm_storage_account.michalExample.name
  storage_account_access_key = azurerm_storage_account.michalExample.primary_access_key
}
 
resource "azurerm_function_app_function" "michalExample" {
  name                     = var.function_name
  resource_group_name      = var.resource_group_name
  function_app_id          = azurerm_function_app.michalExample.id
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
  }
  file_system {
    name = "Sample"
    script_blob = "sample"
  }
}
