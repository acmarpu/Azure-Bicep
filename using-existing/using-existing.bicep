
param azrgname string = 'testdemo'


// Existing resource Group
resource rg1 'Microsoft.Resources/resourceGroups@2022-09-01' existing = {
  name: azrgname
  scope: subscription()
  
}
