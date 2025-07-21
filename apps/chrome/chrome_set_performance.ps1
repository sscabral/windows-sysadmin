# Registry path
$regPath = "HKLM:\SOFTWARE\Policies\Google\Chrome"

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Created registry path: $regPath"
}

# Set HighEfficiencyModeEnabled = 1 (enable and lock Memory Saver)
New-ItemProperty -Path $regPath -Name "HighEfficiencyModeEnabled" -Value 1 -PropertyType DWORD -Force | Out-Null
Write-Host "✅ Set 'HighEfficiencyModeEnabled' = 1"

# Set MemorySaverModeSavings = 2 (savings level: 2 = maximum)
New-ItemProperty -Path $regPath -Name "MemorySaverModeSavings" -Value 2 -PropertyType DWORD -Force | Out-Null
Write-Host "✅ Set 'MemorySaverModeSavings' = 2"
