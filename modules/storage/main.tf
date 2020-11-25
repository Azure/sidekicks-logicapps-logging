resource "azurerm_storage_account" "logicapps" {
    name                     = "stor${var.storageName}logicapps"
    resource_group_name      = var.resourceGroup
    location                 = var.region
    account_tier             = "Standard"
    account_kind             = "StorageV2"
    account_replication_type = "ZRS"  
    enable_https_traffic_only = true
}

output "storageEndpoint" {
    value = azurerm_storage_account.logicapps.primary_blob_endpoint
}

output "storageAccessKey" {
    value = azurerm_storage_account.logicapps.primary_access_key
}