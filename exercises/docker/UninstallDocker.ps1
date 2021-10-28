Get-PackageProvider -Name *Docker*

Uninstall-Package -Name docker -ProviderName DockerMsftProvider

Uninstall-Module -Name DockerMsftProvider
