// This template creates an Azure Storage account and a blob container.

@description('Azure region')
param azrglocation string = resourceGroup().location
param storageName string

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
])

param storageSkuName string = 'Standard_LRS'

@description('Specifies the name of the blob container.')
param containerName string


resource adlsStorage 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name: storageName 
  location: azrglocation
  sku: {
    name: storageSkuName
  }
  kind: 'StorageV2'

  properties:{
    accessTier: 'Hot'
    allowBlobPublicAccess: true
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }

}

resource blobServices 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: adlsStorage
  name: 'default'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  parent: blobServices
  name: containerName
}


output storageId string = adlsStorage.id
output storageAccountName string = storageName
output container string = containerName








