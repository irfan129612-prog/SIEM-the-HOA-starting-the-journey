# 🧪 Lab 18: Network Traffic & IDS Integration (Optional)

## 📌 Lab Summary

In this lab, **Snort IDS** was installed and configured to monitor network traffic for suspicious activity. Snort alerts were integrated with the **Elastic (ELK) SIEM** platform using Logstash, allowing intrusion detection events to be centralized in Elasticsearch and visualized through Kibana. Benign network traffic was generated to validate the end-to-end log ingestion workflow.

---

## 🎯 Objectives

- Understand the role of an Intrusion Detection System (IDS)
- Install and configure Snort IDS
- Integrate Snort alerts with the ELK SIEM platform
- Generate network traffic for IDS analysis
- Verify IDS alerts in Kibana

---

## 🛠️ Tools Used

- Ubuntu Linux
- AWS EC2
- Snort IDS
- Elasticsearch
- Logstash
- Kibana
- cURL
- Ping Utility
- MobaXterm

---

## 🗂️ Lab Environment

| Component | Details |
|----------|---------|
| Operating System | Ubuntu Linux |
| Platform | AWS EC2 |
| IDS | Snort |
| SIEM Platform | Elastic Stack (ELK) |
| Log Pipeline | Logstash |
| Terminal | MobaXterm |

---

## ✅ Task 1: Install Snort IDS

Update the package repository.

```bash
sudo apt update
```

Install Snort.

```bash
sudo apt install snort -y
```

Verify the installation.

```bash
snort -V
```

### Result

- ✅ Snort installed successfully.
- ✅ Installation verified.

---

## ✅ Task 2: Configure Snort

Open the Snort configuration file.

```bash
sudo nano /etc/snort/snort.conf
```

Enable the community rule set.

```conf
include $RULE_PATH/community.rules
```

Validate the configuration.

```bash
sudo snort -T -c /etc/snort/snort.conf
```

### Result

- ✅ Snort configuration loaded successfully.
- ✅ Rule set validated without errors.

---

## ✅ Task 3: Verify ELK Services

Confirm that all ELK services are running.

```bash
sudo systemctl status elasticsearch
sudo systemctl status logstash
sudo systemctl status kibana
```

### Result

- ✅ Elasticsearch running
- ✅ Logstash running
- ✅ Kibana running

---

## ✅ Task 4: Configure Logstash for Snort Alerts

Create a Logstash pipeline configuration.

```bash
sudo nano /etc/logstash/conf.d/snort.conf
```

Configure Logstash to monitor the Snort alert file.

```text
/var/log/snort/alert
```

Restart the ELK services.

```bash
sudo systemctl restart logstash
sudo systemctl restart elasticsearch
sudo systemctl restart kibana
```

### Result

- ✅ Snort alert ingestion configured.
- ✅ Log forwarding pipeline activated.

---

## ✅ Task 5: Generate Network Traffic

Generate HTTP traffic.

```bash
curl http://example.com
```

Generate ICMP traffic.

```bash
ping -c 4 example.com
```

### Result

Benign network traffic was generated for Snort to inspect.

---

## ✅ Task 6: Verify IDS Alerts

Review Snort alert logs.

```bash
sudo cat /var/log/snort/alert
```

Verify indexed alerts in Elasticsearch.

```json
GET snort-alerts/_search
```

Search for alerts in the **Kibana Discover** section.

### Result

- ✅ Snort alerts successfully generated.
- ✅ Alerts indexed in Elasticsearch.
- ✅ Alerts visible in Kibana.

---

## 💻 Commands Used

```bash
sudo apt update

sudo apt install snort -y

snort -V

sudo nano /etc/snort/snort.conf

sudo snort -T -c /etc/snort/snort.conf

sudo systemctl status elasticsearch
sudo systemctl status logstash
sudo systemctl status kibana

sudo nano /etc/logstash/conf.d/snort.conf

sudo systemctl restart logstash
sudo systemctl restart elasticsearch
sudo systemctl restart kibana

curl http://example.com

ping -c 4 example.com

sudo cat /var/log/snort/alert
```

---

## 📋 Validation

The following tasks were successfully verified:

- ✅ Snort installed successfully
- ✅ Community rules enabled
- ✅ Configuration validated
- ✅ ELK services operational
- ✅ Logstash pipeline configured
- ✅ Test network traffic generated
- ✅ IDS alerts created
- ✅ Alerts indexed in Elasticsearch
- ✅ Alerts displayed in Kibana

---

## 📚 Key Concepts

| Concept | Description |
|----------|-------------|
| IDS | Detects suspicious or malicious network activity |
| Snort | Open-source Network Intrusion Detection System |
| Logstash | Collects, parses, and forwards log data |
| Elasticsearch | Stores and indexes IDS alerts |
| Kibana | Visualizes IDS events and dashboards |
| Network Traffic | HTTP, ICMP, and other protocols analyzed by the IDS |

---

## 📸 Screenshots

Include screenshots for:

- Snort installation
- Snort configuration (`snort.conf`)
- Configuration validation (`snort -T`)
- ELK service status
- Logstash configuration
- Snort alert log
- Generated HTTP/ICMP traffic
- Kibana Discover showing Snort alerts

---

## 📖 What I Learned

- How an IDS monitors network traffic for suspicious activity.
- How to install and configure Snort on Linux.
- How to enable and validate Snort rule sets.
- How to integrate Snort with the Elastic Stack using Logstash.
- How to generate test traffic for IDS validation.
- How to investigate IDS alerts within Kibana.

---

## ✅ Conclusion

This lab demonstrated the integration of **Snort IDS** with the **Elastic (ELK) SIEM** platform. Snort was successfully installed, configured, and validated before being connected to Logstash for centralized log collection. Benign HTTP and ICMP traffic generated IDS events, which were forwarded to Elasticsearch and visualized in Kibana. This integration illustrates how network intrusion detection can enhance SIEM capabilities by providing real-time visibility into potential security threats.
