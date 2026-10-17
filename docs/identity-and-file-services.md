# Identity, Workstations, and File Services

## Active Directory and Access Control

The Windows Server 2022 domain controller hosts the `ad.nexacore.local` domain and DNS. The directory was organised to keep common object types separated.

```
ad.nexacore.local
└── NexaCore
    ├── Users
    │   ├── Management
    │   ├── IT
    │   ├── Finance
    │   ├── HR
    │   ├── Sales
    │   └── Operations
    ├── Computers
    ├── Servers
    ├── Groups
    └── Service Accounts
```

The built-in Domain Controllers Organizational Unit remains the home of `NEXA-DC01`. The domain controller should not be moved into the custom `NexaCore\Servers` OU.
Screenshot : [active-directory-overview](../evidence/active-directory-overview.png)

## Sample identities and groups

The lab includes fictional sample users for IT, Finance, and HR, plus department security groups such as `GG_IT`, `GG_FINANCE`, and `GG_HR`. These identities are for testing only.
Sample accounts include `daniel.moyo`, `grace.ncube`, and `sarah.dube`.

Screenshot:
* [active-directory-user-account-details-01](../evidence/active-directory-user-account-details-01.png)
* [active-directory-user-account-details-02](../evidence/active-directory-user-account-details-02.png)
* [active-directory-user-account-details-03](../evidence/active-directory-user-account-details-03.png)

# Windows 11 Endpoint and Group Policy

## Endpoint

- Hostname: `NEXA-WIN11-01`
- Lab address: `10.10.30.100`
- Domain: `ad.nexacore.local`
- DNS: `10.10.30.10`

The Windows 11 VM was joined to the domain and its computer object was placed in `NexaCore\Computers`.

## Group Policy validation

A GPO named `NexaCore - Workstation Security Baseline` was linked to the custom Computers OU.

Screenshot:  [windows-gpm](../evidence/windows-gpm.png)

## File server: `NEXA-SRV01` (`10.10.30.20`). 
Department shares:
- `\\NEXA-SRV01\IT$`
- `\\NEXA-SRV01\Finance$`
- `\\NEXA-SRV01\HR$`

Screenshot :  [windows-file-server-share-02](../evidence/windows-file-server-share-02.png)

## Evidence
Tested both allowed and denied access with the appropriate lab accounts. Shared and NTFS permissions both affect access.

## Validation performed

The Finance and HR share permissions were tested with different departmental accounts. The intended result was that a Finance user could access Finance but not HR, and an HR user could access HR but not Finance.
The IT share permissions were also tested and the same was true for all departmental groups. IT could only access their own files and access was denied for HR and Finance files.

Screenshot : 
* [active-directory-users-and-groups-03](../evidence/active-directory-users-and-groups-03.png)
* [active-directory-users-and-groups-04](../evidence/active-directory-users-and-groups-04.png)
* [active-directory-users-and-groups-05](../evidence/active-directory-users-and-groups-05.png)
* [active-directory-group-permissions-settings-01](../evidence/active-directory-group-permissions-settings-01.png)
* [active-directory-group-permissions-settings-02](../evidence/active-directory-group-permissions-settings-02.png)
* [active-directory-group-permissions-settings-03](../evidence/active-directory-group-permissions-settings-03.png)
* [windows-file-server-share-03](../evidence/windows-file-server-share-03.png)
* [windows-file-server-share-04](../evidence/windows-file-server-share-04.png)
* [windows-file-server-share-05](../evidence/windows-file-server-share-05.png)

## Access-control approach

- Used security groups to assign permissions rather than granting access user by user.
- Gave each department access only to its intended share.
- Retained administrative access for authorised administrators and SYSTEM where needed.
- Avoided broad permissions such as `Everyone: Full Control`.
- Tested both the allowed case and the denied case.
