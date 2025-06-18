param location string

resource hubVirtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'hub-vnet-01'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'hub-subnet-10-10-1-0'
        properties: {
          addressPrefix: '10.10.0.0/24'
        }
      }
      {
        name: 'hub-subnet-10-10-2-0'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}
resource siteAVirtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'siteA-vnet-01'
  location: 'westus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'siteA-subnet-10-20-1-0'
        properties: {
          addressPrefix: '10.20.1.0/24'
        }
      }
      {
        name: 'siteA-subnet-10-20-2-0'
        properties: {
          addressPrefix: '10.20.2.0/24'
        }
      }
    ]
  }
}
