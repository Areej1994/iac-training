# Use an Azure PowerShell sample script to create an IIS VM

# https://docs.microsoft.com/en-us/azure/virtual-machines/scripts/virtual-machines-windows-powershell-sample-create-iis-using-dsc

# Variables for common values - adjust Resource group name
$resourceGroup = 'vb-iac-taining-cli-rg'
$location = "eastus"
$vmName = "TutorialDSC"

# Create a resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Create a virtual machine
New-AzVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -ImageName "Win2016Datacenter" `
  -Size Standard_B2S `
  -VirtualNetworkName "myVnetDSC" `
  -SubnetName "mySubnetDSC" `
  -SecurityGroupName "myNetworkSecurityGroupDSC" `
  -PublicIpAddressName "myPublicIpDSC" `
  -Credential $cred `
  -OpenPorts 80

# Install IIS
$PublicSettings = '{"ModulesURL":"https://github.com/Azure/azure-quickstart-templates/raw/master/dsc-extension-iis-server-windows-vm/ContosoWebsite.ps1.zip", "configurationFunction": "ContosoWebsite.ps1\\ContosoWebsite", "Properties": {"MachineName": "TutorialDSC"} }'

Set-AzVMExtension -ExtensionName "DSC" -ResourceGroupName $resourceGroup -VMName $vmName `
  -Publisher "Microsoft.Powershell" -ExtensionType "DSC" -TypeHandlerVersion 2.19 `
  -SettingString $PublicSettings -Location $location
