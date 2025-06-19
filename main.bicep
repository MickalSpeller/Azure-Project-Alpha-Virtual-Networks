param resourceGroupName string
param location string = 'eastus'

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module networkResources 'networkResources.bicep' = {
  name: 'networkResources'
  scope: resourceGroup
  params: { 
    
  }
}
module virtualMachines01 'virtualMachines-01.bicep' = {
  name: 'virtualMachines01'
  scope: resourceGroup
  dependsOn: [
    networkResources
  ]
  params: { 
  }
}
module virtualMachines02 'virtualMachines-02.bicep' = {
  name: 'virtualMachines02'
  scope: resourceGroup
  dependsOn: [
    networkResources
  ]
  params: { 
  }
}
