## Linux Monitoring and Automation

These three scripts are for `NEXA-MON01`. They perform basic read-only checks.

- `health-check.sh`: creates a timestamped health report under `~/monitoring/reports/`.
Screenshot : `../evidence/ubuntu-health-check-output-01.png`
			 `../evidence/ubuntu-health-check-output-02.png`

- `system-audit.sh`: reports OS, kernel, uptime, memory, disk, addresses, listening sockets, and running services.
Screenshot : `../evidence/ubuntu-system-audit-output-01.png`
             `../evidence/ubuntu-system-audit-output-02.png`

- `network-check.sh`: tests lab IP reachability and queries the AD DNS server.
Screenshot : `../evidence/ubuntu-network-connectivity-check.png`

## These two scripts are for	`NEXA-DC01` :

-`Security-Audit.ps1`	C:\SecurityAudit\	Reviews basic domain security information, user account status, and Domain Admins membership.
Screenshot : `../evidence/windows-security-audit-02.png`
			 `../evidence/windows-security-audit-01.png`

-`AD-User-Audit.ps1`	C:\ITAutomation\	Exports user details and account status to a CSV report.
Screenshot : `../evidence/active-directory-user-audit.png`


## Operational notes

- Run shell scripts with the least privilege needed.
- Use absolute paths in scheduled jobs where practical.
- Verify that a scheduled task or cron entry runs successfully; the presence of a schedule alone is not proof of execution.
- Use timestamps in reports so that results can be compared.
- Check script exit codes and handle unreachable hosts clearly.
- Avoid uploading logs containing passwords, tokens, personal information, or unrelated machine details.
