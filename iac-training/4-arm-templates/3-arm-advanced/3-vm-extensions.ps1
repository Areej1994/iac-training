# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-deploy-vm-extensions

# Log in to Azure
<#
Add-AzAccount
#>

# Variables
$prefix = "vb"
$location = "eastus"
$resourceGroupName = "$prefix-iac-taining-cli-rg" # pick something cool
$templateFileLocation = ".\3.1-vm-extensions.json" # this is where your template lives
$VMName = "TutorialVME"

# Create a VM to experiment with (if none is available)
# Create user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Creating Resource group
New-AzResourceGroup -Name $resourceGroupName -Location "$location"

# Creating VM
New-AzVM -ResourceGroupName $resourceGroupName -Location "$location" -Name $VMName -Credential $cred -Size Standard_B2S

# Launch template deployment 
New-AzResourceGroupDeployment -Name deploy-extension `
                              -ResourceGroupName $resourceGroupName `
                              -Mode Incremental -DeploymentDebugLogLevel All `
                              -TemplateFile $templateFileLocation `
                              -VM_Name $VMName