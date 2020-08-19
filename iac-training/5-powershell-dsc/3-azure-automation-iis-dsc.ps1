<# 
	.NOTES
		https://docs.microsoft.com/en-us/learn/modules/protect-vm-settings-with-dsc/4-exercise-setup-dsc-configuration
#>
Configuration Main
{

	Param ( [string] $nodeName = "localhost" )

	Import-DscResource -ModuleName PSDesiredStateConfiguration
	Import-DscResource -ModuleName xWebAdministration


	Node $nodeName 
	{
		$WindowsFeatures = @(
			"FileAndStorage-Services",
			"Storage-Services",
			"Web-Server",
			"Web-WebServer",
			"Web-Common-Http",
			"Web-Default-Doc",
			"Web-Dir-Browsing",
			"Web-Http-Errors",
			"Web-Static-Content",
			"Web-Health",
			"Web-Http-Logging",
			"Web-Performance",
			"Web-Stat-Compression",
			"Web-Security",
			"Web-Filtering"
			"Web-App-Dev",
			"Web-Net-Ext45",
			"Web-AppInit",
			"Web-ASP",
			"Web-Asp-Net45",
			"Web-ISAPI-Ext",
			"Web-ISAPI-Filter",
			"Web-Mgmt-Tools",
			"Web-Mgmt-Console"
			"NET-Framework-Features",
			"NET-Framework-45-Core",
			"NET-Framework-45-Features",
			"NET-WCF-Services45",
			"NET-WCF-TCP-PortSharing45",
			"BitLocker",
			"EnhancedStorage",
			"Windows-Defender-Features",
			"Windows-Defender",
			"Windows-Defender-Gui",
			"PowerShellRoot",
			"PowerShell",
			"PowerShell-ISE",
			"WoW64-Support"
		)

		$WindowsFeatures.ForEach({

			WindowsFeature $_
			{
				Name = $_
				Ensure = 'Present'
			}
		})
				
		xWebsite DefaultWebSite  
        { 
            Ensure          = "Absent" 
            Name            = "Default Web Site"  
            PhysicalPath    = "C:\inetpub\wwwroot" 
        } 

		Package UrlRewrite
		{
			 DependsOn = "[WindowsFeature]Web-Server", "[WindowsFeature]Web-Mgmt-Tools"
			 Ensure = "Present"
			 Path  = "https://download.microsoft.com/download/1/2/8/128E2E22-C1B9-44A4-BE2A-5859ED1D4592/rewrite_amd64_en-US.msi"
			 Name = "IIS URL Rewrite Module 2"
			 Arguments = '/L*V "C:\WindowsAzure\urlrewriter.txt" /quiet'
			 ProductId = "9BCA2118-F753-4A1E-BCF3-5A820729965C"
		}
	}
}
