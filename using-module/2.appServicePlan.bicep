param azrglocation string = resourceGroup().location
param appPlanwin string
param appPlanlinx string
param webappadlswin string
param webappadlslinux string


resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appPlanwin
  location: azrglocation
  sku: {
    name: 'S1'
    capacity: 1
    tier: 'free'
  }
}

resource appServicePlan2 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appPlanlinx
  kind: 'linux'
  properties: {
    reserved: true
  }
  location: azrglocation
  sku: {
    name: 'S1'
    capacity: 1
    tier: 'free'
  }
}


resource webAppwin 'Microsoft.Web/sites@2021-01-15' = {
  name: webappadlswin
  location: azrglocation
  
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

resource webApplinx 'Microsoft.Web/sites@2021-01-15' = {
  name: webappadlslinux
  location: azrglocation
  
  properties: {
//    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'appServicePlan2')
      serverFarmId: appServicePlan2.id
    httpsOnly: true
  }
}


output webApplicationHostName string = webAppwin.properties.defaultHostName
output webApplicationHostNameLinux string = webApplinx.properties.defaultHostName



