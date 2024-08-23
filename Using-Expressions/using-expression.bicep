@description('Specifies the Azure storage account name')
param storageName string = 'adlsautomationstorage'

@description('Specifies the Azure storage location name')
param azureRegion string = 'eastus2'

@description('Specifies the Azure storage SKU name')
param storageSku string = 'Standard_LRS'

@description('this value for expression and add the extra value resource naming')
param environment string = 'dev'


resource myNewStorage 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name:  '${storageName}${environment}'
  location: azureRegion
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}
