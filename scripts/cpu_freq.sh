#!/bin/bash

# Legge frequenza media in MHz e converte in GHz
freq=$(awk -F: '/cpu MHz/ {sum+=$2; count++} END {printf "%.2f GHz", sum/count/1000}' /proc/cpuinfo)

# Uso CPU in percentuale
usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')

echo "$usage • $freq"

