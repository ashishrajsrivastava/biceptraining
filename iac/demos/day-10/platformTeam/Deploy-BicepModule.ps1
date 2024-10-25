#Deploy ACR for hosting the Bicep Module

$acrDeployment = New-AzSubscriptionDeployment -Location 'West Europe' -TemplateFile ./platformTeam/acr.main.bicep

# Get the ACR details

$acrLoginServer = $acrDeployment.Outputs.acrLoginServer.Value

# Publish the storage module to the ACR

Publish-AzBicepModule -FilePath  ./platformTeam/modules/storage.bicep -Target br:${acrLoginServer}/bicep/modules/adpstorage:v1