resource resourceGroup 'Microsoft.ScVmm/virtualNetworks@2025-03-13' = {
  name: 'rg-mks-dev-env'
  location: 'eastus'
  extendedLocation: {}
}
resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2021-06-01-preview' = {
  name: resourceGroup.name
  location: 'eastus'
  sku: {
    name: 'Basic'
    capacity: 1
    tier: 'Basic'
  }
}
