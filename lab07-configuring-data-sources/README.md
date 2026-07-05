# 🧪 Lab 07: Configuring Data Sources

## 📌 Lab Summary

In this lab, **Syslog-ng** was installed and configured to collect system logs for SIEM monitoring. Test log events were generated using the Linux `logger` utility and verified to ensure successful real-time log collection and ingestion.

---

## 🎯 Objectives

- Identify common data sources for SIEM log collection
- Install and configure Syslog-ng
- Generate test log events
- Verify real-time log ingestion

---

## 🛠️ Tools Used

- Ubuntu Linux
- AWS EC2
- Syslog-ng
- Linux Logger Utility
- MobaXterm

---

## ✅ Task 1: Identify Data Sources

The following log sources were identified for SIEM integration:

- Ubuntu Linux System Logs
- Windows Event Logs
- Router/Firewall Logs

---

## ✅ Task 2: Install and Configure Syslog-ng

### Update the System

```bash
sudo apt-get update
```

### Install Syslog-ng

```bash
sudo apt-get install syslog-ng -y
```

### Configure Syslog-ng

The following configuration was added to collect local system logs and store them in `/var/log/messages`.

```conf
source s_local {
    system();
    internal();
};

destination d_local {
    file("/var/log/messages");
};

log {
    source(s_local);
    destination(d_local);
};
```

---

## ✅ Task 3: Verify Data Ingestion

### Generate a Test Log

```bash
logger "Test log from SIEM Lab 07"
```

### Monitor the Log File

```bash
tail -f /var/log/messages
```

The generated log entry appeared successfully, confirming that Syslog-ng was collecting and writing logs in real time.

---

## 📋 Validation

The following log attributes were successfully verified:

- ✅ Timestamp
- ✅ Hostname / Device Identifier
- ✅ Log Formatting
- ✅ Event Message

---

## 📚 Key Concepts

| Concept | Description |
|---------|-------------|
| Data Source | A system or device that generates logs for SIEM analysis |
| Syslog-ng | A log management service used to collect and forward system logs |
| Logger | Linux utility used to generate custom log messages |
| Data Ingestion | The process of collecting logs into a SIEM platform |
| Real-Time Monitoring | Continuous observation of incoming log events |

---

## 📖 What I Learned

- How SIEM platforms collect data from different sources
- How to install and configure Syslog-ng
- How to generate custom log events using the `logger` command
- How to verify successful log ingestion using live log monitoring
- The importance of validating log structure before analysis

---

## ✅ Conclusion

In this lab, Syslog-ng was successfully installed and configured as a log collection service. Test log events were generated using the Linux `logger` utility and verified through real-time monitoring of the log file. This lab provided practical experience in configuring SIEM data sources and validating successful log ingestion, forming the foundation for future log analysis and threat detection activities.
