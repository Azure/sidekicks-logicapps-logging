resource "azurerm_storage_account" "logicapps" {
    name                     = "stor${var.storageName}logicapps"
    resource_group_name      = var.resourceGroup
    location                 = var.region
    account_tier             = "Standard"
    account_kind             = "StorageV2"
    account_replication_type = "ZRS"  
    allow_blob_public_access = false
    enable_https_traffic_only = true
}

resource "azurerm_storage_container" "logicapps" {
    name                    = "logs"
    container_access_type   = "private"
    storage_account_name    = azurerm_storage_account.logicapps.name
}

output "storageName" {
    value = azurerm_storage_account.logicapps.name
}

output "storageEndpoint" {
    value = azurerm_storage_account.logicapps.primary_blob_endpoint
}

output "storageAccessKey" {
    value = azurerm_storage_account.logicapps.primary_access_key
}