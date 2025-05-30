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
