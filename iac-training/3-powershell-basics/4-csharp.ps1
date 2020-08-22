
<#
$Assem = (
...add referenced assemblies here...
    )

$Source = @"
...add C# source code here...
"@

Add-Type -ReferencedAssemblies $Assem -TypeDefinition $Source -Language CSharp 
#>


# create C# DLL via add-type
param 
(
    [string]$customParameter
)
<#
Add-Type -TypeDefinition @"
     using System;
     using System.IO;
     public class CustomClass
     {
           public static int GetStringLenght(string path) {
                return path.Length;

           }
     }
"@ -OutputAssembly ".\CustomClass.dll"

#>

add-Type -Path ".\CustomClass.dll"

$result = [CustomClass]::GetStringLenght($customParameter)
write-output $result


# compile dll via CSC
# https://gallery.technet.microsoft.com/scriptcenter/c66c2a00-8a24-4412-aa00-c18bda570508
$code =’using System;  
using System.Collections.Generic;  
using System.Text; 
 
namespace PSDLL  
{  
    class Program  
    {  
        static void Main(string[] args)  
        {  
        } 
 
        public int sum(int x, int y)  
        {  
            return x + y;  
        } 
 
    }  
}’;  
$code  
$code | Out-File sourcecode.cs  
$path = Resolve-Path sourcecode.cs  
$compiler = "$($env:windir)\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
&$compiler /target:library sourcecode.cs  
dir sourcecode*


# call DLL directly  Math
[System.Math]::PI
[System.Math]::E

# collections
$x = [System.Collections.Hashtable]::new()
$x.Add("NameX","ValueY");
Write-Output $x

# Dictionary
$d = New-Object 'System.Collections.Generic.Dictionary[String,String]'
$d.Add("NameX","ValueY");
Write-Output $d
