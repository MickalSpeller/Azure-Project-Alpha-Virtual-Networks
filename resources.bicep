resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'vnet1'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
            '10.0.0.0/16'
          ]
    }
  }
}
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: 'subnet2'
  parent: virtualNetwork
  properties: {
    addressPrefix: '10.0.2.0/24'
  }
}
resource virtualNetwork2 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'vnet2'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.2.0.0/16'
      ]
    }
  }
}
resource subnet2 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: 'subnet3'
  parent: virtualNetwork2
  properties: {
    addressPrefix: '10.2.1.0/24'
  }
}
