@description( 'name of the storage account name value assigned in parameters_file.json')
param storageName string

@description( 'name of the storage location name value assigned in parameters_file.json')
param azureRegion string


@description( 'name of the storage SKU name value assigned in parameters_file.json')
param storageSku string 


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


/*

# Command to execute
# az deployment group create -g 'bicep-demo1' -f .\parametrizestorage-parametrize.bicep -p .\parametrizeparameters-file.json -c

*/








