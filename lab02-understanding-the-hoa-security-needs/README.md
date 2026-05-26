# 🧪 Lab 02: Understanding the HOA Security Needs

## 📌 Introduction

This lab focuses on identifying the security needs of a Home Owners Association (HOA). The lab includes asset identification, threat analysis, vulnerability assessment tools, and defining basic security goals and policies.

---

# 🎯 Objectives

- Identify HOA assets and sensitive data
- Understand potential threats and vulnerabilities
- Install basic open-source security tools
- Define initial security goals
- Create basic HOA security policies

---

# 🛠️ Tools Used

- Ubuntu Linux
- AWS EC2
- MobaXterm
- OWASP Threat Dragon
- GVM/OpenVAS

---

# ✅ Task 1: Identify HOA Assets

The following HOA assets were identified:

- Resident Information
- CCTV Logs
- Financial Records
- HOA Meeting Notes
- Wi-Fi Router
- Firewall
- Access Points

---

# ✅ Task 2: Threat Modeling

OWASP Threat Dragon was installed for threat modeling.

## Installation Commands

```bash
sudo apt update
sudo apt install snapd -y
sudo snap install threat-dragon
Verification
snap list

Threats identified:

Unauthorized access
Data breaches
Physical security threats
Weak passwords
Malware attacks
✅ Task 3: Vulnerability Assessment

GVM/OpenVAS was installed for vulnerability assessment.

Installation
sudo apt install gvm -y
Setup
sudo gvm-setup
Verification
sudo gvm-check-setup
✅ Task 4: Security Goals

Initial HOA security goals:

Protect resident privacy
Prevent unauthorized access
Secure CCTV footage
Maintain data integrity
Conduct regular audits
Provide security awareness training
✅ Task 5: Basic Security Policy

Basic HOA security policies:

Only authorized staff may access CCTV footage
Resident data must remain confidential
Strong passwords must be enforced
Systems should be updated regularly
Regular backups must be maintained
📌 Conclusion

In this lab, HOA assets and security requirements were analyzed. Threat modeling and vulnerability assessment tools were installed successfully. Initial security goals and policies were also defined to improve the HOA security posture.
