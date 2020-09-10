# https://docs.microsoft.com/en-us/azure/automation/update-management/update-mgmt-enable-template

# Log in to Azure
<#
Add-AzAccount
#>

# Variables
$prefix = "vb"
$location = "westeurope"
$resourceGroupName = "$prefix-iac-taining-mgmt-rg" # pick something cool
$templateFileLocation = ".\5-update-mgmt-enable-template.json" # this is where your template lives
$automationAccountName = "$prefix-iac-auto-mgmt"
$workspacename = "$prefix-workspace-$location"
# Creating Resource group
New-AzResourceGroup -Name $resourceGroupName -Location "$location"

# Launch template deployment 
New-AzResourceGroupDeployment -Name deploy-extension `
                              -ResourceGroupName $resourceGroupName `
                              -Mode Incremental -DeploymentDebugLogLevel All `
                              -TemplateFile $templateFileLocation `
                              -workspaceName $workspacename `
                              -location $location `
                              -resourcePermissions $true `
                              -automationAccountName $automationAccountName `
                              -automationAccountLocation $location
