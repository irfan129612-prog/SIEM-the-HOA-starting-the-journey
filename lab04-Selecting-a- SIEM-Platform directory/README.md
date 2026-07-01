# 🛡️ Lab 04 – Selecting and Deploying a SIEM Platform (Elastic Stack)

## 📌 Overview

This lab demonstrates the deployment and basic configuration of the **Elastic Stack (ELK)** as a Security Information and Event Management (SIEM) platform on Ubuntu Linux. The objective was to understand SIEM architecture, compare available solutions, and deploy the core components required for centralized log management and security monitoring.

---

## 🎯 Objectives

- Understand the role of SIEM in cybersecurity
- Compare open-source and commercial SIEM platforms
- Install and configure the Elastic Stack
- Deploy Elasticsearch, Logstash, and Kibana
- Verify service availability and readiness
- Build a foundation for future log analysis and threat detection labs

---

## 🛠️ Environment

| Component | Details |
|-----------|---------|
| Operating System | Ubuntu Linux |
| Platform | AWS EC2 |
| Java | OpenJDK 11 |
| Elasticsearch | 7.x |
| Logstash | 7.x |
| Kibana | 7.x |

---

## 🏗️ Elastic Stack Architecture

```
          Logs / Events
                │
                ▼
          Logstash
                │
                ▼
         Elasticsearch
                │
                ▼
            Kibana
      (Visualization & SIEM)
```

---

## ⚙️ Installation Steps

### 1. Update Ubuntu

```bash
sudo apt-get update && sudo apt-get upgrade -y
```

### 2. Install Java

```bash
sudo apt-get install openjdk-11-jdk -y
java -version
```

### 3. Add Elastic Repository

```bash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'

sudo apt-get update
```

### 4. Install Elasticsearch

```bash
sudo apt-get install elasticsearch -y
```

Edit configuration:

```bash
sudo nano /etc/elasticsearch/elasticsearch.yml
```

Start service:

```bash
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch
sudo systemctl status elasticsearch
```

---

### 5. Install Logstash

```bash
sudo apt-get install logstash -y
```

Edit pipeline configuration:

```bash
sudo nano /etc/logstash/conf.d/logstash.conf
```

Start service:

```bash
sudo systemctl enable logstash
sudo systemctl start logstash
sudo systemctl status logstash
```

---

### 6. Install Kibana

```bash
sudo apt-get install kibana -y
```

Edit configuration:

```bash
sudo nano /etc/kibana/kibana.yml
```

Start service:

```bash
sudo systemctl enable kibana
sudo systemctl start kibana
sudo systemctl status kibana
```

---

## ✅ Service Verification

Verify all services are running successfully.

```bash
sudo systemctl status elasticsearch
sudo systemctl status logstash
sudo systemctl status kibana
```

---

## 📚 Skills Practiced

- SIEM Fundamentals
- Elastic Stack Deployment
- Ubuntu Server Administration
- Linux Package Management
- Service Management (systemd)
- Log Collection Pipeline
- Security Monitoring Fundamentals

---
