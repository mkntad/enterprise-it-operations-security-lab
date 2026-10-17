# INC-001 — Suspicious Authentication Activity

Status: Closed — lab exercise  
Environment:*NexaCore Solutions virtual lab  
Severity: Low 
Date observed:2026/10/08

## 1. Summary

Several deliberate failed sign-in attempts were generated for the fictional test account `lab.securitytest` on the domain-joined Windows 11 lab endpoint.
Windows Security logs were reviewed to identify the failed attempt and a subsequent successful sign-in where available.

This was a controlled lab exercise, not a real security incident.

## 2. Detection evidence

| Field | Observed value |
|---|---|
| Event ID | 4625 |
| Event timestamp | 2026/10/08 09:40:00
| Account | `lab.securitytest` |
| Computer whose log was reviewed | NEXA-WIN11-01 |
| Logon type | 2 |
| Failure reason/status | Unknown user name or bad password |
| Related successful event | 4624 at 2026/10/08 09:41:08 |

## 3. Investigation

1. Opened Windows Event Viewer and reviewed the Security log.
2. Filtered for the relevant authentication event ID.
3. Checked the account, timestamp, workstation, logon type, and failure reason.
4. Compared related events where available to determine whether a successful sign-in followed the failed attempts.

## 4. Containment and recovery

The test account was disabled to demonstrate account containment. The account's state was then verified, and the account was re-enabled after the controlled test so the lab could continue.
## 5. Outcome and lessons

- Security logs provide evidence for authentication troubleshooting and investigation.
- Event IDs can appear on different machines depending on the authentication path.
- The investigator should record observed values rather than assume them.
- Disabling an account is a containment action, but in a real incident it should follow organisational procedures and approval.

## 6. Evidence

- Screenshot : `../evidence/windows-security-event-01.png`
               `../evidence/windows-security-event-02.png`
               `../evidence/windows-security-event-03.png`
