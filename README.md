# Azure Project ALPHA : Multi-Tier Azure VNet w/ NGSs and VM Segmentation



# Project Scope
Deployed a secure multi-tier architecture in Azure using VNETS, Subnets and NSGs, and VMs to simulate enterprise-level network segmentation in Azure Cloud.

# Deployment Ojbecives
This infrastructure-as-code solution deploys:
- A **hub virtual network** with shared resources like a Bastion host or firewall
- Two **spoke VNets** (SiteA & SiteB) for application workloads
- **Peering connections** between hub and spokes
- **User-Defined Routes (UDRs)** to direct traffic through the hub
- **Network Security Groups (NSGs)** for segmentation

# Technologies Used 
| Resource | Description |
|----------|-------------|
| `Virtual Network` | Hub and spoke VNets with non-overlapping CIDRs |
| `Subnet(s)` | Separate subnets for workload, management, etc. |
| `VNet Peering` | Fully-meshed connections with correct flags |
| `Route Tables` | Custom UDRs to route traffic via hub |
| `NSGs` | Applied per subnet for fine-grained control |
| `Azure Bastion` *(optional)* | For secure, jump-box-free RDP/SSH access |
 

# Architecture Diagram

<pre> ┌─────────────────────────────┐ │ Azure Hub VNet │ │ (10.0.0.0/16 - hub-vnet) │ │ │ │ ┌─────────────────────┐ │ │ │ Shared Services │ │ │ │ - Azure Firewall │ │ │ │ - VPN Gateway │ │ │ │ - Azure Bastion │ │ │ └─────────────────────┘ │ └────────────┬────────────────┘ │ ┌───────────────────────────┴───────────────────────────┐ │ │ ▼ ▼ ┌──────────────────────┐ ┌──────────────────────┐ │ Spoke 1 VNet │ │ Spoke 2 VNet │ │ (10.1.0.0/16 - spoke1)│ │ (10.2.0.0/16 - spoke2)│ │ │ │ │ │ - App VMs │ │ - DB VMs │ │ - Web Subnet │ │ - Backend Subnet │ └──────────────────────┘ └──────────────────────┘ </pre>

# Folder Structure
```
.
├── main.bicep              # Define Modules to deploy
├── networkResources.bicep  # Vnets for Hub, SiteA and SiteB
├── virtualMachine-01.bicep # Virtual Machine for Site A
├── virtualMachine-02.bicep # Virtual Machine for Site B
└── README.md               # Project documentation
```

# Deployment Instructions

### Prerequisites
- Azure CLI installed and logged in
- Permissions to deploy resources in a subscription
- Bicep CLI v0.20+ (or use Azure CLI with built-in support)
- Visual Studio Code & GitHub repository setup

### Deploy via Azure CLI

```bash
az deployment sub create \
  --location eastus \
  --template-file main.bicep \
```


# Network Security Configurations
- Configured NSGs to block unauthorized movement between subnets  
- Used Azure Bastion to eliminate public IP exposure  
- Role-based access control (RBAC) configured for resource-level permissions  

# Outcome & Results
Successfully segmented traffic between subnets using custom NSG rules  
Validated traffic flow using ping and Azure Network Watcher  
Gained real-world understanding of zero-trust networking in cloud environments

# Code Snippets
The following code is used to deploy the resources at the Azure Subscription level:
```bicep
targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: 'project-alpla'
  location: 'eastus'
}
```
The following is a list of resources I used to build and test this deployment.


# Additional Resources  
Bicep Documentation  
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/  




