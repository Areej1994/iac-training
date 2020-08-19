# create multiple storages

# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-multiple-instances?tabs=CLI%2Cazure-cli

# Variables
$location = "eastus"
$resourceGroupName = "vb-iac-taining-cli-rg"
#$templateFileLocation = ".\iac-training\4-arm-templates\3-arm-advanced\1.1-create-multiple-resourc.json"
$templateFileLocation = "1.1-create-multiple-resourc.json"

# Create resource group and start template deployment
New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFileLocation