locals {
  application_name = "stellar"
  application_name_with_sub_environment = "${local.application_name}-${var.sub_environment}"

  app_settings = {
   WEBSITE_RUN_FROM_PACKAGE  = 1
  }
}

resource "azurerm_resource_group" "primary_rg" {
  name     = "${local.application_name_with_sub_environment}-rg"
  location = var.location
}

data "azurerm_service_plan" "asp"{
    name                 = var.environment == "nprd" ? "zentral-nprd-asp" : "zentral-prd-asp"
    resource_group_name  = var.environment == "nprd" ? "zentral-nprd-rg" : "zentral-prd-rg"
}

module "backend-func-app"{
    source              = "github.com/faraz841/Zentral/modules/function-app"
    function_app_name   = local.application_name_with_sub_environment
    resource_group_name = azurerm_resource_group.primary_rg.name
    app_service_plan_id = data.azurerm_service_plan.asp.id
    location            = azurerm_resource_group.primary_rg.location
    app_settings        = local.app_settings
    tags                = var.tags
}