$_url   = "https://download.docker.com/components/engine/windows-server/17.06/docker-17.06.2-ee-7.zip"
$_dest  = "C:\Users\Administrator\Downloads\docker.zip"
$_unzip = "C:\Program Files\Docker_unzip"
Invoke-WebRequest -uri $_url -OutFile $_dest
Expand-Archive -LiteralPath $_dest -DestinationPath $_unzip

#"https://download.docker.com/components/engine/windows-server/17.06/docker-17.06.2-ee-7.zip" "C:\Users\Administrator\Downloads\docker.zip" "C:\Program Files\Docker_unzip"