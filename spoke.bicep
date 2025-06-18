param location string
param vnetName string
param addressPrefix string

resource spokeVnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [addressPrefix]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: split(addressPrefix, '/')[0] + '/24'
        }
      }
    ]
  }
}

output vnetName string = spokeVnet.name
