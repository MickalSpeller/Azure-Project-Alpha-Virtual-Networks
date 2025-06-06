resource virtualNetwork01 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'mks-vnet-01-dev'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
            '10.1.0.0/16'
          ]
    }
  }
}
resource subnet01a 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: virtualNetwork01
  name: 'sub-10-1-1-0'
  properties: {
    addressPrefix: '10.1.1.0/24'
  }
}
resource subnet01b 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: virtualNetwork01
  name: 'sub-10-1-2-0'
  properties: {
    addressPrefix: '10.1.2.0/24'
  }
}
resource virtualNetwork02 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'mks-vnet-02-dev'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
            '10.2.0.0/16'
          ]
    }
  }
}
resource subnet02a 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: virtualNetwork02
  name: 'sub-10-2-1-0'
  properties: {
    addressPrefix: '10.2.1.0/24'
  }
}
resource subnet02b 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: virtualNetwork02
  name: 'sub-10-2-2-0'
  properties: {
    addressPrefix: '10.2.2.0/24'
  }
}
