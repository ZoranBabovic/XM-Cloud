$userJson = .\Read-UserJson.ps1

# Environment Automation Client ID and Secret (organization)
$ClientId = $userJson.endpoints.xmCloud.clientId
$ClientSecret = $userJson.endpoints.xmCloud.clientSecret

dotnet sitecore cloud login --client-id $ClientId --client-secret $ClientSecret --client-credentials true --allow-write

# $xmCloudHost = "xmc-perficient-introduction-uat.sitecorecloud.io"
# $xmCloudClientCredentialsLoginDomain = "https://auth.sitecorecloud.io" # identity server URL (why)
# $xmCloudClientCredentialsLoginAudience = "https://api.sitecorecloud.io" # To access the Sitecore deployment using the XM Cloud DevEx plugin, https://xmcloud-cm.sitecorecloud.io
# dotnet sitecore login --authority $xmCloudClientCredentialsLoginDomain --audience $xmCloudClientCredentialsLoginAudience --client-id $xmCloudClientCredentialsLoginClientId --client-secret $xmCloudClientCredentialsLoginClientSecret --cm https://$xmCloudHost --client-credentials true --allow-write true


# For non-interactive client logins using client credential flows, use the command:
