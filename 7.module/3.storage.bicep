param stgname string
param azrglocation string = resourceGroup().location

resource adlsStorage 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name: stgname 
  location: azrglocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'

  properties:{
    accessTier: 'Hot'
    allowBlobPublicAccess: true
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }

}








