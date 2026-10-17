# Networking, Security and DNS Notes

## Connectivity

From Ubuntu (`NEXA-MON01`), I tested the network connection within the domain:
`
ping -c 4 10.10.30.10 (NEXA-DC01)
ping -c 4 10.10.30.20 (NEXA-SRV01)
ping -c 4 10.10.30.100 (NEXA-WIN11-01)
nslookup ad.nexacore.local 10.10.30.10
`
A failed ping can mean a host is down, disconnected, misconfigured, or blocking ICMP.
Screenshot : `../evidence/ubuntu-network-configuration.png`

## Implemented network

- VMware network: VMnet3 host-only
- Subnet: `10.10.30.0/24`
- Domain DNS server: `10.10.30.10`
- Lab machines: `10.10.30.10`, `.20`, `.30`, and `.100`

Screenshot : `../evidence/ubuntu-network-connectivity-check.png`

VMnet3 is a VMware virtual network name, not a VLAN number. The current lab is isolated and does not have a default gateway. This is intentional for the lab and means the VMs may not have Internet access.
Screenshot : `../evidence/vmware-network-adapter-configuration.png`


## DNS troubleshooting lesson

- A machine can have network connectivity while name resolution still fails.
- Test the DNS server directly when diagnosing a lookup: ` nslookup ad.nexacore.local 10.10.30.10 `

- On Ubuntu, the local resolver may show `127.0.0.53`, which is the systemd-resolved stub address. That address is a local forwarding service, not the domain controller. A direct query to `10.10.30.10` can help separate a Windows DNS issue from a local resolver configuration issue.
Screenshot : `../evidence/ubuntu-dns-resolution-troubleshooting-01.png`

### Troubleshooting order

1. Confirm the VM's network adapter is connected to VMnet3.
2. Check IP address and subnet mask.
3. Confirm the domain controller is running.
4. Test IP reachability where ICMP is allowed.
5. Test DNS directly against `10.10.30.10`.
6. Check the configured DNS server and search domain.
7. Review the exact error and recent changes before modifying settings.

Screenshot : `../evidence/ubuntu-dns-resolution-troubleshooting-02.png`

## Security Baseline and Auditing

### Principles practised

- **Least privilege:** users should receive only the access required for their role.
- **Group-based access:** use department security groups to manage file permissions.
- **Account lifecycle:** create, disable, and re-enable a test account as part of a controlled exercise.
- **Auditability:** review authentication events and retain a clear record of what was observed.
- **Safe testing:** use fictional lab accounts in an isolated virtual environment.

### Authentication event review

The lab exercise used Windows Security logs to investigate failed and successful authentication.

- **Event ID 4625:** failed logon; commonly recorded on the computer where the logon attempt was made.
- **Event ID 4624:** successful logon.
- **Event ID 4771:** Kerberos pre-authentication failure, which may appear on a domain controller for a domain authentication failure.
- **Event ID 4776:** credential validation, commonly associated with NTLM authentication.

Screenshot : `../evidence/windows-security-event-01.png`
			 `../evidence/windows-security-event-02.png`
		     `../evidence/windows-security-event-03.png`

### Evidence hygiene

Before publishing, check every screenshot and output for:
- Passwords, tokens, keys, or credentials
- Personal email addresses or unrelated personal files
- Real organisation or customer information
- Hostnames, IP addresses, or account names from outside the fictional lab

