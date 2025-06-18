param location string
param hubVnetName string
param addressSpaceHub string


resource coreVnet 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: hubVnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
            addressSpaceHub
          ]
    }
  }
}
resource coreSubnet01 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: coreVnet
  name: 'sub-10-10-0-0'
  properties: {
    addressPrefix: '10.10.0.0/24'
  }
}
resource coreSubnet02 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: coreVnet
  name: 'sub-10-10.1.0'
  properties: {
    addressPrefix: '10.10.1.0/24'
  }
}
