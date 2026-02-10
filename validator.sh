#!/bin/bash
# linux-basic_host_discovery.sh

function ctrl_c(){
    echo -e "\n\n[i] Saliendo...\n"
    tput cnorm
    exit 1
}

# Capturar Ctrl+C
trap ctrl_c INT

# Lista estática de rangos /24
RANGES=("172.22.0" "172.23.0" "172.17.0")

tput civis

for RANGE in "${RANGES[@]}"; do
    for i in $(seq 1 254); do
        HOST="$RANGE.$i"
        timeout 1 bash -c "ping -c 1 $HOST" &>/dev/null && echo "[+] Host $HOST - ACTIVE" &
    done
done

wait
tput cnorm