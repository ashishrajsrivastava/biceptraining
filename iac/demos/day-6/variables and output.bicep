param storageNamePrefix string = 'stg'


var storageName = '${toLower(storageNamePrefix)}${uniqueString(resourceGroup().id)}'


output stgOutput string = storageName
