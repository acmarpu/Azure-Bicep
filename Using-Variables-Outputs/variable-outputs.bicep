//Deploy the storage account file with separate parameters JSON file
// JSON_Parameters_file.json

param storageName string
param azureRegion string
param environment string = 'dev'


var accountName = '${storageName}${environment}'

@description('Trinary operator')
var storageAccountSkuName = (environment == 'prod') ? 'Standard_GRS' : 'Standard_LRS'



resource myNewStorage 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name:  accountName
  location: azureRegion
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
}

output storageId string = myNewStorage.id
