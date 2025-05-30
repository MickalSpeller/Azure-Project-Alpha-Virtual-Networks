resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'mksstoragenetspellerdev'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    allowBlobPublicAccess: false
  }
}
