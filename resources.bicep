resource coreVnet 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: 'CoreVnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
            '10.10.0.0/16'
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
resource siteAVnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'SiteAVnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
            '10.20.0.0/16'
          ]
    }
  }
}
resource siteASubnet01 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: siteAVnet
  name: 'sub-10-20-0-0'
  properties: {
    addressPrefix: '10.20.0.0/24'
  }
}
resource siteASubnet02 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: siteAVnet
  name: 'sub-10-20-1-0'
  properties: {
    addressPrefix: '10.20.1.0/24'
  }
}
resource siteBVnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'SiteBVnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
            '10.30.0.0/16'
          ]
    }
  }
}
resource siteBSubnet01 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: siteBVnet
  name: 'sub-10-30-0-0'
  properties: {
    addressPrefix: '10.30.0.0/24'
  }
}
resource siteBSubnet02 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: siteBVnet
  name: 'sub-10-30-1-0'
  properties: {
    addressPrefix: '10.30.1.0/24'
  }
}
