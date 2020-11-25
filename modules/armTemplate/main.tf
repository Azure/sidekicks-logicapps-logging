resource "azurerm_template_deployment" "logicApps" {
    name                    = "logicAppsTerraform"
    resource_group_name     = var.resourceGroup
    deployment_mode = "Incremental"
    parameters = {
        "storageAccountName" = "terraformarm"
        "storageAccountType" = "Standard_LRS"
    }

    template_body = file("template.json")
}