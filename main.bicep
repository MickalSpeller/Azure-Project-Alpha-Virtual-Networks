resource resrouceGroup 'Microsoft.ScVmm/virtualNetworks@2025-03-13' = {
  name: 'main.bicep'
  location: 
  extendedLocation: {}
}
resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2021-06-01-preview' = {
  name: 'name'
  location: location
  sku: {
    name: 'Basic'
    capacity: 1
    tier: 'Basic'
  }
}
