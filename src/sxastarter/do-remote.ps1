Import-Module -Name SPE
$sitecoreUri = "https://xmc-perficient-introduction-uat.sitecorecloud.io/"
$credential = Get-Credential
$session = New-ScriptSession -Username admin -Password b -ConnectionUri $sitecoreUri -Credential $credential
Invoke-RemoteScript -Session $session -Sc