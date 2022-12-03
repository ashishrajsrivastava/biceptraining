resource myStorageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: 'adpiacdemo01'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'BlobStorage'
  properties: {
    accessTier: 'Hot'
  }
}
