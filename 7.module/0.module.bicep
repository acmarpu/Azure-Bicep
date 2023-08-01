// Azure resourceGroup parameters
targetScope= 'subscription'
//targetScope= 'resourceGroup'
param subscriptionId string = '43664b96-158c-479f-aa95-be96781221c0'
param azrgname string = 'testdemo'
param azrglocation string = 'eastus2'

// Storage account parameteres
param stgname string ='autoteststorage13'


// Webapp parameteres
param appPlanwin string = 'azappPlanwin'
param appPlanlinx string = 'azappPlanlinx'
param webappadlswin string = 'azWebappPlanwin'
param webappadlslinux string = 'azWebappPlanlinx'


// Resource Group Module Deployment 
module azrgModule '1.ResourceGroup.bicep' = {
  scope: subscription(subscriptionId)
  name: 'azrgDeploy'
  params: {
    azrglocation:azrglocation
    azrgname: azrgname
  }
}

// Existing resource Group
resource rg1 'Microsoft.Resources/resourceGroups@2022-09-01' existing = {
  name: azrgname
  scope: subscription()
  
}


// Storage account Module Deployment 

module stg1 '3.storage.bicep' = {
  name: stgname
  scope: rg1
    params: {
    stgname:stgname
    azrglocation:azrglocation
  }

  dependsOn:[
    azrgModule
    rg1
  ]
}


// webapp Module Deployment 

module appplanwin '2.appServicePlan.bicep' = {
  name: 'appplanwindeploy'
  scope: rg1
  params: {
    appPlanwin: appPlanwin
    appPlanlinx: appPlanlinx
    webappadlslinux :webappadlslinux
    webappadlswin: webappadlswin
    azrglocation: azrglocation
  }

  dependsOn:[
    azrgModule
    rg1
  ]
}



