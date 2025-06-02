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
resource subnet02b 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: 'sub-10-2-2-0'
  parent: virtualNetwork02
  properties: {
    addressPrefix: '10.2.2.0/24'
  }
}
resource subnet02c 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: 'sub-10-2-3-0'
  parent: virtualNetwork02
  properties: {
    addressPrefix: '10.2.3.0/24'
  }
}
resource virtualNetwork02 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'vnet02'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.2.0.0/16'
      ]
    }
  }
}
