#$_path = "D:\Powershell\sample.txt"
function readFileCreateFiles{
	
	[CmdletBinding()]
			Param(
				[Parameter(Mandatory = $true, Position = 0)]
				[string] $_path
			 )
	try{
		
        $eachlinenumber = 1
        $reader = new-object System.IO.StreamReader ("$_path")
		while (($readEachLine = $reader.ReadLine()) -ne $null)
		{
			if(-not(Test-Path -Path D:\Powershell\$readEachLine -PathType Leaf)) {
				   
				New-Item -Path D:\Powershell\$readEachLine -ItemType file
				Write-Host "The file [$readEachLine] has been created."
			}
			else{
				   
				Write-Host "Cannot create [$readEachLine] because a file with that name already exists."
			}
			$eachlinenumber++
		}  
	}
    catch
    {
        "Invalid path"
    }
    finally
	{
		$reader.Dispose()
	}
}	