$statusCode = wget https://jsonplaceholder.typicode.com/todos/1 | % {$_.StatusCode}
if($statusCode -eq 200){
    
    write-host("Site is OK!")
    $webRequestObj = Invoke-WebRequest -Uri "https://jsonplaceholder.typicode.com/todos/1"
    $JSON = $webRequestObj.content
    $PSObject = $JSON | ConvertFrom-Json
    $UserID = $PSObject[0].userId
    $status = $PSObject[0].completed
    Write-Output "  "
    Write-Output "Site Data: $JSON"
    Write-Output "UserID: $UserID, Status: $status"  
}
else{
    
    write-host("The Site may be down, please check!")
}
