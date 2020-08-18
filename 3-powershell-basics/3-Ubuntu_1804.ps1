# linux powershell 
# windows subsystem
# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6#ubuntu-1810

get-module az

Login-AzAccount

get-azsubscription

# migration from AzureRM to AZ
# https://docs.microsoft.com/en-us/powershell/azure/migrate-from-azurerm-to-az?view=azps-3.0.0

$detectAzureRM = Get-Command -Name Get-AzureRmContext -ErrorAction SilentlyContinue
if (-not $detectAzureRM) {
    $azModule = Get-Module -ListAvailable Az -ErrorAction SilentlyContinue
    if (-not $azModule) {
        Write-Error "AzureRM commands not detected!"
    }
    else {
        Write-Output "Enable AzureRMAlias!"
        Enable-AzureRMAlias -Scope Process        
    }
}
else {
    Write-Output "Using current AzureRM commands."
}


# compatibility issues between powershell versions
$items = Get-Item .
Get-Member -InputObject $items[0]
# mem-foundation CDCommon 
# Get-Member -InputObject $Context -Name $PropertyName -MemberType Properties









