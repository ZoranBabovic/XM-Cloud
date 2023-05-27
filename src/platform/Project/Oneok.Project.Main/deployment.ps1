[CmdletBinding()]

Param (
    [string]
    $solutionDir = "",
    [string]
    $packageTmp = "",
    [string]
    $binSource = "",
    [string]
    $deploymentZipLocation = "",
    [string]
    $configuration = ""
)

$projectPrefix = "ONEOK"
$dockerFolder = $solutionDir + "docker\deploy\platform\"
$customPkgFolder =  $packageTmp + "__customPackage\"

Write-Host "--------------------------------------------------------------------------"
Write-Host "deployment.ps1 starting"
Write-Host "solutionDir=" $solutionDir 
Write-Host "packageTmp=" $packageTmp 
Write-Host "binSource=" $binSource 
Write-Host "deploymentZipLocation=" $deploymentZipLocation 
Write-Host "configuration=" $configuration.Trim()
Write-Host "dockerFolder=" $dockerFolder 
Write-Host "customPkgFolder=" $customPkgFolder  

#clean custom package folder
if (Test-Path -Path $customPkgFolder) {
    Remove-Item $customPkgFolder -Force  
}
New-Item $customPkgFolder -Type Directory -Force

#copy all solution configs
$source = $solutionDir + "src\platform\*\*\App_config\"
$destination = $customPkgFolder 
Copy-Item $source $destination -Recurse -Force 

#copy all sitecore folders
$source = $solutionDir + "src\platform\*\*\sitecore\"
$destination = $customPkgFolder 
Copy-Item $source $destination -Recurse -Force 

#copy dlls
$destination = $customPkgFolder + "bin\"
New-Item $destination -Type Directory -Force
$source = $binSource + $projectPrefix + "*"
if ($configuration.Trim() -eq "Release"){
    $source = $source + ".dll"
    Write-Host $source
}
Copy-Item $source $destination -Recurse -Force 

#create deployment package (azure)
if ($deploymentZipLocation -eq "\"){
    $deploymentZipLocation = $packageTmp 
}
$source = $customPkgFolder + "*"
$destination = $deploymentZipLocation + $projectPrefix + "DeploymentPackage.zip"
Compress-Archive $source $destination -Force 

#move deployable items to docker folde
if (Test-Path -Path $dockerFolder) {
    $source = $customPkgFolder + "*"
    Copy-Item $source $dockerFolder -Recurse -Force 
}


Write-Host "deployment.ps1 finished"
Write-Host "--------------------------------------------------------------------------"