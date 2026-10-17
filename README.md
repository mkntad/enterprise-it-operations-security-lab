# Enterprise IT Operations & Security Lab

Hands-on infrastructure lab | Windows Server | Active Directory | DNS | Group Policy | File Services | Ubuntu Monitoring | PowerShell | Incident Investigation

## Project overview

This project documents a small enterprise-style IT environment built in VMware for a fictional company, NexaCore Solutions. It simulates an environment of approximately 60 employees across Management, IT, Finance, HR, Sales, and Operations.
The lab was designed to practise common IT operations tasks: central identity management, domain-joined endpoint administration, department-based file access, infrastructure health checks, basic automation, and investigation of authentication events.

-Environment note:This is a virtual lab built for learning and portfolio demonstration. It is not a production deployment. All company names, users, and addresses are fictional/private lab values.

## What I built

- Active Directory Domain Services and DNS: Created the `ad.nexacore.local` domain and structured organisational units for users, computers, servers, groups, and service accounts.
- Identity and access management: Created sample departmental users and security groups, then tested access using least-privilege permissions.
- Windows endpoint management: Joined a Windows 11 client to the domain and linked a workstation security-baseline Group Policy Object to the intended computer Organizational Unit(OU).
- File services: Configured department shares on a member server and validated that users could access their own department's share while being denied access to other departments' shares.
- Linux monitoring: Set up an Ubuntu monitoring VM and created shell scripts for infrastructure health, system audit, and network checks.
- PowerShell automation: Created scripts to audit Active Directory users and review security-related configuration.
- Security investigation: Generated and examined authentication events, documented an incident workflow, and practised containment by disabling and subsequently re-enabling a test account.
- Technical documentation: Recorded the architecture, operational checks, troubleshooting steps, security baseline, and incident response process.

## Lab architecture

| System | Role | Lab IP |
|---|---|---|
| `NEXA-DC01` | Windows Server 2022; AD DS and DNS | `10.10.30.10` |
| `NEXA-SRV01` | Windows Server 2022; department file shares | `10.10.30.20` |
| `NEXA-MON01` | Ubuntu Server; monitoring and audit scripts | `10.10.30.30` |
| `NEXA-WIN11-01` | Domain-joined Windows 11 client | `10.10.30.100` |

- Domain: `ad.nexacore.local`
- Virtual network: VMware VMnet3 host-only network
- Subnet: `10.10.30.0/24`
- Design note: VMnet3 is the VMware virtual network identifier; it is not a VLAN ID. This lab uses one isolated subnet and does not implement the six-VLAN conceptual design.

## Repository map

- Infrastructure inventory :  [docs/infrastructure-inventory.md](docs/infrastructure-inventory.md)
- Identity, endpoint, and file services :  [docs/identity-and-file-services.md](docs/identity-and-file-services.md)
- Networking, DNS, and security notes :    [docs/network-dns-and-security.md](docs/network-dns-and-security.md)
- Incident records and response workflow : [incidents/](incidents/)
- Monitoring and automation :              [monitoring and automation/](monitoring and automation/)
- Evidence index :                         [evidence/](evidence/)
  
## Validation and evidence

The repository should include evidence that the work was tested, not just configured. Examples include:

- Domain and Organizational Unit structure in Active Directory Users and Computers
- Domain membership and Group Policy results on the Windows 11 client
- Successful and denied access tests for department shares
- Health-check output and generated reports from Ubuntu
- Relevant Windows Security event details for the authentication exercise
- Sanitised output from the PowerShell audit scripts

## Skills demonstrated

IT operations: Windows Server administration, Active Directory, DNS, Group Policy, domain joining, file services, NTFS/share permissions, Linux administration, troubleshooting.

Security: least privilege, account lifecycle, authentication-event review, audit scripting, incident documentation, containment and recovery.

Automation and documentation: Bash, PowerShell, repeatable checks, report generation, runbooks, technical writing.

## Limitations and next improvements

This is a single-subnet, host-only lab. It does not represent a complete production network and does not currently demonstrate production-scale high availability, a multi-VLAN routed design, a central SIEM, or a formal vulnerability-management platform. Future improvements could include centralised log collection, alerting, a second subnet with routing/firewall rules, and automated test cases.

