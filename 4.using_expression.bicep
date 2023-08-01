// Create parameters and dynamically creating nameing convention using expression 

param storageName string = 'adlsautomationstorage'
param azureRegion string = 'eastus2'
param storageSku string = 'Standard_LRS'
param environment string = 'dev'


resource myNewStorage 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name:  '${storageName}${environment}'
  location: azureRegion
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}
