#!/bin/bash

    #Author : Franki
    #Date : 31-Jan-2023

## ---------- This script is to inventory a Linux CentOS Stream 9 Server -----------------
# Checking the OS version

echo "The OS version is $(cat /etc/*release | grep PRETTY_NAME | awk -F = '{print $2}')"
echo

# Checking the memory size

echo "The memory size is $(free -mh |grep Mem: |awk '{print $2}')"
echo

# Checking the hard drive

echo "The hard drive is $(lsblk |grep sda)"
echo

# Checking the CPU speed

echo "The CPU speed is $(lscpu |grep .Hz)"
echo

# Checking the kernel version

echo "The kernel version is $(uname -r |awk -F"x" '{print $1}')"
echo

# Checking if the system is 32 or 64 bits

echo "The system is $(getconf LONG_BIT) bits"
echo

# Checking the server's hostname

echo "The server's hostname is $(hostname)"
echo

# Checking the IP address of the server

echo "The IP address of the server is $(hostname -I | awk '{print $1}')"
echo

# Checking the DNS of the server

echo "The DNS of the server is $(dig | grep SERVER: | awk -F# '{print $1}' | awk -F: '{print $2}')"
echo

# Checking the system's manufacturer

echo "The system's manufacturer is $(dmidecode -t system |grep Manufacturer: |awk -F":" '{print $2}')"
echo

# Checking whether the system is virtual or physical

echo "The system is $(lshw -c system |grep product: |awk -F" " '{print$2}')"
echo

# Checking the MAC address of the system

echo "The MAC address is $(ip addr sh enp0s3 |grep link/ether |awk -F" " '{print $2}')"
echo

# Checking all opened ports on the system

echo "All opened ports on the system are $(lsof -i -P -n | grep LISTEN)"
echo

# Check your public IP address
echo "Your public IP Address is $(curl -s ifconfig.co)"
echo

exit 0