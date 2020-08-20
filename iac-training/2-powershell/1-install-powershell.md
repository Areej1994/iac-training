Install Powershell Core  (pwsh) see  link below
* https://github.com/PowerShell/PowerShell/releases/download/v7.0.3/PowerShell-7.0.3-win-x64.msi

Install azure az modules in powershell 7 console "pwsh.exe", not in system "powershell.exe"
```
Install-Module -Name Az
```

Check that you can login to azure   
```
Connect-AzAccount
```

Change the active subscription
```
Get-AzContext
Get-AzSubscription
Set-AzContext -SubscriptionName 'You name of the subscription'
```
Command to enable execution of powershell script
```
Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

