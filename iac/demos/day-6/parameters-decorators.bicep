param demoString string
param demoInt int
param demoBool bool
param demoObject object
param demoArray array


































// Decorators

@description('Must be at least Standard_A3 to support 2 NICs.')
param virtualMachineSize string = 'Standard_DS1_v2'

@secure()
param demoPassword string

@allowed([
  'one'
  'two'
])
param demoEnum string

@minLength(3)
@maxLength(24)
param storageAccountName string

@minLength(1)
@maxLength(5)
param appNames array

@minValue(1)
@maxValue(12)
param month int

