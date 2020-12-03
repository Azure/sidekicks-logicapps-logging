resource "azurerm_template_deployment" "logicApps" {
    name                    = "logicAppsTerraform"
    resource_group_name     = var.resourceGroup
    deployment_mode = "Incremental"
    parameters = {
        "blobAccessKey"         = var.storageAccessKey
        "blobAccountName"       = var.storageName
        "blobConnectionName"    = var.blobConnectionName
        "logicappName"          = var.logicappName
        "region"                = var.region
    }

    template_body = file("./artifacts/azurerm_template.json")
}