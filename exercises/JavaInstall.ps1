﻿
function InstallJDKVersion($javaVersion, $jdkVersion, $url, $fileName, $jdkPath, $jrePath) {
Write-Host "Installing $javaVersion..." -ForegroundColor Cyan

# download
Write-Host "Downloading installer"
$exePath = "$env:USERPROFILE\$fileName"
$logPath = "$env:USERPROFILE\$fileName-install.log"
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
$client = New-Object Net.WebClient
$client.Headers.Add('Cookie', 'gpw_e24=http://www.oracle.com; oraclelicense=accept-securebackup-cookie')
$client.DownloadFile($url, $exePath)

# install
Write-Host "Installing JDK to $jdkPath"
Write-Host "Installing JRE to $jrePath" 

$arguments = "/c start /wait $exePath /s ADDLOCAL=`"ToolsFeature,PublicjreFeature`" INSTALLDIR=`"$jdkPath`" /INSTALLDIRPUBJRE=`"$jrePath`""
$proc = [Diagnostics.Process]::Start("cmd.exe", $arguments)
$proc.WaitForExit()

# cleanup
Write-Host "$javaVersion installed" -ForegroundColor Green
}
$VerbosePreference= "continue"

InstallJDKVersion "JDK 1.8 x64" 8 "https://storage.googleapis.com/appveyor-download-cache/jdk/jdk-8u221-windows-x64.exe" "jdk-8u221-windows-x64.exe" "$env:ProgramFiles\Java\jdk1.8.0" "$env:ProgramFiles\Java\jre8"

# Set Java home
[Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files (x86)\Java\jdk1.8.0", "machine")
$env:JAVA_HOME="C:\Program Files (x86)\Java\jdk1.8.0"

