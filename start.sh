#!/bin/bash
set -e

# Starting Scylla
echo "Starting Scylla"
sudo service scylla-server start

j=0
while [[ $j -lt 20 ]]; do
 printf '.'
 sleep 0.3
 j=$[$j+1]
done
echo ""
echo "Scylla Started!"