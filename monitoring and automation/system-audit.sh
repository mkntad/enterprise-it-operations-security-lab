#!/usr/bin/env bash
# Basic Linux system audit; read-only.
set -u
echo "NexaCore System Audit"
echo "Timestamp: $(date --iso-8601=seconds)"
echo
echo "=== OS ==="
if [ -r /etc/os-release ]; then . /etc/os-release; echo "${PRETTY_NAME:-Unknown OS}"; fi
echo
echo "=== Kernel ==="; uname -a
echo
echo "=== Hostname ==="; hostnamectl 2>/dev/null || hostname
echo
echo "=== Uptime ==="; uptime
echo
echo "=== Memory ==="; free -h
echo
echo "=== Disk ==="; df -h
echo
echo "=== IP addresses ==="; ip -br address
echo
echo "=== Listening sockets ==="
if command -v ss >/dev/null 2>&1; then ss -lntup 2>&1; else echo "ss command unavailable"; fi
echo
echo "=== Active services (first 40) ==="
if command -v systemctl >/dev/null 2>&1; then
  systemctl list-units --type=service --state=running --no-pager 2>&1 | head -n 45
else
  echo "systemctl unavailable"
fi
