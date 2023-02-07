param myStorageName string
param location string

var storageSKU = 'Standard_LRS'

resource myStorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: myStorageName
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
}

output myStorageAccount string = myStorage.properties.creationTime
