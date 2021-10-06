#$content = Get-Content -Path D:\Powershell\sample.txt
#New-Item -Path D:\Powershell\$content -ItemType file

#Write-Output $content
#$content | ForEach-Object { New-Item -Path D:\Powershell\$content -ItemType file } 
 
$eachlinenumber = 1
try{
    $reader = new-object System.IO.StreamReader ("D:\Powershell\sample.txt")
    while (($readEachLine = $reader.ReadLine()) -ne $null)
    {
           if(-not(Test-Path -Path D:\Powershell\$readEachLine".txt" -PathType Leaf)) {
               
                New-Item -Path D:\Powershell\$readEachLine".txt" -ItemType file
                Write-Host "The file [$readEachLine] has been created."
            }
            else{
               
                Write-Host "Cannot create [$readEachLine] because a file with that name already exists."
            }
            $eachlinenumber++
    }  
}finally
{
    $reader.Dispose()
}