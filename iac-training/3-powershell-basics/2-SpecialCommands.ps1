# https://docs.microsoft.com/en-us/powershell/scripting/install/windows-powershell-system-requirements?view=powershell-6

param
()

function commands
{
    Get-Variable
    Get-ChildItem env:*
    Get-ChildItem alias:*
    Get-ChildItem variable:*
    Get-ChildItem function:*


    Get-Alias

    #------

    $d = 1
    $d | Get-Member

    #------
    Get-Command -Name git
    Get-Command -Name csc -ErrorAction SilentlyContinue

    get-module -ListAvailable

    Get-Command -Module VpnClient
    Get-Command -Module AzureRM.Compute

    #------

    show-command

    #------

    $d = @(1,2,3)
    $d |Out-GridView

    #------

    Show-ControlPanelItem

    #------
    Show-EventLog

    #------
    Get-ControlPanelItem
    Show-ControlPanelItem -Name System

    #------
}

# scope of variables
# . .\SpecialCommands.ps1
# newvariable
function newvariable
{
    Set-Variable -Name x_v1 -Value v1 -Scope local
    Set-Variable -Name x_v1 -Value v2 -Scope 1
    $x_v1
}

#------
function global:Hello {
  Write-Host "Hello, Global"
}

function local:Hello {
  Write-Host "Hello, local"
}
<#
function script:Hello {
  Write-Host "Hello, script"
}
#>



