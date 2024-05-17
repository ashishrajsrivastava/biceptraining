
@description('Name of the resource group to deploy the storage account to')
param resourceGroupName string

@description('Name of existing resource group to deploy the storage account to')
param existingResourceGroupName string

var storageAccountName1  = 'adp1${uniqueString(subscription().subscriptionId)}'
var storageAccountName2  = 'adp2${uniqueString(subscription().subscriptionId)}'

targetScope = 'subscription'

resource storageRg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: 'eastus'
}

resource existingStorageRg 'Microsoft.Resources/resourceGroups@2024-03-01' existing = {
  name: existingResourceGroupName
}

module myadpStorageAccount1 'modules/storageAccount.bicep' = {
  name: 'adp-storage-account'
  scope: storageRg
  params: {
    storageName: storageAccountName1
  }
}

module myadpStorageAccount2 'modules/storageAccount.bicep' = {
  name: 'adp-storage-account-2'
  scope: existingStorageRg
  params: {
    storageName: storageAccountName2
  }
}

output storageAccountName1 string = myadpStorageAccount1.outputs.storageAccountName
output storageAccountName2 string = myadpStorageAccount2.outputs.storageAccountName
