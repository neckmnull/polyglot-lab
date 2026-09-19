$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root = Split-Path -Parent $PSScriptRoot
$catalogPath = Join-Path $root 'catalog.json'
$readmePath = Join-Path $root 'README.md'

$catalog = Get-Content -LiteralPath $catalogPath -Raw -Encoding UTF8 | ConvertFrom-Json
$readme = Get-Content -LiteralPath $readmePath -Raw -Encoding UTF8
$errors = [System.Collections.Generic.List[string]]::new()

if ($catalog.Count -lt 1) {
    $errors.Add('catalog.json must contain at least one language.')
}

$duplicatePaths = $catalog | Group-Object path | Where-Object Count -gt 1
foreach ($duplicate in $duplicatePaths) {
    $errors.Add("Duplicate catalog path: $($duplicate.Name)")
}

foreach ($entry in $catalog) {
    foreach ($field in @('language', 'family', 'path', 'command', 'expected')) {
        if ([string]::IsNullOrWhiteSpace([string]$entry.$field)) {
            $errors.Add("Missing '$field' in catalog entry: $($entry | ConvertTo-Json -Compress)")
        }
    }

    if ([string]$entry.expected -ne 'Hello, polyglot world!') {
        $errors.Add("Unexpected output contract for $($entry.language): $($entry.expected)")
    }

    $sourcePath = Join-Path $root ([string]$entry.path)
    if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
        $errors.Add("Missing source file: $($entry.path)")
        continue
    }

    $source = Get-Content -LiteralPath $sourcePath -Raw -Encoding UTF8
    if ([string]::IsNullOrWhiteSpace($source)) {
        $errors.Add("Empty source file: $($entry.path)")
    }

    $markdownPath = ([string]$entry.path).Replace('\', '/')
    if (-not $readme.Contains("(./$markdownPath)")) {
        $errors.Add("README does not link source file: $markdownPath")
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Validated $($catalog.Count) language entries." -ForegroundColor Green