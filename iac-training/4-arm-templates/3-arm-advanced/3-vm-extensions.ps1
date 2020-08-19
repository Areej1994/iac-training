# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-deploy-vm-extensions

# Log in to Azure

Add-AzAccount

# Variables

$resourceGroupName = "Experimental" # pick something cool
$templateFileLocation = ".\3.1-vm-extensions.json" # this is where your template lives
$VMName = "TheCoolestVM"

# Create a VM to experiment with (if none is available)
[string]$userName = 'complexAdminUserName'
[string]$Password = Read-Host "Type a strong password here, mind the password complexity policy" # This will be replaced in a real-life IaC scenario with a pipeline variable or keyvault value

# Convert to SecureString
[securestring]$securePassword = ConvertTo-SecureString $Password -AsPlainText -Force

[pscredential]$credentialOject = New-Object System.Management.Automation.PSCredential ($userName, $securePassword)

# Creating Resource group
New-AzResourceGroup -Name $resourceGroupName
# Creating VM
New-AzVM -ResourceGroupName $resourceGroupName -Location 'westeurope' -Name $VMName -Credential $credentialOject

# Launch template deployment 

New-AzResourceGroupDeployment -Name deploy-extension `
                              -ResourceGroupName $resourceGroupName `
                              -Mode Incremental -DeploymentDebugLogLevel All `
                              -TemplateFile $templateFileLocation `
                              -VM_Name $VMName