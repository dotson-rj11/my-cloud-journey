#!/bin/bash

echo "--- SYSTEM HEALTH REPORT ---"
echo "Date and Time:"
date

echo ""
echo "Who am I logged in as?"
whoami

echo ""
echo "Disk Space Usage:"
df -h | grep '^/dev/'

echo ""
echo "Network Info:"
ip addr show eth0 | grep inet
LINE_COUNT=$(wc -l < system_logs.txt)
if [$LINE_COUNT -gt 10 ]; then
	echo "--- Log too long. Rotating... ---" > system_logs.txt
fi
