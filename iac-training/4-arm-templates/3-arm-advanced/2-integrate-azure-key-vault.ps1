# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-use-key-vault

# Log in to your subscription
<#
   Add-AzAccount
#>
# The variables
$prefix = "vb"
$location = "eastus"
$resourceGroupName = "$prefix-iac-taining-cli-rg" # pick something cool
$templateKeyVaultFileLocation = ".\2.1-integrate-azure-key-vault.json" # this is where your template lives
$templateFileLocation = ".\2.2-reference-to-azure-key-vault.json" # this is where the keyvault is referenced
$keyVaultName = "$prefix-modernengineeringkv02" # pick something unique and cool
# Use Get-AzAdUser or Get-AzAdServicePrincipal to find one in your subscription
$objectId = (Get-AzAdUser -Mail viliam.batka@accenture.com).Id  # find user by email

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location "$location"
yes
# Start arm template deployment
# proper pass of the cercer
New-AzResourceGroupDeployment -Name "deploy-the-keyvault" `
                              -ResourceGroupName $resourceGroupName `
                              -Mode "Incremental" `
                              -DeploymentDebugLogLevel "All" `
                              -TemplateFile $templateKeyVaultFileLocation `
                              -keyVaultName $keyVaultName `
                              -objectid $objectId

New-AzResourceGroupDeployment -Name "reference-the-keyvault" `
                              -ResourceGroupName $resourceGroupName `
                              -Mode "Incremental" `
                              -DeploymentDebugLogLevel "All" `
                              -TemplateFile $templateFileLocation `
                              -vaultName $keyVaultName `
                              -secretName "thisIsASecretDontTellAnyone" `
                              -vaultResourceGroupName $resourceGroupName





<#

#>