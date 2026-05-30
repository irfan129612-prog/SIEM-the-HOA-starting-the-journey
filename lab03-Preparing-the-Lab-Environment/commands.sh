nano commands.sh
Paste:
#!/bin/bash

sudo apt update
sudo apt install virtualbox -y

virtualbox --help

ip addr show
hostname -I
ip route

ping -c 4 google.com
