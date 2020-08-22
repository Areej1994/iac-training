<#
  .NOTES
    https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/?view=powershell-6
    https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_scopes?view=powershell-6
#>

# variable

$x_i = 1
$x_s = '123$x_i'
$x_se = "xxx$($x_s)xxx  `$"

Get-Variable

#-------

[string]$x_s1 = "x"
[bool]$x_b = $false
Get-Variable


#---------
function myfunction
{
    Write-Output "this"
}

function myfunction1
{
    param
    (
        $mytext = "345345"
    )
    Write-Output "this $mytext"
}


function myfunction2
{
    [CmdletBinding()]
    param
    (
        $mytext
    )
    Write-Output "this $mytext"
    Write-Verbose "this verbose $mytext"
}


#--------

Get-Variable -Scope local
Get-Variable -Scope global

