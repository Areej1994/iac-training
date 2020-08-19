# Deployment of ARM templates 
# Ensure that the myPrefix variable is unique in for each user in azure Subscription 
# 
# . .\deploy.ps1  vs .\deploy.ps1
<#
  Connect-AzAccount
  Set-AzContext -SubscriptionName
#>

$myPrefix = "iac1"

# Create Resource group
New-AzResourceGroup `
  -Name "$myPrefix-arm-templates-rg" `
  -Location "Central US"

# 1-empty.json
# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-powershell
$templateFile = "1-empty.json"
New-AzResourceGroupDeployment `
  -Name 1-empty `
  -ResourceGroupName "$myPrefix-arm-templates-rg" `
  -TemplateFile $templateFile

  # 2-resource.json
  # NOTE: before execution replace in template "{provide-unique-name}" with unique lovercase string
if (0) {
    $templateFile = "2-resource.json"
    New-AzResourceGroupDeployment `
        -Name 2-resource `
        -ResourceGroupName "$myPrefix-arm-templates-rg" `
        -TemplateFile $templateFile
}

# 3-parameters.json
# supply unique name as parameter and the SKU for the storage account 
$uniqueName = "$myPrefix-$([system.guid]::newguid())" -replace "-", ""
$uniqueName = $uniqueName.Substring(0,24)
$templateFile = "3-parameters.json"
New-AzResourceGroupDeployment `
    -Name 3-parameters `
    -ResourceGroupName "$myPrefix-arm-templates-rg" `
    -TemplateFile $templateFile `
    -storageName "$uniqueName" `
    -storageSKU Standard_LRS


# 4-template-function.json
# supply unique name as parameter and the SKU for the storage account 
$uniqueName = "$myPrefix-$([system.guid]::newguid())" -replace "-", ""
$uniqueName = $uniqueName.Substring(0,24)
$templateFile = "4-template-function.json"
New-AzResourceGroupDeployment `
    -Name 4-template-function `
    -ResourceGroupName "$myPrefix-arm-templates-rg" `
    -TemplateFile $templateFile `
    -storageName "$uniqueName" `
    -storageSKU Standard_LRS


# delete content of resource group via empty deployment
if (0) {
    $templateFile = "1-empty.json"
    New-AzResourceGroupDeployment `
        -Name 1-empty-complete `
        -ResourceGroupName "$myPrefix-arm-templates-rg" `
        -Mode Complete `
        -TemplateFile $templateFile  
}