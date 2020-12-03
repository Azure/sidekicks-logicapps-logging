terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=2.33.0"
        }
        null = {
            source  = "hashicorp/null"
            version = "~>2.1"
        }
    }
}

provider "azurerm" {
    subscription_id = var.subscriptionId
    tenant_id       = var.tenantId
    features {}
}

provider "null" {
}

module "resourceGroup" {
    source          = "./modules/resourceGroup"
    region          = var.region
    resourceGroup   = var.resourceGroup
}

module "storage" {
    source          = "./modules/storage"
    region          = var.region
    resourceGroup   = module.resourceGroup.resourceGroupName
    storageName     = var.storageName
}

module "armTemplate" {
    source              = "./modules/armTemplate"
    region              = var.region
    resourceGroup       = var.resourceGroup
    storageName         = module.storage.storageName
    storageAccessKey    = module.storage.storageAccessKey
    blobConnectionName  = var.blobConnectionName
    logicappName        = var.logicappName
}

output "logicAppUrl" {
    value = module.armTemplate.logicAppUrl
}