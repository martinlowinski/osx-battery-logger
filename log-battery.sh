#!/bin/bash

# Get battery data from ioreg, parse it with awk and save it to a CSV log file

ioreg -n AppleSmartBattery -r | awk -v date="$(date -u)" -f log-battery.awk >> ~/.battery-log.csv
