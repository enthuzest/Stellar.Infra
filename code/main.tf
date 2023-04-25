locals {
  application_name = "stellar"
  application_name_with_sub_environment = "${local.application_name}-${var.sub_environment}"

  app_settings = {
   APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.appi.instrumentation_key
   WEBSITE_RUN_FROM_PACKAGE  = 1
  }
}

data "azurerm_service_plan" "asp"{
    name                 = var.environment == "nprd" ? "zentral-nprd-asp" : "zentral-prd-asp"
    resource_group_name  = var.environment == "nprd" ? "zentral-nprd-rg" : "zentral-prd-rg"
}

resource "azurerm_resource_group" "primary_rg" {
  name     = "${local.application_name_with_sub_environment}-rg"
  location = var.location
}
