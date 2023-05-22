# before starting, make sure env variable "Sitecore_GraphQL_ExposePlayground" is set to "true"

$FileToUpload = "C:\Users\Martin\Pictures\man2x.png"
$MediaDestination = "Default Website/new media"
$Hostname = "xmc-perficient-introduction-158.sitecorecloud.io"

# First, obtain JWT using authorized data from user.json
$JWT = ..\Security\Request-JWT.ps1

# Next, get the upload URL from Authoring GraphQL endpoint
$Url = .\Get-MedaUploadUrl.ps1 -UploadPath $MediaDestination -JWT $JWT -EndpointUrl "https://$Hostname/sitecore/api/authoring/graphql/v1/" 

# Finally, upload the media files using upload URL and JWT
$Media = .\Upload-Media.ps1 -UploadUrl $Url -JWT $JWT -FilePath $FileToUpload

# Get the result
$Media