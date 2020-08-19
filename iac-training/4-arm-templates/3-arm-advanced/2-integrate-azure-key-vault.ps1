# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-use-key-vault

# Log in to your subscription

Add-AzAccount

# The variables

$resourceGroupName = "Skunkworks" # pick something cool
$templateFileLocation = ".\2.1-integrate-azure-key-vault.json" # this is where your template lives
$keyVaultName = "modernengineeringkv01" # pick something unique and cool
$objectId = "0000-0000-0000-0000" # Use Get-AzAdUser or Get-AzAdServicePrincipal to find one in your subscription

# Create a resource group

New-AzResourceGroup -Name $resourceGroupName

# Start arm template deployment

New-AzResourceGroupDeployment -Name "deploy-the-keyvault" `
                              -ResourceGroupName $resourceGroupName `
                              -Mode "Incremental" `
                              -DeploymentDebugLogLevel "All" `
                              -TemplateFile $templateFileLocation `
                              -keyVaultName $keyVaultName `
                              -objectid $objectId