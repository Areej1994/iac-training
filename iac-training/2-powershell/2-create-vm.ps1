<#
  .SYNOPSIS 
    Create VM with az module commands
  .NOTES
    https://docs.microsoft.com/en-us/azure/virtual-machines/scripts/virtual-machines-windows-powershell-sample-create-vm-quick
  
  .EXAMPLE
    1) ensure that you are loged in
    2) change resource group name as required when working in group of people
#>

# Variables for common values - adjust Resource group name
$resourceGroup = 'vb-iac-taining-cli-rg'
$location = "eastus"
$vmName = "TutorialVM3"

# Create user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Create a resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create a virtual machine
New-AzVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -Image "Win2016Datacenter" `
  -VirtualNetworkName "iacVnetVM3" `
  -SubnetName "iacSubnetVM3" `
  -SecurityGroupName "iacNetworkSecurityGroupVM3" `
  -PublicIpAddressName "iacPublicIpVM3" `
  -Credential $cred `
  -Size Standard_B2S `
  -OpenPorts 3389

