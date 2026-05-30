param(
    [switch]$NoInstall,
    [switch]$NoLocalization
)

$ErrorActionPreference = 'Stop'

$ModDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$StageDir = Join-Path $ModDir 'active_stage'
$PakPath = Join-Path $ModDir 'patch3_c3balance.pak'
$LanguageStageDir = Join-Path $ModDir 'localization_stage\ChineseT2'
$LanguagePakPath = Join-Path $ModDir 'patch_localization_chineset2.pak'
$GameRoot = (Resolve-Path -LiteralPath (Join-Path $ModDir '..\..')).Path
$LivePakPath = Join-Path $GameRoot 'Patch\patch3.pak'
$LiveLanguagePakPath = Join-Path $GameRoot 'Patch\localization\ChineseT2.pak'

function Normalize-PathForCompare {
    param([Parameter(Mandatory)][string]$Path)
    return [IO.Path]::GetFullPath($Path).TrimEnd('\').ToLowerInvariant()
}

function Test-HardLinkTarget {
    param(
        [Parameter(Mandatory)][string]$Source,
        [Parameter(Mandatory)][string]$Target
    )

    if (!(Test-Path -LiteralPath $Source -PathType Leaf) -or !(Test-Path -LiteralPath $Target -PathType Leaf)) {
        return $false
    }

    $sourceFull = [IO.Path]::GetFullPath($Source)
    $targetNorm = Normalize-PathForCompare $Target
    $drive = [IO.Path]::GetPathRoot($sourceFull).Substring(0, 2)

    try {
        $links = & fsutil hardlink list $sourceFull 2>$null
        foreach ($line in $links) {
            $path = $line.Trim()
            if ([string]::IsNullOrWhiteSpace($path)) {
                continue
            }
            if ($path.StartsWith('\')) {
                $path = "$drive$path"
            }
            if ((Normalize-PathForCompare $path) -eq $targetNorm) {
                return $true
            }
        }
    } catch {
        return $false
    }

    return $false
}

function New-PakFromDirectory {
    param(
        [Parameter(Mandatory)][string]$SourceDir,
        [Parameter(Mandatory)][string]$OutputPak
    )

    if (!(Test-Path -LiteralPath $SourceDir -PathType Container)) {
        throw "Missing stage directory: $SourceDir"
    }

    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem

    $files = @(Get-ChildItem -LiteralPath $SourceDir -Recurse -File | Sort-Object FullName)
    if ($files.Count -eq 0) {
        throw "Stage directory contains no files: $SourceDir"
    }

    $memory = [IO.MemoryStream]::new()
    $zip = [IO.Compression.ZipArchive]::new($memory, [IO.Compression.ZipArchiveMode]::Create, $true)

    try {
        foreach ($file in $files) {
            $relative = $file.FullName.Substring($SourceDir.Length)
            while ($relative.StartsWith('\') -or $relative.StartsWith('/')) {
                $relative = $relative.Substring(1)
            }
            $relative = $relative.Replace('\', '/')

            if ([string]::IsNullOrWhiteSpace($relative)) {
                throw "Empty pak entry for: $($file.FullName)"
            }

            $entry = $zip.CreateEntry($relative, [IO.Compression.CompressionLevel]::Optimal)
            $entryStream = $entry.Open()
            $fileStream = [IO.File]::OpenRead($file.FullName)
            try {
                $fileStream.CopyTo($entryStream)
            } finally {
                $fileStream.Dispose()
                $entryStream.Dispose()
            }
        }
    } finally {
        $zip.Dispose()
    }

    [IO.File]::WriteAllBytes($OutputPak, $memory.ToArray())
    $memory.Dispose()

    return $files.Count
}

function Get-Sha256File {
    param([Parameter(Mandatory)][string]$Path)

    $sha = [Security.Cryptography.SHA256]::Create()
    $stream = [IO.File]::OpenRead($Path)
    try {
        return ([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-', '')
    } finally {
        $stream.Dispose()
        $sha.Dispose()
    }
}

function Install-HardLinkPak {
    param(
        [Parameter(Mandatory)][string]$SourcePak,
        [Parameter(Mandatory)][string]$LivePak
    )

    $liveDir = Split-Path -Parent $LivePak
    New-Item -ItemType Directory -Force -Path $liveDir | Out-Null

    if (!(Test-HardLinkTarget -Source $SourcePak -Target $LivePak)) {
        if (Test-Path -LiteralPath $LivePak -PathType Leaf) {
            $backup = "$LivePak.bak-$(Get-Date -Format yyyyMMdd-HHmmss)"
            Move-Item -LiteralPath $LivePak -Destination $backup
            Write-Host "Backed up previous live pak: $backup"
        }

        New-Item -ItemType HardLink -Path $LivePak -Target $SourcePak | Out-Null
        Write-Host "Installed hardlink: $LivePak"
    } else {
        Write-Host "Live pak is already hardlinked: $LivePak"
    }
}

function Write-PakHashes {
    param(
        [Parameter(Mandatory)][string]$SourcePak,
        [string]$LivePak
    )

    $sourceHash = Get-Sha256File -Path $SourcePak
    Write-Host "Mod pak SHA256:  $sourceHash"

    if ($LivePak -and (Test-Path -LiteralPath $LivePak -PathType Leaf)) {
        $liveHash = Get-Sha256File -Path $LivePak
        Write-Host "Live pak SHA256: $liveHash"
        if ($sourceHash -ne $liveHash) {
            throw "Live pak hash does not match mod pak: $LivePak"
        }
    }
}

Write-Host "Stage: $StageDir"
Write-Host "Output: $PakPath"
$entryCount = New-PakFromDirectory -SourceDir $StageDir -OutputPak $PakPath
Write-Host "Packed $entryCount file(s)."

if (!$NoInstall) {
    Install-HardLinkPak -SourcePak $PakPath -LivePak $LivePakPath
} else {
    Write-Host "Skipped live install because -NoInstall was supplied."
}

Write-PakHashes -SourcePak $PakPath -LivePak $(if (!$NoInstall) { $LivePakPath } else { $null })

if (!$NoLocalization) {
    Write-Host "Language stage: $LanguageStageDir"
    Write-Host "Language output: $LanguagePakPath"
    $languageEntryCount = New-PakFromDirectory -SourceDir $LanguageStageDir -OutputPak $LanguagePakPath
    Write-Host "Packed $languageEntryCount language file(s)."

    if (!$NoInstall) {
        Install-HardLinkPak -SourcePak $LanguagePakPath -LivePak $LiveLanguagePakPath
    } else {
        Write-Host "Skipped live language install because -NoInstall was supplied."
    }

    Write-PakHashes -SourcePak $LanguagePakPath -LivePak $(if (!$NoInstall) { $LiveLanguagePakPath } else { $null })
} else {
    Write-Host "Skipped localization pak because -NoLocalization was supplied."
}
