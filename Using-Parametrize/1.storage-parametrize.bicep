
@description('Specifies the Azure storage account name')
param storageName string = 'autoteststorage13'

@description('Specifies the Azure location name')
param azureRegion string = 'eastus2'

@description('Specifies the Azure storage SKU')
param storageSku string = 'Standard_LRS'


resource adlsStorage 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name:  storageName
  location: azureRegion
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'

  properties:{
    accessTier: 'Hot'
    allowBlobPublicAccess: true
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }

}








