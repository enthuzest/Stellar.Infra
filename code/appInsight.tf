resource "azurerm_application_insights" "appi" {
  name                = "${local.application_name_with_sub_environment}-appi"
  location            = azurerm_resource_group.primary_rg.location
  resource_group_name = azurerm_resource_group.primary_rg.name
  application_type    = "web"
}