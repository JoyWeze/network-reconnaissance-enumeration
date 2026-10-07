#!/bin/bash

TARGET="127.0.0.1"
OUTPUT_DIR="scans"

mkdir -p "$OUTPUT_DIR"

echo "=============================================="
echo " Network Reconnaissance"
echo "=============================================="
echo
echo "Target: $TARGET"
echo

echo "[1] Basic TCP scan..."
nmap "$TARGET" -oN "$OUTPUT_DIR/basic-scan.txt"

echo
echo "[2] Service and version detection..."
nmap -sV "$TARGET" -oN "$OUTPUT_DIR/service-version-scan.txt"

echo
echo "[3] Full TCP port scan..."
nmap -p- "$TARGET" -oN "$OUTPUT_DIR/full-tcp-scan.txt"

echo
echo "[4] Common UDP ports..."
sudo nmap -sU --top-ports 20 "$TARGET" -oN "$OUTPUT_DIR/udp-top20-scan.txt"

echo
echo "[5] HTTP service enumeration on port 8000..."
nmap -sV -sC -p 8000 "$TARGET" -oN "$OUTPUT_DIR/http-service-enumeration.txt"

echo
echo "=============================================="
echo " Reconnaissance complete"
echo "=============================================="
echo
echo "Results saved in: $OUTPUT_DIR/"
