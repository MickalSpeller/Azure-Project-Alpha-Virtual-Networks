targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: 'rg-mks-dev'
  location: 'westus2'
}
module networkModule 'resources.bicep' = {
  name: 'networkModule'
  scope: resourceGroup
  params: {
  }
}
