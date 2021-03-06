 
#$_machineName = C035LMAA
function machineDetails
{
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true, Position = 0)]
            [string] $_machineName
	     )
   
    try
    {
    	if ("C035LMAA" -Contains $_machineName)
        {
               
            Write-Output "Machine name:$_machineName"
	        $loggedUser = (Get-WMIObject -ClassName Win32_ComputerSystem | select username).username
	        Write-Output "Logged-In User: $loggedUser"
	        Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,FreeSpace
        } else
        {
            write-host "$($_machineName) is not a valid Machine name! Please use C035LMAA"
        }        
        
    } 
    catch
    {
        write-host("Exception Catch block")
    }
}
 
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
 
#[string] $_URL = 'https://jsonplaceholder.typicode.com/todos/1'
function validateURLDownload
{
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true, Position = 0)]
            [string] $_URL
	     )
    try
    {
    
        $request= [System.Net.WebRequest]::Create($_URL)
        $response = $request.getResponse()
        if ($response.StatusCode -eq "200")
         {
            write-host("Site is OK!")
            $webRequestObj = Invoke-WebRequest -Uri $_URL
            $JSON = $webRequestObj.content
            $PSObject = $JSON | ConvertFrom-Json
            $UserID = $PSObject[0].userId
            $status = $PSObject[0].completed
            Write-Output "  "
            Write-Output "Site Data: $JSON"
            Write-Output "UserID: $UserID, Status: $status"
         }
    } catch
    {
        write-host("Site is not accessable, May DNS issue. Try again.")
    }
}
 
