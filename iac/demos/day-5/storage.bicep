param myStorageObj object = {
  name:''
  location:''
  sku:''
  access:''
}

param myInt int = 2

var myIntVar = 1
var myBooleanVar = true




var myStringVar = 'mystringvar'


resource myStorageAcocount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: myStorageObj.name
  location: myStorageObj.location
  sku: {
    name: myStorageObj.sku
  }
  kind: 'StorageV2'
  properties:{
    allowBlobPublicAccess: myStorageObj.access
  }
}
