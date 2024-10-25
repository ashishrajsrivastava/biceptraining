
param location string
param appTags object = {}
param appName string

resource appsrvPlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: '${appName}-sp'
  location: location
  kind: 'app'
  sku: {
    name: 'F1'
    tier: 'Free'
  }
  properties: {
  }
}


resource appService 'Microsoft.Web/sites@2023-12-01' = {
  name: appName
  location: location
  tags: appTags
  properties: {
    serverFarmId: appsrvPlan.id
    siteConfig: {
      appSettings: [
      ]
    }
  }
}
