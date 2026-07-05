# SIEM Lab 25 – Basic Incident Response Workflow

## Lab Objectives

* Understand the incident response lifecycle.
* Simulate a security incident using Fail2Ban.
* Record incident data within ELK Stack.
* Investigate security events and document findings.
* Complete incident closure documentation.

---

# Introduction

Incident Response is a structured process used to identify, investigate, contain, eradicate, and recover from security incidents. Effective response minimizes operational impact and improves organizational security posture.

---

# Section 1: Simulate a Security Incident

## Task 1 – Configure Fail2Ban

Fail2Ban was installed and configured to monitor SSH authentication failures.

### Install Fail2Ban

```bash
sudo apt update
sudo apt install fail2ban -y
```

### Configure SSH Protection

```ini
[sshd]
enabled = true
port = ssh
logpath = /var/log/auth.log
bantime = 3600
findtime = 600
maxretry = 3
```

### Restart Service

```bash
sudo systemctl restart fail2ban
```

### Verification

```bash
sudo fail2ban-client status sshd
```

### Result

Fail2Ban SSH monitoring was successfully enabled.

---

## Simulated Incident

Three failed SSH login attempts were generated.

```bash
sudo logger "Failed password for invalid user admin from 192.168.1.200 port 22 ssh2"
```

### Result

Authentication failures were recorded in system logs.

---

# Section 2: Record Steps in SIEM

## Task 2 – Integrate Fail2Ban with ELK

A Logstash pipeline was created to ingest Fail2Ban logs.

```ruby
input {
  file {
    path => "/var/log/fail2ban.log"
    start_position => "beginning"
  }
}

filter {
  grok {
    match => {
      "message" => "%{TIMESTAMP_ISO8601:timestamp} %{WORD:level} \\[%{WORD:program}\\] %{GREEDYDATA:details}"
    }
  }
}

output {
  elasticsearch {
    hosts => ["https://localhost:9200"]
    index => "fail2ban-%{+YYYY.MM.dd}"
  }
}
```

### Result

Fail2Ban logs were forwarded to Elasticsearch.

---

## Incident Assignment

| Field          | Value               |
| -------------- | ------------------- |
| Incident Owner | analyst_user        |
| Severity       | Medium              |
| Status         | Under Investigation |

### Analyst Comment

Multiple failed SSH login attempts were observed from source IP 192.168.1.200. Monitoring and investigation procedures were initiated.

---

# Section 3: Incident Closure

## Incident Analysis

### Incident Details

| Field               | Value                       |
| ------------------- | --------------------------- |
| Incident Type       | Repeated SSH Login Failures |
| Affected Service    | OpenSSH                     |
| Source IP           | 192.168.1.200               |
| Detection Tool      | Fail2Ban                    |
| Monitoring Platform | ELK Stack                   |

---

## Response Actions

1. Enabled Fail2Ban monitoring.
2. Reviewed authentication logs.
3. Identified repeated failed login attempts.
4. Forwarded events to ELK.
5. Investigated source activity.
6. Confirmed no successful compromise occurred.

---

## Resolution

No evidence of unauthorized access was identified.

The incident was successfully contained and monitored.

### Incident Status

Closed

---

## Preventative Measures

* Enforce strong password policies.
* Enable multi-factor authentication.
* Monitor authentication logs continuously.
* Review SSH access controls periodically.

---

# Screenshots

### Screenshot 1

Fail2Ban SSH jail status.

### Screenshot 2

Fail2Ban events visible in Kibana.

### Screenshot 3

Incident summary and closure documentation.

---

# Key Concepts Learned

## Incident Response

Structured handling of cybersecurity incidents.

## Detection

Identifying suspicious activity through monitoring systems.

## Investigation

Analyzing collected security events.

## Containment

Limiting potential impact of threats.

## Lessons Learned

Implementing preventative measures following incident closure.

---

# Conclusion

This lab demonstrated a complete basic incident response workflow using Fail2Ban and ELK Stack. Failed SSH login attempts were simulated, collected within the SIEM platform, investigated, documented, and formally closed. The exercise provided practical experience with incident handling and security monitoring processes.
