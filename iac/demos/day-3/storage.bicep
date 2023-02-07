@description('Globally unique name of storage account')
@minLength(20)
@metadata({
  Product: 'Demo'
})
param storageName string
@allowed([
  'StorageV2'
  'BlobStorage'
  'BlockBlobStorage'
  'FileStorage'
  'Storage'
])
param storageKind string
var skuName = 'Standard_LRS' 

resource myStorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: resourceGroup().location
  sku: {
    name: skuName
  }
  kind: storageKind
}
output myStorageName string = myStorage.name
