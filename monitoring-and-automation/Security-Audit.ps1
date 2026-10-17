# NexaCore Solutions - Basic Active Directory Security Audit
# Read-only checks. Does not change users, groups, or domain settings.

$ErrorActionPreference = "Stop"

try {
    Import-Module ActiveDirectory -ErrorAction Stop

    $domain = Get-ADDomain
    $reportDirectory = Join-Path $PSScriptRoot "Reports"
    New-Item -Path $reportDirectory -ItemType Directory -Force | Out-Null

    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $reportPath = Join-Path $reportDirectory "Security-Audit-$timestamp.txt"

    $users = Get-ADUser -Filter * -Properties Enabled, Department
    $enabledCount = @($users | Where-Object { $_.Enabled }).Count
    $disabledCount = @($users | Where-Object { -not $_.Enabled }).Count

    $domainAdmins = Get-ADGroupMember -Identity "Domain Admins" -Recursive |
        Select-Object Name, SamAccountName, ObjectClass

    $lines = @(
        "NexaCore Solutions - Active Directory Security Audit"
        "Audit timestamp: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        "Domain: $($domain.DNSRoot)"
        "Domain controller: $env:COMPUTERNAME"
        ""
        "=== User account summary ==="
        "Total user accounts: $(@($users).Count)"
        "Enabled accounts: $enabledCount"
        "Disabled accounts: $disabledCount"
        ""
        "=== Domain Admins membership ==="
    )

    if (@($domainAdmins).Count -gt 0) {
        $lines += ($domainAdmins | Format-Table -AutoSize | Out-String).TrimEnd()
    } else {
        $lines += "No members returned. Verify the group and permissions."
    }

    $lines += ""
    $lines += "Note: This is a basic read-only lab audit, not a complete security assessment."

    $lines | Set-Content -Path $reportPath -Encoding UTF8

    Write-Host "`nNexaCore Active Directory Security Audit" -ForegroundColor Cyan
    Write-Host "Domain: $($domain.DNSRoot)"
    Write-Host "Total users: $(@($users).Count)"
    Write-Host "Enabled: $enabledCount | Disabled: $disabledCount"
    Write-Host "Report saved to: $reportPath" -ForegroundColor Green
    Write-Host "`nDomain Admins members:"
    $domainAdmins | Format-Table -AutoSize
}
catch {
    Write-Error "Security audit failed: $($_.Exception.Message)"
}
