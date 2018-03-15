Param(
	[Parameter(Mandatory=$true)]
	[string]$entriesSetFile,
	[Parameter(Mandatory=$true)]
	[string]$entriesSetDir,
	[Parameter(Mandatory=$true)]
	[string]$entriesCompleteDir
)

function GetIndexName($name)
{
	if (($name -replace '^[^a-z0-9]+', '') -match '^[0-9]')
	{
		$indexName = "0-9"
	}
	else
	{
		$indexName = $name.Substring(0,1)
	}

	return $indexName
}


#resolve paths
$entriesSetFile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($entriesSetFile)
$entriesSetDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($entriesSetDir)
$entriesCompleteDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($entriesCompleteDir)

# 
$entries = @()
$entries += import-csv -delimiter ';' -path $entriesSetFile -encoding utf8

foreach ($entry in $entries)
{
	$runDir = [System.IO.Path]::GetDirectoryName($entry.RunFile)
	if ($runDir -notmatch '^(0\-9|[a-z])(\\|/)')
	{
		$indexName = GetIndexName $runDir
		$runDir = Join-Path $indexName -ChildPath $runDir
	}

    $entrySetDir = Join-Path $entriesSetDir -ChildPath $runDir
    $entryCompleteDir = Join-Path $entriesCompleteDir -ChildPath $runDir
	
    if (!(test-path $entrySetDir) -or !(test-path $entryCompleteDir))
    {
        continue
    }

	$files = @()
	$files += Get-ChildItem $entrySetDir -Recurse 

	foreach($file in $files)
	{
        $entriesSetDirIndex = $file.FullName.IndexOf($entriesSetDir) + $entriesSetDir.Length + 1
        $fileRelativePath = $file.FullName.Substring($entriesSetDirIndex, $file.FullName.Length - $entriesSetDirIndex)

		$entryCompleteFile = Join-Path $entriesCompleteDir -ChildPath $fileRelativePath

		if (!(Test-Path $entryCompleteFile))
		{
			continue
		}

		Write-Host ("removing '{0}'" -f $entryCompleteFile)
		Remove-Item $entryCompleteFile -Force
	}
}