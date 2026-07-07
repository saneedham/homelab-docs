#!/usr/bin/env bash

# scripts/collect-specs.sh
# Simple script to collect system specifications from defined hosts
# Usage: ./scripts/collect-specs.sh <ssh_user>

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <ssh_user>"
  exit 1
fi

USER=$1
HOSTS=(
  "severn:10.0.0.4"
  "torridge:10.0.0.8"
  "taw:10.0.0.2"
)

OUTPUT="specs_output.txt"

# Clean start
> "$OUTPUT"

echo "Collecting system specs..." >> "$OUTPUT"

for entry in "${HOSTS[@]}"; do
  IFS=':' read -r name ip <<< "$entry"
  echo "\n=== $name ($ip) ===" >> "$OUTPUT"

  # Detect if we should run locally (i.e., we are on Taw)
  if [[ "$name" == "taw" || "$ip" == "$(hostname -I | awk '{print $1}')" || "$ip" == "$(hostname -i)" ]]; then
    # Run commands directly on this machine
    local_output=$(uname -a 2>/dev/null)
    if command -v lsb_release >/dev/null 2>&1; then
      local_output+=$(lsb_release -a 2>/dev/null | tr '\n' ' ')
    else
      local_output+=$(cat /etc/os-release 2>/dev/null | tr '\n' ' ')
    fi
    local_output+=$(free -h 2>/dev/null | tr '\n' ' ')
    local_output+=$(df -h 2>/dev/null | tr '\n' ' ')
    echo "$local_output" >> "$OUTPUT"
  else
    # Remote machine via SSH
    ssh -o BatchMode=yes -o ConnectTimeout=5 $USER@$ip \ \
      "uname -a && lsb_release -a || cat /etc/os-release && free -h && df -h" >> "$OUTPUT" 2>/dev/null
    if [ $? -ne 0 ]; then
      echo "  [FAILED to connect]" >> "$OUTPUT"
    fi
  fi
  echo "────────────────────────" >> "$OUTPUT"

done

echo "Done. Output written to $OUTPUT"
