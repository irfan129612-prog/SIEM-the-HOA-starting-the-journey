# 🧪 Lab 29: Regular Expressions in Log Searches

## 📌 Lab Summary

In this lab, **Regular Expressions (Regex)** were used to search, filter, and extract valuable information from log files. Linux command-line tools and Python were utilized to identify IPv4 addresses, user identifiers, and error codes from sample logs. This exercise demonstrates how regex improves log analysis efficiency within SIEM and cybersecurity operations.

---

## 🎯 Objectives

- Understand the fundamentals of Regular Expressions (Regex)
- Search and extract IPv4 addresses from log files
- Identify user IDs using regex patterns
- Extract error codes from log entries
- Automate regex-based log analysis using Python

---

## 🛠️ Tools Used

- Ubuntu Linux
- grep
- Python 3
- Nano Editor
- Terminal

---

## 🗂️ Lab Environment

| Component | Details |
|----------|---------|
| Operating System | Ubuntu Linux |
| Log File | sample.log |
| Pattern Matching | grep (PCRE Regex) |
| Automation | Python 3 |
| Editor | Nano |

---

## ✅ Task 1: Create a Sample Log File

A sample log file was created containing login events, IP addresses, user IDs, and error messages.

### Sample Log Data

```text
2026-06-19 10:05:11 User user-123 logged in from 192.168.1.10
2026-06-19 10:15:22 User user-456 failed login from 10.0.0.5
2026-06-19 10:20:33 Error occurred [error code: ABC]
2026-06-19 10:30:45 User ID-789 logged in from 172.16.1.50
2026-06-19 10:40:55 Error occurred [error code: XYZ]
2026-06-19 10:50:10 Unauthorized access from 192.168.10.25
```

### Result

- ✅ Sample log dataset prepared for regex testing.

---

## ✅ Task 2: Extract IPv4 Addresses

### Regex Pattern

```regex
\b(?:\d{1,3}\.){3}\d{1,3}\b
```

### Command

```bash
grep -oP '\b(?:\d{1,3}\.){3}\d{1,3}\b' sample.log
```

### Result

All IPv4 addresses were successfully extracted from the log file.

---

## ✅ Task 3: Extract User IDs

### Regex Pattern

```regex
\b(user|ID)-\d+\b
```

### Command

```bash
grep -oP '\b(user|ID)-\d+\b' sample.log
```

### Result

User identifiers matching the required format were successfully identified.

---

## ✅ Task 4: Extract Error Codes

### Regex Pattern

```regex
\[error code:\s*[A-Z]+\]
```

### Extract Error Codes

```bash
grep -oP '\[error code:\s*[A-Z]+\]' sample.log
```

### Display Unique Error Codes

```bash
grep -oP '\[error code:\s*[A-Z]+\]' sample.log | sort | uniq
```

### Result

Error codes were extracted successfully, and duplicate entries were removed.

---

## ✅ Task 5: Automate Extraction Using Python

### Python Script

```python
import re

log_file_path = "sample.log"

with open(log_file_path, "r") as file:
    logs = file.readlines()

error_code_pattern = re.compile(r'\[error code:\s*[A-Z]+\]')

for line in logs:
    if error_code_pattern.search(line):
        print(line.strip())
```

### Execute the Script

```bash
python3 extract_errors.py
```

### Result

The script displayed only the log entries containing matching error codes.

---

## 💻 Commands Used

```bash
grep -oP '\b(?:\d{1,3}\.){3}\d{1,3}\b' sample.log

grep -oP '\b(user|ID)-\d+\b' sample.log

grep -oP '\[error code:\s*[A-Z]+\]' sample.log

grep -oP '\[error code:\s*[A-Z]+\]' sample.log | sort | uniq

python3 extract_errors.py
```

---

## 📋 Validation

The following tasks were successfully completed:

- ✅ Sample log file created
- ✅ IPv4 addresses extracted
- ✅ User IDs identified
- ✅ Error codes extracted
- ✅ Duplicate error codes removed
- ✅ Python automation executed successfully

---

## 📚 Key Concepts

| Concept | Description |
|----------|-------------|
| Regular Expressions (Regex) | Pattern matching technique for searching and extracting text |
| IPv4 Extraction | Identifying IP addresses within log files |
| User ID Extraction | Capturing predefined account naming formats |
| Error Code Extraction | Identifying application or system error identifiers |
| grep | Linux utility for regex-based searching |
| Python Regex (`re`) | Automates pattern matching and log parsing |

---

## 📸 Screenshots

Include screenshots for:

- Sample log file (`sample.log`)
- IPv4 extraction using `grep`
- User ID extraction
- Error code extraction
- Unique error codes output
- Python script (`extract_errors.py`)
- Python script execution output

---

## 📖 What I Learned

- How Regular Expressions simplify log searching and filtering.
- How to extract IPv4 addresses from log files.
- How to identify user IDs using custom regex patterns.
- How to locate application error codes efficiently.
- How to automate repetitive log analysis tasks using Python.
- Why regex is an essential skill for SIEM, threat hunting, and incident response.

---

## ✅ Conclusion

This lab demonstrated the practical use of **Regular Expressions (Regex)** for log analysis in cybersecurity environments. Using Linux tools and Python, important security-related information such as IP addresses, user identifiers, and error codes were successfully extracted from log files. Automating these tasks with Python improves efficiency and supports real-world SIEM operations, threat hunting, incident response, and forensic investigations.
