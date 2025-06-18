param location string

resource hubVnet01 'Microsoft.Network/virtualNetworks@2019-11-01' = {
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
        name: 'hub-Subnet-10-10-1-0'
        properties: {
          addressPrefix: '10.10.1.0/24'
        }
      }
      {
        name: 'hub-Subnet-10-10-2-0'
        properties: {
          addressPrefix: '10.10.2.0/24'
        }
      }
    ]
  }
}
resource siteAVnet01 'Microsoft.Network/virtualNetworks@2019-11-01' = {
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
        name: 'siteA-sub-10-20-1-0'
        properties: {
          addressPrefix: '10.20.1.0/24'
        }
      }
      {
        name: 'siteA-sub-10-20-2-0'
        properties: {
          addressPrefix: '10.20.2.0/24'
        }
      }
    ]
  }
}
resource siteBVnet01 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'siteB-vnet-01'
  location: 'canadaeast'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.30.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'siteb-sub-10-30-1-0'
        properties: {
          addressPrefix: '10.30.1.0/24'
        }
      }
      {
        name: 'siteb-sub-10-30-2-0'
        properties: {
          addressPrefix: '10.30.2.0/24'
        }
      }
    ]
  }
}
resource peerHubToSiteA 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-07-01' = {
  name: 'peer-hub-to-siteA'
  parent: hubVnet01
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: true
    remoteVirtualNetwork: {
      id: siteAVnet01.name
    }
  }
}
