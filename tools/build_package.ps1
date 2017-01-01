# Build Package
# -------------
#
# Author: Henrik Nørfjand Stengaard
# Date:   2017-01-01
#
# A PowerShell script to build package for HstWB Installer.


Add-Type -Assembly System.IO.Compression.FileSystem


$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
$rootDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("..")
$packageDir = [System.IO.Path]::Combine($rootDir, "package")


# read package ini lines
$packageIniFile = [System.IO.Path]::Combine($packageDir, 'package.ini')
$packageIniLines = Get-Content $packageIniFile


# get package name and version from package ini lines
$packageName = ($packageIniLines | Where-Object { $_ -match '^Name' } | Select-Object -First 1) -replace '^Name=', ''
$packageVersion = ($packageIniLines | Where-Object { $_ -match '^Version' } | Select-Object -First 1) -replace '^Version=', ''


# write progress message
Write-Host "Build package '$packageName' v$packageVersion"


# compress content directories to zip files
$contentDirs = Get-ChildItem -Path $rootDir | Where-Object { $_.PSIsContainer -and $_.Name -notmatch '(package|tools)' }
foreach ($contentDir in $contentDirs)
{
	# write progress message
	Write-Host ("Compressing content '" + $contentDir.Name + "' zip file...")

	# content zip file
	$contentZipFile = [System.IO.Path]::Combine($packageDir, ($contentDir.Name + ".zip"))

	# delete content zip file, if it exists
	if (test-path -path $contentZipFile)
	{
		remove-item $contentZipFile -force
	}

	# compress content directory
	[System.IO.Compression.ZipFile]::CreateFromDirectory($contentDir.FullName, $contentZipFile, $compressionLevel, $false)	
}


# write progress message
Write-Host "Compressing package zip file..."

# package file
$packageFile = "{0}\{1}.{2}.zip" -f $rootDir, ($packageName -replace '\s', '.'), $packageVersion

# delete package file, if it exists
if (test-path -path $packageFile)
{
	remove-item $packageFile -force
}

# compress package directory
[System.IO.Compression.ZipFile]::CreateFromDirectory($packageDir, $packageFile, $compressionLevel, $false)


# write progress message
Write-Host "Done."
