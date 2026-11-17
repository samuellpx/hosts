#!/bin/bash

while read -r ip hostname rest; do
    
    [[ -z "$ip" || "$ip" =~ ^# ]] && continue

   
    if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "[OK] $hostname -> $ip"
    else
        echo "[INVALID] $hostname -> $ip"
    fi
done < /etc/hosts
