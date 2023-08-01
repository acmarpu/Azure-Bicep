// scope
// targetScope= 'managementGroup'
// targetScope= 'resourceGroup'
targetScope= 'subscription'
// targetScope= 'tenant' 

// parameter
// [param storageName string] default,it's going to ask to enter that default name while running bicep.


resource resourcegroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'testdemo'
  location: 'eastus2'
}


output resourceGroupId string = resourcegroup.id
output resourceGroupName string = resourcegroup.name
