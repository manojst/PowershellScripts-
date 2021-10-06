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