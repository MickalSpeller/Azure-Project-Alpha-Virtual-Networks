targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: 'rg-mks-dev'
  location: 'eastus'
}
module networkModule 'resources.bicep' = {
  name: 'networkModule'
  scope: resourceGroup
  params: {
  }
}
module storageModule 'storage.bicep' = {
  name: 'storageModule'
  scope: resourceGroup
  params: {
  }
}
