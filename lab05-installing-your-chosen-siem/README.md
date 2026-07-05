# 🧪 Lab 05: Installing Your Chosen SIEM

## 📌 Lab Summary

In this lab, Elastic Stack was installed and configured as an open-source SIEM platform. The lab covered the installation of Elasticsearch, Kibana, and Logstash on an Ubuntu-based AWS lab environment.

---

## 🎯 Objectives

- Understand the installation process of an open-source SIEM.
- Install and configure Elasticsearch.
- Install and configure Kibana.
- Install and configure Logstash.
- Verify that SIEM services are running.
- Access Kibana from a Windows browser.

---

## 🛠️ Tools Used

- AWS EC2 Ubuntu
- MobaXterm
- Elasticsearch 8.8.0
- Kibana 8.8.0
- Logstash 8.8.0
- Google Chrome

---

## ✅ Task 1: Preparation and Setup

System packages were updated and Java was installed.

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-11-jdk -y
java -version
```

---

## ✅ Task 2: Installing Elasticsearch

Elasticsearch was downloaded and installed using the official `.deb` package.

```bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.8.0-amd64.deb
sudo dpkg -i elasticsearch-8.8.0-amd64.deb
```

Elasticsearch configuration file was edited:

```bash
sudo nano /etc/elasticsearch/elasticsearch.yml
```

Configuration added:

```yaml
cluster.name: myELKCluster
network.host: localhost
```

Elasticsearch service was started and enabled:

```bash
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
sudo systemctl status elasticsearch
```

---

## ✅ Task 3: Verifying Elasticsearch

Elasticsearch 8.x requires authentication. The elastic user password was reset:

```bash
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
```

Elasticsearch was verified using curl:

```bash
curl -k -u elastic:'PASSWORD_HERE' https://localhost:9200/
```

---

## ✅ Task 4: Installing Kibana

Kibana was downloaded and installed:

```bash
wget https://artifacts.elastic.co/downloads/kibana/kibana-8.8.0-amd64.deb
sudo dpkg -i kibana-8.8.0-amd64.deb
```

Kibana configuration file was edited:

```bash
sudo nano /etc/kibana/kibana.yml
```

Configuration added:

```yaml
server.host: "0.0.0.0"
server.port: 5601
```

Kibana service was started:

```bash
sudo systemctl start kibana
sudo systemctl enable kibana
sudo systemctl status kibana
```

---

## ✅ Task 5: Kibana Enrollment

Kibana required an Elasticsearch enrollment token.

Token was generated using:

```bash
sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```

Kibana verification code was generated using:

```bash
sudo /usr/share/kibana/bin/kibana-verification-code
```

Kibana was accessed from Windows browser:

```text
http://EC2_PUBLIC_IP:5601
```

---

## ✅ Task 6: Installing Logstash

Logstash was downloaded and installed:

```bash
wget https://artifacts.elastic.co/downloads/logstash/logstash-8.8.0-amd64.deb
sudo dpkg -i logstash-8.8.0-amd64.deb
```

Logstash service status was checked:

```bash
sudo systemctl status logstash
```

---

## ✅ Verification

The following services were verified:

```bash
sudo systemctl status elasticsearch
sudo systemctl status kibana
sudo systemctl status logstash
```

Kibana dashboard was successfully accessed from the Windows browser using the AWS public IP and port `5601`.

---

## 📌 Key Concepts

- **SIEM:** Security Information and Event Management
- **ELK Stack:** Elasticsearch, Logstash, and Kibana
- **Elasticsearch:** Stores and searches log data
- **Kibana:** Visualizes security data
- **Logstash:** Processes and forwards logs

---

## 🏢 Case Study: Small Business Security

A small business can use ELK Stack to collect logs from web servers, firewalls, and endpoints. Kibana can help visualize unusual login attempts, suspicious access patterns, and possible security incidents.

---

## ✅ Conclusion

In this lab, Elastic Stack was successfully installed and configured as an open-source SIEM solution. Elasticsearch, Kibana, and Logstash were installed, started, and verified. Kibana was accessed from a Windows browser using the AWS public IP address.

---
