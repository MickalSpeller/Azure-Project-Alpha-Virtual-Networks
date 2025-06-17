# Azure Project ALPHA : Multi-Tier Azure VNet w/ NGSs and VM Segmentation



# Project Scope
Deployed a secure multi-tier architecture in Azure using VNETS, Subnets and NSGs, and VMs to simulate enterprise-level network segmentation in Azure Cloud.

# Deployment Ojbecives
To simulate real world, production style clould envioronments with subnet isolation and access control, while practicing virtual network design and Azure firewall principles.

# Technologies Used 
| Resource | Description |
|----------|-------------|
| `Virtual Network` | Hub and spoke VNets with non-overlapping CIDRs |
| `Subnet(s)` | Separate subnets for workload, management, etc. |
| `VNet Peering` | Fully-meshed connections with correct flags |
| `Route Tables` | Custom UDRs to route traffic via hub |
| `NSGs` | Applied per subnet for fine-grained control |
| `Azure Bastion` *(optional)* | For secure, jump-box-free RDP/SSH access |
 

# Architecture Overview
![azure-vnet-topology](https://github.com/user-attachments/assets/9447f223-d0c0-4b38-b604-4076ad780669)  
2 Virtual Networks  
4 total subnets -- two subnets in each virtual network  
1 Network Peering  
2 NSG  
3 Virtual Machines  

# Network Security Configurations
Configured NSGs to block unauthorized movement between subnets  
Used Azure Bastion to eliminate public IP exposure  
Role-based access control (RBAC) configured for resource-level permissions  

# Outcome & Results
Successfully segmented traffic between subnets using custom NSG rules  
Validated traffic flow using ping and Azure Network Watcher  
Gained real-world understanding of zero-trust networking in cloud environments

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


# Additional Resources  
Bicep Documentation  
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/  




