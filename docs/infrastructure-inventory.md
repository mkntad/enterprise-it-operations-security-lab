# Architecture and Infrastructure Inventory

## Project Overview

This document records the systems, network configuration, and core services implemented in the NexaCore Solutions Enterprise IT Operations & Security Lab.
The environment was built in VMware to practise Windows Server administration, identity management, file services, Linux monitoring, automation, and security investigation.
This is a virtual learning environment, not a production company network.

## Purpose

NexaCore Solutions is a fictional company used to model a small business IT environment. The lab focuses on core infrastructure and support operations rather than reproducing a full production network.

## Logical design

The environment contains four virtual machines on an isolated VMware host-only network.

| Hostname | Operating system | Function | Address |
|---|---|---|---|
| NEXA-DC01 | Windows Server 2022 | Active Directory Domain controller and DNS | `10.10.30.10` |
| NEXA-SRV01 | Windows Server 2022 | Department file server | `10.10.30.20` |
| NEXA-MON01 | Ubuntu Server | Monitoring and audit scripts | `10.10.30.30` |
| NEXA-WIN11-01 | Windows 11 | Domain-joined user endpoint | `10.10.30.100` | 

## Network Configuration

- Virtualisation platform: VMware Workstation
- Virtual network: VMnet3 host-only
- Subnet: 10.10.30.0/24
- Domain: ad.nexacore.local
- DNS server: `10.10.30.10`
- Addressing: Static IP addresses configured for the lab systems

Screenshot : `../evidence/ubuntu-network-check-01.png`
			 `../evidence/ubuntu-network-check-02.png`

## Known Limitations

This lab uses a single isolated subnet and a small number of virtual machines. It does not implement production-scale high availability, multi-VLAN routing, or a centralised SIEM.

## Core Services

- Active Directory: Centralised domain identity and account management.
- DNS: Name resolution for the lab domain.
- Group Policy: Workstation policy configuration and validation.
- File services: Department shares with group-based permissions.
- Linux monitoring: Health checks and system/network audit scripts.
- PowerShell automation: Selected identity and security audit tasks.

## Scope clarification

A broader conceptual network plan was considered during project planning, but the implemented lab uses one isolated subnet. The repository must describe the **implemented** topology, not imply that VLANs, routing, or firewall segmentation were configured when they were not.

## Operational checks

- Confirm each VM is connected to VMnet3.
- Confirm each static IP and subnet mask.
- Confirm that the client and member server use `10.10.30.10` for DNS.
- Confirm the domain controller is running before testing domain authentication.
- Test connectivity and DNS separately: a successful ping does not by itself prove DNS is working.

## Maintenance Notes

Update this inventory whenever a system's hostname, IP address, operating system, role, or network configuration changes. Keep the document consistent with the actual lab configuration.