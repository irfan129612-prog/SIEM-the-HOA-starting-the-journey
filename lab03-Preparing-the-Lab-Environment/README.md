# 🧪 Lab 03: Preparing the Lab Environment

## 📌 Introduction

This lab focuses on preparing a virtual environment for SIEM and cybersecurity experiments using an Ubuntu-based AWS EC2 virtual machine accessed through MobaXterm.

---

# 🎯 Objectives

- Understand virtualization concepts
- Prepare a virtual lab environment
- Configure networking
- Document VM IP addresses and settings

---

# 🛠️ Tools Used

- AWS EC2
- Ubuntu Linux
- MobaXterm
- Linux Networking Commands
- VirtualBox (installation attempt)

---

# ✅ Task 1: Install Virtualization Software

VirtualBox installation was attempted using Ubuntu package manager.

## Commands

```bash
sudo apt update
sudo apt install virtualbox -y
________________________________________
✅ Task 2: Create a Virtual Machine for SIEM
The AWS EC2 Ubuntu instance was used as the SIEM virtual machine environment.
VM Details
VM Name: SIEM-VM
Operating System: Ubuntu Linux
Platform: AWS EC2
Access Method: SSH using MobaXterm
________________________________________
✅ Task 3: Document IP Address and Network Settings
Commands Used
ip addr show
hostname -I
ip route
________________________________________
✅ Verify Internet Connectivity
ping -c 4 google.com
Internet connectivity was verified successfully.
________________________________________
📌 Conclusion
In this lab, a virtual environment for SIEM activities was prepared successfully using an AWS EC2 Ubuntu instance. Basic network configuration and IP address documentation were also completed.
vm_configuration.txt
Paste:
VM Name: SIEM-VM
Platform: AWS EC2
Operating System: Ubuntu Linux
Virtualization Type: Cloud Virtual Machine

Configuration:
- RAM: 2 GB+
- Storage: 20 GB+
- Network Mode: NAT/Public Internet Access
- Access Method: SSH using MobaXterm

Purpose:
This virtual machine is prepared for SIEM and cybersecurity labs.

