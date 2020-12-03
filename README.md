# Sidekicks: LogicApps Logging
This _Sidekick_ exposes an HTTP endpoint via LogicApps. The JSON payload of the POST request is then written to Azure Storage log files with a datetime stamp. This enables log aggregators (e.g. SIEM tools) to download these files. The log files are written in 1-minute increments.

## Configuration
This _Sidekick_ utilizes Terraform and requires a minimum version of v0.14.0.

The required Terraform variables are as follows:

| Variable | Description |
| -------- | ----------- |
| subscriptionId        | The unique id of the Azure subscription |
| tenantId              | The unique id of the Azure tenant |
| region                | The targeted region for deployment (e.g. eastus, uksouth, brazilsouth, etc.) |
| resourceGroup         | Name of the targeted resource group (must be a new group) |
| storageName           | Name of the storage account to create for the logs |
| blobConnectionName    | Name of the LogicApps API connection |
| logicappName          | Name of the LogicApp to create |

> **NOTE:** Terraform will output the _logicAppUrl_ which will be the URL of the HTTP Trigger for the Logic App.

## Sidekicks
_Sidekicks_ are projects built for real customers with real scenarios. Microsoft's Customer Success Unit works with customers to facilitate their adoption of the cloud and remove any potential barriers. Through working with various customers, we have recognized that many customers struggle with the same pain points. The _Sidekicks_ initiative is a collection of projects that have empowered customers to move forward in their cloud journeys. 

All _Sidekick_ projects have been generalized and customer-specific data has been removed. _Sidekicks_ are provided without warranty and without support.
## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
