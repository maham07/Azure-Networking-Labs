param virtualNetworks_CoreServicesVnet_name string = 'CoreServicesVnet'
param location string = 'eastus'
param subnetdetails object = [
  {
        name: 'GatewaySubnet'
        id: virtualNetworks_CoreServicesVnet_name_GatewaySubnet.id
        properties: {
          addressPrefixes: [
            '10.20.0.0/27'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'SharedServicesSubnet'
        id: virtualNetworks_CoreServicesVnet_name_SharedServicesSubnet.id
        properties: {
          addressPrefixes: [
            '10.20.10.0/24'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'DatabaseSubnet'
        id: virtualNetworks_CoreServicesVnet_name_DatabaseSubnet.id
        properties: {
          addressPrefixes: [
            '10.20.20.0/24'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'PublicWebServiceSubnet'
        id: virtualNetworks_CoreServicesVnet_name_PublicWebServiceSubnet.id
        properties: {
          addressPrefixes: [
            '10.20.30.0/24'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
]

resource virtualNetworks_CoreServicesVnet_name_resource 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: virtualNetworks_CoreServicesVnet_name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.0.0/16'
      ]
    }
    encryption: {
      enabled: false
      enforcement: 'AllowUnencrypted'
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: subnetdetails
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_CoreServicesVnet_name_DatabaseSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_CoreServicesVnet_name}/DatabaseSubnet'
  properties: {
    addressPrefixes: [
      '10.20.20.0/24'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_CoreServicesVnet_name_resource
  ]
}

resource virtualNetworks_CoreServicesVnet_name_GatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_CoreServicesVnet_name}/GatewaySubnet'
  properties: {
    addressPrefixes: [
      '10.20.0.0/27'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_CoreServicesVnet_name_resource
  ]
}

resource virtualNetworks_CoreServicesVnet_name_PublicWebServiceSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_CoreServicesVnet_name}/PublicWebServiceSubnet'
  properties: {
    addressPrefixes: [
      '10.20.30.0/24'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_CoreServicesVnet_name_resource
  ]
}

resource virtualNetworks_CoreServicesVnet_name_SharedServicesSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_CoreServicesVnet_name}/SharedServicesSubnet'
  properties: {
    addressPrefixes: [
      '10.20.10.0/24'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_CoreServicesVnet_name_resource
  ]
}
