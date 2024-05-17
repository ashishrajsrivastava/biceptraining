@description('Name of the storage account')
param storageName string

var skuName = 'Standard_LRS'
var storageKind = 'StorageV2'

resource myStorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: resourceGroup().location
  sku: {
    name: skuName
  }
  kind: storageKind
}

output storageAccountName string = myStorage.name
