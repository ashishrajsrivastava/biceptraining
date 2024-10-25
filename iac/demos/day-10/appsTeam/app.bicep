targetScope = 'subscription'

resource myappResourceGroup 'Microsoft.Resources/resourceGroups@2024-08-01' = {
  name: 'myapp-rg'
  location: 'westeurope'
}


module myappStorageAccount 'br:adpdemoacr.azurecr.io/bicep/modules/adpstorage:v1'= {
  name: 'adp-storage-account'
  scope: myappResourceGroup
  params: {
    storageName: 'adpstorage${uniqueString(subscription().subscriptionId)}'
    envName: 'staging'
    location: myappResourceGroup.location
  }
}
