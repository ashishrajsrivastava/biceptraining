targetScope = 'subscription'

resource adp_acr_rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'adp-acr-rg'
  location: 'westeurope'
}

module adpacr 'modules/acr.bicep' = {
  name: 'adp-acr'
  scope: adp_acr_rg
  params: {
    acrName: 'adpdemoacr'
    location: adp_acr_rg.location
  }
}

output acrLoginServer string = adpacr.outputs.acrLoginServer
