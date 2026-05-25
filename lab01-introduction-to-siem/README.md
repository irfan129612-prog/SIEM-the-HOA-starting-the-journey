# 🧪 Lab 01: Introduction to SIEM

## 📌 Lab Summary

This lab introduces Security Information and Event Management (SIEM) and demonstrates its core functions using Wazuh in a cloud-based Ubuntu environment.

The lab focuses on:

- SIEM deployment
- Log collection
- Log correlation
- Alerting through Wazuh Dashboard

---

## 🎯 Objectives

- Understand what SIEM is and why it is important in cybersecurity.
- Identify key SIEM functions including log collection, correlation, and alerting.
- Deploy Wazuh as an open-source SIEM solution.
- Configure custom log monitoring and correlation rules.
- Verify alerts through terminal logs and Wazuh Dashboard.

---

## 🛠️ Tools Used

- AWS EC2 Ubuntu
- MobaXterm
- Docker
- Docker Compose
- Wazuh
- Wazuh Dashboard
- Web Browser

---

## 🖥️ Lab Environment

Wazuh was deployed on an AWS EC2 Ubuntu instance using Docker Compose.  
The Wazuh Dashboard was accessed from a Windows machine using the EC2 public IP address.

---

## ✅ Task 1: Setting Up Wazuh SIEM

Wazuh was selected as the open-source SIEM platform.

### Commands

```bash
git clone https://github.com/wazuh/wazuh-docker.git -b v4.14.5
cd wazuh-docker/single-node
sudo docker compose -f generate-indexer-certs.yml run --rm generator
sudo docker compose up -d
sudo docker ps
Dashboard Access
https://EC2_PUBLIC_IP

Default credentials:

Username: admin
Password: SecretPassword
✅ Task 2: Log Collection

Wazuh was configured to monitor system logs, Apache logs, and a custom JSON log file.

Configuration File
nano ~/wazuh-docker/single-node/config/wazuh_cluster/wazuh_manager.conf
Added Configuration
<localfile>
  <log_format>syslog</log_format>
  <location>/var/log/syslog</location>
</localfile>

<localfile>
  <log_format>apache</log_format>
  <location>/var/log/apache2/access.log</location>
</localfile>

<localfile>
  <log_format>json</log_format>
  <location>/var/ossec/logs/test.json</location>
</localfile>
Restart Manager
sudo docker restart single-node-wazuh.manager-1
Verify Logs
sudo docker exec -it single-node-wazuh.manager-1 bash
tail -f /var/ossec/logs/ossec.log
✅ Task 3: Log Correlation

A custom correlation rule was created to detect failed login attempts.

Rule File
cat > /var/ossec/etc/rules/local_rules.xml << 'EOF'
<group name="custom,json,">
  <rule id="100100" level="10">
    <decoded_as>json</decoded_as>
    <field name="event_action">login</field>
    <field name="login_status">failure</field>
    <description>Failed login attempt detected</description>
  </rule>
</group>
EOF
Restart Wazuh
/var/ossec/bin/wazuh-control restart
Trigger Test Event
echo '{"event_action":"login","login_status":"failure","user":"attacker"}' >> /var/ossec/logs/test.json
Verify Alert
tail -n 50 /var/ossec/logs/alerts/alerts.log

Expected output:

Rule: 100100 (level 10) -> 'Failed login attempt detected'
✅ Task 4: Alerting

Alerting was verified using the Wazuh Dashboard.

Dashboard Path
Security Operations → Threat Hunting
Search Query
rule.id:100100

The alert was successfully displayed in the Wazuh web interface.
