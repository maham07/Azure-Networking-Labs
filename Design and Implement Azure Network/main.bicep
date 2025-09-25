param virtualNetworks_CoreServicesVnet_name string = 'CoreServicesVnet'
param location string = 'eastus'
param vnetipaddress string = '10.20.0.0/16'
param subnetipaddress1 string = '10.20.0.0/27'
param subnetipaddress2 string = '10.20.10.0/24'
param subnetipaddress3 string = '10.20.20.0/24'
param subnetipaddress4 string = '10.20.30.0/24'

param subnetdetails array = [
  {
        name: 'GatewaySubnet'
        id: resourceId('Microsoft.Network/virtualNetworks/', virtualNetworks_CoreServicesVnet_name, '/subnets/GatewaySubnet')
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
        id: resourceId('Microsoft.Network/virtualNetworks/', virtualNetworks_CoreServicesVnet_name, '/subnets/SharedServicesSubnet')
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
        id: resourceId('Microsoft.Network/virtualNetworks/', virtualNetworks_CoreServicesVnet_name, '/subnets/DatabaseSubnet')
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
       id: resourceId('Microsoft.Network/virtualNetworks/', virtualNetworks_CoreServicesVnet_name, '/subnets/PublicWebServiceSubnet')
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
        vnetipaddress
      ]
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
      subnetipaddress3 
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
      subnetipaddress1
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
      subnetipaddress4
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
      subnetipaddress2
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_CoreServicesVnet_name_resource
  ]
}
