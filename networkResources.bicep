param location string = 'eastus'

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
  }
}
resource siteBVnet01 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'siteB-vnet-01'
  location: 'canadacentral'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.30.0.0/16'
      ]
    }
  }
}
resource siteAsub01 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: 'siteA-sub-10-20-1-0'
  parent: siteAVnet01
  properties: {
    addressPrefix: '10.20.1.0/24'
  }
}
resource siteAsub02 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: 'siteA-sub-10-20-2-0'
  parent: siteAVnet01
  properties: {
    addressPrefix: '10.20.2.0/24'
  }
}
resource siteBsub01 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: 'siteB-sub-10-30-1-0'
  parent: siteBVnet01
  properties: {
    addressPrefix: '10.30.1.0/24'
  }
}
resource siteBsub02 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: 'siteB-sub-10-30-2-0'
  parent: siteBVnet01
  properties: {
    addressPrefix: '10.30.2.0/24'
  }
}
resource peerHubToSiteA 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-07-01' = {
  name: 'peer-hub-to-siteA'
  parent: hubVnet01
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: siteAVnet01.id
    }
  }
}
resource peerSiteAToHub 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-07-01' = {
  name: 'peer-siteA-to-hub'
  parent: siteAVnet01
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: hubVnet01.id
    }
  }
}
resource peerHubToSiteB 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-07-01' = {
  name: 'peer-hub-to-siteB'
  parent: hubVnet01
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: siteBVnet01.id
    }
  }
}
resource peerSiteBToHub 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-07-01' = {
  name: 'peer-siteB-to-hub'
  parent: siteBVnet01
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: hubVnet01.id
    }
  }
}
