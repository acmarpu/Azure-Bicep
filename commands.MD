# CTRL+K+C Demonstrate code 
# "-f" stands for the location of the file
# 'what-if' and '-c' and '--confirm-with-what-if' preflight validation or preview changes before execution

# Login to Azure
az version
az login --use--device
az account show --query name

# Help Command
az bicep --help

# Bicep starting  snippets
type res-

# diffrent way 
type resource and tyep any name myrestorage tyep storage, select value and selet api versiona and type = select properties 

# List all your azure resources
az storage account list --query [].name -o table
az acr account list --query [].name -o table

# Azure Bicep will go and build a JSON ARM template. representation of this empty Bicep file
1) az bicep build -f .\Desktop\Azure_Biceup\Bicep-demo\azurestorage-sample-demo.bicep
2) az bicep build -f .\Bicep-demo\azurestorage-sample-demo.bicep --outfile .\samepath

# Create the resource group
az group create -l eastus2 -g 'bicep-demo1'

# Subscription Scope deployment
az deployment sub create -l eastus2 -f .\demo\simplebicepstorage.bicep -c
az deployment sub what-if --location eastus2 --template-file .\demo\simplebicepstorage.bicep
az deployment sub what-if -l eastus -f .\deployment.bicep

# Deploy ResourceGroup Scope deployment
az deployment group create -g 'bicep-demo1' -f .\demo\simplebicepstorage.bicep -c
az deployment group create -g 'bicep-demo1' -f .\demo\simplebicepstorage.bicep --confirm-with-what-if


# Deploy storage-w-variables.bicep file with variables and outputs to a RG
az deployment group create -g 'bicep-demo1' -f .\demo\storage-w-variables.bicep

# Deploy the storage account file with separate parameters JSON file
az deployment group create -g 'bicep-demo1' -f .\demo\simplebicepstorage.bicep -p \demo\JSON_parameters_file.json -c

# Clean-up resources without confirmation prompt
az group delete --name 'bicep-demo1' --yes


