Param([string]$builder)
Write-Host $builder


$env:PACKER_LOG=1
$env:PACKER_LOG_PATH="packerlog.txt"

$current_directory=(Get-Item -Path ".\").FullName
$build_directory_vmware="$current_directory\output-vmware-iso\"
$build_directory_virtualbox="$current_directory\output-virtualbox-iso\"
$build_directory_hyperv1="$current_directory\output-hyperv1\"
$log_file="$current_directory\packerlog.txt"

if( Test-Path -Path $build_directory_vmware ){
   Write-Host -ForegroundColor green -BackgroundColor black Deleting $build_directory_vmware
   Remove-Item -Recurse -Force $build_directory_vmware
}

if( Test-Path -Path $build_directory_virtualbox ){
   Write-Host -ForegroundColor green -BackgroundColor black Deleting $build_directory_virtualbox
   Remove-Item -Recurse -Force $build_directory_virtualbox
}

if( Test-Path -Path $build_directory_hyperv1 ){
   Write-Host -ForegroundColor green -BackgroundColor black Deleting $build_directory_vmware
   Remove-Item -Recurse -Force $build_directory_vmware
}

if( Test-Path -Path $log_file ){
   Write-Host -ForegroundColor green -BackgroundColor black Deleting $log_file
   Remove-Item  $log_file
   Write-Host -ForegroundColor green -BackgroundColor black Creating $log_file
   New-Item $log_file > $null
}


$variables = Get-Content variables.json
[regex]$regex='\"version\"\: \"([0-9]*\.[0-9]*\.)([0-9]*)\"'
$version = [regex]::Matches([string]$variables,$regex).groups[1]
$minor_version = [regex]::Matches([string]$variables,$regex).groups[2].Value
$minor_version_int = [int]$minor_version
$minor_version_int++

$new_version="`"version`": `"$version$minor_version_int`""

$variables | % { $_ -Replace $regex, "$new_version" } |  Out-File  -Encoding ASCII  "variables.json"

Write-Host -ForegroundColor green -BackgroundColor black New version : $version$minor_version_int


if (!$builder) {
packer build -var-file="variables.json" -on-error=ask debian9.json
}
else {
packer build -var-file="variables.json" -only="$builder" -on-error=ask debian9.json
}
