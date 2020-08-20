Powershell core Insataller
https://github.com/PowerShell/PowerShell/releases/download/v7.0.3/PowerShell-7.0.3-win-x64.msi

Install azure module in pwsh (powershell core), not in powershell !
```
 Install-Module -Name Az
```

Commands used to login and chang the active subscription 
```
 Connect-AzAccount
 Get-AzContext
 Get-AzSubscription
 Set-AzContext -SubscriptionName 'You name of the subscription'
```
Command to enable execution of powershell script
```
 Get-ExecutionPolicy
 Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```