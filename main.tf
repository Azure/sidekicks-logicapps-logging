provider "azurerm" {
    version = "=2.33.0"
    subscription_id = var.subscriptionId
    tenant_id = var.tenantId
    features {}
}

provider "null" {
    version = "~>2.1"
}

module "resourceGroup" {
    source = "./modules/resourceGroup"
    region = var.region
    resourceGroup = var.resourceGroup
}

module "storage" {
    source = "./modules/storage"
    resourceGroup = var.resourceGroup
    storageName = var.storageName
}