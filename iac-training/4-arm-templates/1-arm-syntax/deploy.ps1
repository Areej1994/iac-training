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
# run from root folder of this script
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

# 5-variables.json
# supply only prefix for the storage name and SKU for the stroage account 
$templateFile = "5-variables.json"
New-AzResourceGroupDeployment `
    -Name 5-variables `
    -ResourceGroupName "$myPrefix-arm-templates-rg" `
    -Mode Complete `
    -TemplateFile $templateFile `
    -storagePrefix "$myPrefix" `
    -storageSKU Standard_LRS

# 6-outputs.json
# supply only prefix for the storage name and SKU for the stroage account 
$templateFile = "6-outputs.json"
$deployment = New-AzResourceGroupDeployment `
    -Name 6-outputs `
    -ResourceGroupName "$myPrefix-arm-templates-rg" `
    -TemplateFile $templateFile `
    -storagePrefix "$myPrefix" `
    -storageSKU Standard_LRS

echo $deployment

echo $deployment.Outputs.storageEndpoint.value.blob.value

# 7-use-exported-template
# create new app service plan and export template
# supply only prefix for the storage name and SKU for the stroage account 
$templateFile = "7-use-exported-template.json"
New-AzResourceGroupDeployment `
    -Name 7-use-exported-template `
    -ResourceGroupName "$myPrefix-arm-templates-rg" `
    -TemplateFile $templateFile `
    -storagePrefix "$myPrefix" `
    -storageSKU Standard_LRS

# 8-use-quickstart-template.json
# Open Azure Quickstart templates https://azure.microsoft.com/resources/templates/
# use teplate from here https://azure.microsoft.com/resources/templates/101-webapp-basic-linux/
$webApp = "$myPrefix-app"
$templateFile = "8-use-quickstart-template.json"
New-AzResourceGroupDeployment `
    -Name 8-use-quickstart-template `
    -ResourceGroupName "$myPrefix-arm-templates-rg" `
    -TemplateFile $templateFile `
    -storagePrefix "$myPrefix" `
    -storageSKU Standard_LRS `
    -webAppName $webApp

# 9-tags.json
# Open Azure Quickstart templates https://azure.microsoft.com/resources/templates/
# use teplate from here https://azure.microsoft.com/resources/templates/101-webapp-basic-linux/
$webApp = "$myPrefix-app"
$templateFile = "9-tags.json"
New-AzResourceGroupDeployment `
    -Name 9-tags `
    -ResourceGroupName "$myPrefix-arm-templates-rg" `
    -TemplateFile $templateFile `
    -storagePrefix "$myPrefix" `
    -storageSKU Standard_LRS `
    -webAppName $webApp
  
# Clean up resources
Remove-AzResourceGroup `
  -Name "$myPrefix-arm-templates-rg"

# 10-paramter-files.json
# Open Azure Quickstart templates https://azure.microsoft.com/resources/templates/
# use teplate from here https://azure.microsoft.com/resources/templates/101-webapp-basic-linux/
$webApp = "$myPrefix-app"
$templateFile = "10-paramter-files.json"

#Deploy development resource group
$parameterFileDev="10-paramters.dev.json"
$devResourceGroup = "$myPrefix-arm-templates-dev-rg"

New-AzResourceGroup `
  -Name $devResourceGroup `
  -Location "Central US"

New-AzResourceGroupDeployment `
  -Name devenvironment `
  -ResourceGroupName $devResourceGroup `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFileDev

#Deploy production resource group
$parameterFilePrd="10-paramters.prd.json"
$prdResourceGroup = "$myPrefix-arm-templates-prd-rg"

New-AzResourceGroup `
-Name $prdResourceGroup `
-Location "Central US"

New-AzResourceGroupDeployment `
-Name devenvironment `
-ResourceGroupName $prdResourceGroup `
-TemplateFile $templateFile `
-TemplateParameterFile $parameterFilePrd

# Clean up resources
Remove-AzResourceGroup `
  -Name $devResourceGroup
Remove-AzResourceGroup `
  -Name $prdResourceGroup