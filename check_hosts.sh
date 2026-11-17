#!/bin/bash


verifica_ip_dns() {
    local host="$1"
    local ip="$2"
    local dns="$3"

    
    if [[ ! "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "[FORMAT INVALID] $host -> $ip"
        return 1
    fi

   
    if nslookup "$host" "$dns" 2>/dev/null | grep -q "$ip"; then
        echo "[VALID DNS] $host ($ip) confirmat de DNS $dns"
    else
        echo "[NECONFIRMAT DNS] $host ($ip) nu corespunde pe DNS $dns"
    fi
}

DNS_SERVER="8.8.8.8"

while read -r ip hostname rest; do
    [[ -z "$ip" || "$ip" =~ ^# ]] && continue
    verifica_ip_dns "$hostname" "$ip" "$DNS_SERVER"
done < /etc/hosts
