#!/usr/bin/env bash
# Basic lab network checks. ICMP failures may reflect firewall rules.
set -u
echo "NexaCore Network Check"
echo "Timestamp: $(date --iso-8601=seconds)"
echo "Source host: $(hostname)"
echo
echo "=== Local addresses ==="; ip -br address
echo
echo "=== Route table ==="; ip route
echo
echo "=== Ping tests ==="
for entry in "NEXA-DC01:10.10.30.10" "NEXA-SRV01:10.10.30.20" "NEXA-WIN11-01:10.10.30.100"; do
  name="${entry%%:*}"
  ipaddr="${entry##*:}"
  if ping -c 2 -W 2 "$ipaddr" >/dev/null 2>&1; then
    echo "$name ($ipaddr): reachable by ICMP"
  else
    echo "$name ($ipaddr): no ICMP reply; investigate host, network, and firewall"
  fi
done
echo
echo "=== DNS query against domain controller ==="
if command -v nslookup >/dev/null 2>&1; then
  nslookup ad.nexacore.local 10.10.30.10 2>&1
else
  echo "nslookup not installed; install dnsutils if package access is available"
fi
