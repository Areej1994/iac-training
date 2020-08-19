$prefix = "msiac"   # This name is used to generate names for Azure resources, such as storage account name.
$location = "eastus"

$resourceGroupName = $prefix + "-rg"
$storageAccountName = $prefix + "store"
$containerName = "templates"

$fileName = "linkedStorageAccount.json"
$templateFile = "2-deploy-linked-template.json"

New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
$storageAccount = New-AzStorageAccount `
    -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName "Standard_LRS"

$context = $storageAccount.Context

# Create a container
New-AzStorageContainer -Name $containerName -Context $context -Permission Container

# Upload the template
Set-AzStorageBlobContent `
    -Container $containerName `
    -File "./$fileName" `
    -Blob "$fileName" `
    -Context $context


$linkedTemplateUri = New-AzStorageBlobSASToken `
    -Context $context `
    -Container $containerName `
    -Blob $fileName `
    -Permission r `
    -ExpiryTime (Get-Date).AddHours(2.0) `
    -FullUri

New-AzResourceGroupDeployment `
    -Name 2-deploy-linked-template `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -prefix $prefix `
    -linkedTemplateUri $linkedTemplateUri `
    -verbose