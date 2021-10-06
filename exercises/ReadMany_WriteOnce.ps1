Get-ChildItem D:\Powershell\scripts\exercises\functions -include *.ps1 -rec | 
ForEach-Object {gc $_; " "} | 
out-file D:\Powershell\scripts\exercises\functions\AllinOneScript.ps1
get-childitem -path D:\Powershell -Recurse