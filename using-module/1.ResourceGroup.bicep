
// targetScope= 'managementGroup'

// targetScope= 'resourceGroup'

targetScope= 'subscription'

// targetScope= 'tenant' 

// parameter
// default,it's going to ask to enter that default name while running bicep. or you can write Parametrize JSON file also
// param storageName string

param azrgname string 
param azrglocation string 

resource azresourcegroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: azrgname
  location: azrglocation
}


output resourceGroupId string = azresourcegroup.id
output resourceGroupName string = azresourcegroup.name

