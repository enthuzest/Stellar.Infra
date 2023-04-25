module "backend-func-app"{
    source              = "github.com/faraz841/Zentral/modules/function-app"
    function_app_name   = local.application_name_with_sub_environment
    resource_group_name = azurerm_resource_group.primary_rg.name
    app_service_plan_id = data.azurerm_service_plan.asp.id
    location            = azurerm_resource_group.primary_rg.location
    app_settings        = local.app_settings
    tags                = var.tags
}