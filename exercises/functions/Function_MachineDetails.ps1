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