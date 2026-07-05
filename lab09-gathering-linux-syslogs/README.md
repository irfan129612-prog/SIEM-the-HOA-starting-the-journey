# 🧪 Lab 09: Gathering Linux Syslogs

## 📌 Lab Summary

In this lab, **rsyslog** was configured to collect and forward Linux system logs. The rsyslog service was verified, log forwarding was configured, test syslog messages were generated, and log collection was validated. Additionally, authentication logs were reviewed to understand how Linux syslogs can be used for security monitoring and intrusion detection.

---

## 🎯 Objectives

- Understand Linux syslogs
- Verify and configure the rsyslog service
- Configure syslog forwarding
- Generate and validate test log messages
- Understand the SIEM log ingestion workflow

---

## 🛠️ Tools Used

- Ubuntu Linux
- AWS EC2
- rsyslog
- Elasticsearch
- Kibana
- MobaXterm

---

## 🗂️ Lab Environment

| Component | Details |
|----------|---------|
| Operating System | Ubuntu Linux |
| Platform | AWS EC2 |
| Log Service | rsyslog |
| SIEM Platform | Elastic Stack (ELK) |
| Terminal | MobaXterm |

---

## ✅ Task 1: Verify the rsyslog Service

Check the current status of the rsyslog service.

```bash
systemctl status rsyslog
```

If the service is not running, start and enable it.

```bash
sudo systemctl start rsyslog
sudo systemctl enable rsyslog
```

---

## ✅ Task 2: Configure rsyslog

Open the rsyslog configuration file.

```bash
sudo nano /etc/rsyslog.conf
```

Enable the UDP listener by adding or uncommenting the following configuration:

```conf
module(load="imudp")
input(type="imudp" port="514")
```

---

## ✅ Task 3: Configure Log Forwarding

Add the following forwarding rule to the end of the configuration file.

```conf
*.* @localhost:5544
```

This configuration simulates forwarding Linux syslogs to a SIEM server.

---

## ✅ Task 4: Restart the rsyslog Service

Restart the rsyslog service to apply the configuration changes.

```bash
sudo systemctl restart rsyslog
```

Verify that the service is running correctly.

```bash
systemctl status rsyslog
```

---

## ✅ Task 5: Generate a Test Syslog Message

Generate a custom syslog event using the Linux `logger` utility.

```bash
logger "Test log message from $(hostname)"
```

---

## ✅ Task 6: Verify Linux Syslogs

Monitor the syslog file to confirm that the generated message appears.

```bash
tail -f /var/log/syslog
```

Alternatively, monitor logs using the system journal.

```bash
journalctl -f
```

---

## ✅ Task 7: Review Authentication Logs

Inspect authentication logs for failed login attempts.

```bash
sudo grep "Failed password" /var/log/auth.log
```

Alternative command:

```bash
journalctl | grep "Failed password"
```

This demonstrates how Linux authentication logs can be used to detect unauthorized access attempts.

---

## 💻 Commands Used

```bash
systemctl status rsyslog

sudo systemctl start rsyslog
sudo systemctl enable rsyslog

sudo nano /etc/rsyslog.conf

sudo systemctl restart rsyslog

logger "Test log message from $(hostname)"

tail -f /var/log/syslog

journalctl -f

sudo grep "Failed password" /var/log/auth.log

journalctl | grep "Failed password"
```

---

## 📋 Validation

The following tasks were successfully verified:

- ✅ rsyslog service running
- ✅ UDP listener configured
- ✅ Log forwarding rule added
- ✅ Test syslog message generated
- ✅ Syslog messages visible in `/var/log/syslog`
- ✅ Authentication logs successfully reviewed

---

## 📚 Key Concepts

| Concept | Description |
|----------|-------------|
| Syslog | Standard logging mechanism used in Linux systems |
| rsyslog | Linux service responsible for collecting and forwarding system logs |
| Log Forwarding | Sending logs from a host to a centralized SIEM platform |
| Logger | Linux utility used to generate custom syslog messages |
| Authentication Logs | Logs containing login attempts and security-related events |
| SIEM | Security Information and Event Management platform |

---

## 📸 Screenshots

Include screenshots for:

- rsyslog service status
- rsyslog configuration (`/etc/rsyslog.conf`)
- Log forwarding configuration
- Restarted rsyslog service
- Generated test log
- `/var/log/syslog` output
- Authentication log output (`Failed password`)
- Kibana Discover (if forwarding to ELK)

---

## 📖 What I Learned

- How Linux syslogs are generated and managed.
- How to configure the rsyslog service.
- How to enable log forwarding for SIEM integration.
- How to generate custom syslog events using the `logger` utility.
- How authentication logs can help detect suspicious login attempts.
- How Linux logs support centralized monitoring in a SIEM environment.

---

## ✅ Conclusion

This lab demonstrated the configuration and management of **rsyslog** for Linux system log collection. The rsyslog service was successfully configured to collect and forward logs, while custom log events were generated and validated through system log files. Authentication logs were also reviewed to illustrate their importance in security monitoring. These tasks provide a strong foundation for integrating Linux systems into a centralized SIEM platform for log analysis and threat detection.
