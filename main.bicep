param resourceGroupName string
param location string

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module networkResources 'networkResources.bicep' = {
  name: 'networkResources'
  scope: resourceGroup
  params: { 
    location: location
  }
}
