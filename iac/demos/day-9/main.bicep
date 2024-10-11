


targetScope = 'subscription'

var storageAccountName1  = 'adp1${uniqueString(subscription().subscriptionId)}'

resource myrg 'Microsoft.Resources/resourceGroups@2024-06-01-preview' = {
  name: 'adp-bicep-demo-rg'
  location: 'westeurope'
}

module mystorageAcount 'modules/storageaccount.bicep' = {
  name: 'adp-storage-account'
  scope: myrg
  params: {
    storageName: storageAccountName1
    envName: 'staging'
  }
}

output storageAccountName string = mystorageAcount.outputs.storageAccountName
