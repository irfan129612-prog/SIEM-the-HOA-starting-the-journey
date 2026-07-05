# SIEM Lab 27 – Utilizing Dashboards for Executive Reporting

## Lab Objectives

* Understand the basics of executive security reporting dashboards.
* Create easy-to-read visualizations for daily incidents and event types.
* Apply meaningful labels and avoid technical jargon.
* Export and share dashboards with stakeholders.
* Gain practical experience using Grafana dashboards.

---

# Introduction

Executive reporting dashboards provide leadership teams with a concise view of organizational security posture. Instead of reviewing raw logs, executives can quickly understand incident trends, event distribution, and operational risk through visual reports.

Grafana was used in this lab to create a dashboard suitable for executive-level reporting.

---

# Task 1: Setting Up the Dashboard Environment

## Verify Grafana Installation

Grafana was deployed and accessed through a web browser.

### Access Grafana

```text
http://SERVER-IP:3000
```

### Login Credentials

```text
Username: admin
Password: admin
```

### Result

Grafana was successfully accessed and ready for dashboard creation.

---

# Task 2: Creating Charts for Daily Incidents

## Add Data Source

The built-in TestData source was selected for demonstration purposes.

```text
Connections
→ Data Sources
→ TestData
```

### Result

The data source was successfully added.

---

## Create Daily Incidents Chart

A Bar Chart visualization was created.

### Sample Dataset

| Date   | Incidents |
| ------ | --------- |
| 15-Jun | 5         |
| 16-Jun | 3         |
| 17-Jun | 7         |
| 18-Jun | 2         |
| 19-Jun | 4         |

### Configuration

**Chart Type**

```text
Bar Chart
```

**Title**

```text
Daily Security Incidents
```

**X-Axis**

```text
Date
```

**Y-Axis**

```text
Number of Incidents
```

### Result

A clear visualization showing incident trends over multiple days was successfully created.

---

# Task 3: Visualizing Top Event Types

## Create Pie Chart

A second dashboard panel was created to display event distribution.

### Sample Dataset

| Event Type          | Count |
| ------------------- | ----- |
| Failed Login        | 40    |
| Malware Alert       | 25    |
| Unauthorized Access | 15    |
| Policy Violation    | 20    |

### Configuration

**Chart Type**

```text
Pie Chart
```

**Title**

```text
Top Security Event Types
```

### Result

The pie chart displayed the proportional distribution of common security events.

---

# Task 4: Exporting and Sharing the Dashboard

## Share Dashboard

Grafana sharing functionality was used.

```text
Dashboard
→ Share
```

## Export Dashboard

```text
Dashboard
→ Export
→ Save Dashboard JSON
```

### Result

The dashboard was successfully shared and exported for executive reporting purposes.

---

# Dashboard Summary

The final dashboard included:

### Panel 1

Daily Security Incidents

Purpose:
Provide a high-level overview of incident trends.

### Panel 2

Top Security Event Types

Purpose:
Highlight the most common categories of security events.

---

# Screenshots

### Screenshot 1

Grafana Dashboard Home Screen

### Screenshot 2

Daily Security Incidents Bar Chart

### Screenshot 3

Top Security Event Types Pie Chart

### Screenshot 4

Completed Executive Reporting Dashboard

### Screenshot 5

Dashboard Share / Export Window

---

# Key Concepts Learned

## Executive Reporting

Presenting security information in a simple and understandable format.

## Data Visualization

Representing security metrics graphically for faster interpretation.

## Dashboard Design

Organizing multiple visualizations into a single reporting interface.

## Incident Trending

Tracking changes in incident volume over time.

## Event Categorization

Understanding which event types contribute most to security activity.

---

# Conclusion

In this lab, Grafana was used to create an executive-level security reporting dashboard. Visualizations were designed to communicate daily incident activity and event distribution in a simple and effective manner. The dashboard was then exported and shared, demonstrating how security information can be presented clearly to leadership teams and decision-makers.
