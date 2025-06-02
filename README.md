# Azure Project ALPHA : Multi-Tier Azure VNet With NGSs and VM Segmentation



# Project Scope
Deployed a secure multi-tier architecture in Azure using VNETS, Subnets and NSGs, and VMs to simulate enterprise-level network segmentation in Azure Cloud.

# Deployment Ojbecives
To simulate real world, production style clould envioronments with subnet isolation and access control, while practicing virtual network design and Azure firewall principles.

# Technologies Implemented
Virtual Networks / Subnets
Network Peering
Virtual Machines
Network Security Groups
Visual Studio Code w/Bicep extension installed  
Azure CLI  
Terraform  

# Architecture Overview
2 Virtual Networks
4 total subnets -- two subnets in each virtual network 
1 Network Peering
2 NSG 
3 Virtual Machines

# Notable Code Snippets
The following code is used to deploy the resources at the Azure Subscription level:
```bicep
targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: 'rg-mks-dev'
  location: 'eastus'
}
```
The following is a list of resources I used to build and test this deployment.

# Network Security Configurations
Configured NSGs to block unauthorized movement between subnets
Used Azure Bastion to eliminate public IP exposure
Role-based access control (RBAC) configured for resource-level permissions

# Additional Resources
