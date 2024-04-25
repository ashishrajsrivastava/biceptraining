param rgLocation string

param stages array = [
  'dev'
  'test'
  'stage'
  'prod'
]

resource demoAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = [for stage in stages: {
  name: '${toLower(stage)}${uniqueString(resourceGroup().id)}'
  location: rgLocation
  kind: 'Storage'
  sku: {
    name: (stage == 'prod' ? 'Standard_GRS' : 'Standard_LRS')
  }
}]
