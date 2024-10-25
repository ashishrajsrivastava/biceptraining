@description('Name of the storage account')
param storageName string
@allowed(['production', 'staging', 'development'])
param envName string
@description('location of the storage account')
param location string

var storageKind = 'StorageV2'

resource myStorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  sku: {
    name: (envName == 'production') || (envName == 'staging')? 'Premium_LRS' : 'Standard_LRS'
  }
  kind: storageKind
}

output storageAccountName string = myStorage.properties.primaryEndpoints.blob
