// Azure resourceGroup parameters
targetScope= 'subscription'
//targetScope= 'resourceGroup'
param subscriptionId string = ''
param azrgname string = 'testdemo'
param azrglocation string = 'eastus2'

@description('Storage account parameteres') 
param stgname string ='autoteststorage13'
param containerName string = 'containername'

@description('Webapp parameteres') 
param appPlanwin string = 'azappPlanwin'
param appPlanlinx string = 'azappPlanlinx'
param webappadlswin string = 'azWebappPlanwin'
param webappadlslinux string = 'azWebappPlanlinx'


@description('resource group module')
module azrgModule '1.ResourceGroup.bicep' = {
  scope: subscription(subscriptionId)
  name: 'azrgDeploy'
  params: {
    azrglocation:azrglocation
    azrgname: azrgname
  }
}


@description('Existing resource Group') 
resource rg1 'Microsoft.Resources/resourceGroups@2022-09-01' existing = {
  name: azrgname
  scope: subscription()
  
}


@description('Storage account Module Deployment') 
module stg1 '3.storage.bicep' = {
  name: stgname
  scope: rg1
    params: {

      azrglocation:azrglocation
      containerName: containerName
      storageName: stgname
  }

  dependsOn:[
    azrgModule
    rg1
  ]
}


@description('webapp Module Deployment ')
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
