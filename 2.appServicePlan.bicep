
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'testdemoplan-win'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
    tier: 'free'
  }
}

resource appServicePlan2 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'testdemoplan-linux'
  kind: 'linux'
  properties: {
    reserved: true
  }
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
    tier: 'free'
  }
}


resource webAppwin 'Microsoft.Web/sites@2021-01-15' = {
  name: 'test-wep-app-win'
  location: resourceGroup().location
  
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

resource webApplinx 'Microsoft.Web/sites@2021-01-15' = {
  name: 'test-wep-app-linux'
  location: resourceGroup().location
  
  properties: {
//    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'appServicePlan2')
      serverFarmId: appServicePlan2.id
    httpsOnly: true
  }
}


// output webApplicationHostName string = webApplication.properties.defaultHostName
// output webApplicationHostName string = webApplication.properties.defaultHostName


