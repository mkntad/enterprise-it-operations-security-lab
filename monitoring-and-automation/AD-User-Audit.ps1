# NexaCore Solutions - Active Directory User Audit
# Read-only: exports user details to a timestamped CSV.

$ErrorActionPreference = "Stop"

try {
    Import-Module ActiveDirectory -ErrorAction Stop

    $domain = Get-ADDomain
    $reportDirectory = Join-Path $PSScriptRoot "Reports"
    New-Item -Path $reportDirectory -ItemType Directory -Force | Out-Null

    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $reportPath = Join-Path $reportDirectory "AD-User-Audit-$timestamp.csv"

    $users = Get-ADUser -Filter * -Properties Department, Enabled, LastLogonDate |
        Sort-Object Name |
        Select-Object Name, SamAccountName, Enabled, Department, LastLogonDate

    $users | Export-Csv -Path $reportPath -NoTypeInformation -Encoding UTF8

    Write-Host "`nNexaCore Active Directory User Audit" -ForegroundColor Cyan
    Write-Host "Domain: $($domain.DNSRoot)"
    Write-Host "Users found: $(@($users).Count)"
    Write-Host "Report saved to: $reportPath" -ForegroundColor Green
}
catch {
    Write-Error "AD user audit failed: $($_.Exception.Message)"
}
