Write-Output "Machine name:$env:COMPUTERNAME"
$loggedUser = (Get-WMIObject -ClassName Win32_ComputerSystem | select username).username
Write-Output "Logged-In User: $loggedUser"
Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,FreeSpace
