# SIEM Lab 13 – Basic SIEM Dashboards

## Overview

Security Information and Event Management (SIEM) dashboards provide a centralized view of security events and operational data. Dashboards help security analysts visualize trends, identify suspicious activities, and monitor system health in real time.

In this lab, Kibana dashboards were created using Elasticsearch data. Multiple visualizations were built to display log volume trends, top source IP addresses, and event categories.

---

## Objectives

* Understand SIEM dashboard fundamentals.
* Create visualizations in Kibana.
* Analyze security events through graphical representations.
* Build a centralized monitoring dashboard.

---

## Tools Used

* Elasticsearch
* Logstash
* Kibana
* Ubuntu Linux

---

## Task 1 – Preparing the Environment

The ELK Stack services were verified to ensure that Elasticsearch, Logstash, and Kibana were operational.

Test log data was generated and made available for dashboard visualization.

---

## Task 2 – Accessing Kibana

Kibana was accessed through a web browser.

A new dashboard was created and prepared for visualization components.

---

## Task 3 – Building Visualizations

### Log Count Over Time

A line chart was created using:

* X-Axis: @timestamp
* Y-Axis: Count

This visualization displayed event volume trends over time.

### Top 5 Source IPs

A table visualization was created using:

* Field: source.ip
* Metric: Count
* Limit: 5

This panel identified the most active source IP addresses.

### Top Event Categories

A table visualization was created using:

* Field: event.category
* Metric: Count
* Limit: 5

This panel highlighted the most common event categories.

---

## Task 4 – Final Dashboard

All visualizations were combined into a single dashboard named:

**Basic SIEM Overview**

The dashboard provided a consolidated view of security activity and event trends.

---

## Screenshots

### Screenshot 1

ELK Stack service verification.

### Screenshot 2

Dashboard creation and visualization configuration.

### Screenshot 3

Completed SIEM dashboard displaying all visualizations.

---

## Conclusion

This lab demonstrated the creation of a basic SIEM dashboard using Kibana. Visualizations such as event trends, top source IPs, and event categories were combined into a centralized dashboard, providing a foundation for security monitoring and incident analysis.
