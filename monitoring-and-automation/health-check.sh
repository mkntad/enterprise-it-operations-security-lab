#!/usr/bin/env bash
# NexaCore basic health check; saves a timestamped report.
set -u
BASE_DIR="${HOME}/monitoring"
REPORT_DIR="${BASE_DIR}/reports"
mkdir -p "$REPORT_DIR"
STAMP="$(date '+%Y%m%d-%H%M%S')"
REPORT="${REPORT_DIR}/health-report-${STAMP}.txt"

{
  echo "NexaCore Health Check"
  echo "Timestamp: $(date --iso-8601=seconds)"
  echo "Hostname: $(hostname -f 2>/dev/null || hostname)"
  echo
  echo "=== Uptime ==="; uptime
  echo
  echo "=== Memory ==="; free -h
  echo
  echo "=== Disk usage ==="; df -h
  echo
  echo "=== Network interfaces ==="; ip -br address
  echo
  echo "=== Reachability ==="
  for target in 10.10.30.10 10.10.30.20 10.10.30.100; do
    if ping -c 1 -W 2 "$target" >/dev/null 2>&1; then
      echo "$target: reachable by ICMP"
    else
      echo "$target: no ICMP reply (host may be down, disconnected, or blocking ping)"
    fi
  done
  echo
  echo "=== DNS query ==="
  if command -v nslookup >/dev/null 2>&1; then
    nslookup ad.nexacore.local 10.10.30.10 2>&1
  else
    echo "nslookup not installed"
  fi
} 2>&1 | tee "$REPORT"
echo
echo "Report saved to: $REPORT"
