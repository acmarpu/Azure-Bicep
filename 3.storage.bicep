resource adlsStorage 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name:  'autoteststorage13'
  location: resourceGroup().location
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








