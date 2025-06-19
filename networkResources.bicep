param location string = 'eastus'

param siteAPrefix string = '10.20.0.0/16'
param siteASubnet1 string = '10.20.1.0/24'
param siteASubnet2 string = '10.20.2.0/24'

param siteBPrefix string = '10.30.0.0/16'
param siteBSubnet1 string = '10.30.1.0/24'
param siteBSubnet2 string = '10.30.2.0/24'

resource hubVnet01 'Microsoft.Network/virtualNetworks@2024-07-01' = {
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
resource siteAVnet01 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: 'siteA-vnet-01'
  location: 'westus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        siteAPrefix
      ]
    }
    subnets: [
      {
        name: 'siteA-sub-10-20-1-0'
        properties: { 
          addressPrefix: siteASubnet1
        }
      }
      {
        name: 'siteA-sub-10-20-2-0'
        properties: {
          addressPrefix: siteASubnet2
        }
      }
    ]
  }
}
resource siteBVnet01 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: 'siteB-vnet-01'
  location: 'canadacentral'
  properties: {
    addressSpace: {
      addressPrefixes: [
        siteBPrefix
      ]
    }
    subnets: [
      {
        type: siteBSubnet1
        id: siteBSubnet1
        name: 'siteb-sub-10-30-1-0'
        properties: {
          addressPrefix: siteBSubnet1
        }
      }
      {
        type: siteBSubnet2
        id: siteBSubnet2
        name: 'siteb-sub-10-30-2-0'
        properties: {
          addressPrefix: siteBSubnet2
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
