# Azure Project ALPHA : Virtual Network
Welcome. The purpose of this series of projects (Project ALPHA) is to document my run-throughs with some of the core Azure services as it relates to configurations and deployments using Azure CLI and Bicep and Terraform. These deplyoments are conidered foundational level to gain understanding and familiarity with deploying these resources.

Download this repo to obtain all configuration files in this project.

# Project Scope
In this project, I deployed the following:

2 Virtual Networks  
4 total subnets -- two subnets in each virtual network
1 Network Peering

# Setup
To complete this project, it is recommended to have the following tools available:

Azure Account  
Visual Studio Code w/Bicep extension installed  
Azure CLI  
Terraform  

Checkout the Resources Section for download links to these tools.

# Code Snippets

The following code is used to deploy the resources at the Azure Subscription level:
```bicep
targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: 'rg-mks-dev'
  location: 'eastus'
}
```

The following is a list of resources I used to build and test this deployment.
