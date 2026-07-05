# SIEM Lab 19 – Creating a Real-Time Dashboard

## Lab Objectives

* Understand the principles of real-time data monitoring.
* Set up a basic real-time dashboard using open-source tools.
* Explore real-time log and alert visualization.
* Configure dashboards to update at specific intervals.

---

## Prerequisites

* Basic understanding of web technologies and data visualization.
* Familiarity with Linux command-line operations.
* Access to a Linux server with internet connectivity.
* Docker installed and running.

---

# Task 1: Set Up Prometheus

## Introduction

Prometheus is an open-source monitoring and alerting toolkit used to collect and store metrics from monitored systems.

---

## Step 1.1 – Install Docker

The Docker service was installed and verified.

```bash
sudo apt update
sudo apt install -y docker.io

sudo systemctl enable docker
sudo systemctl start docker

docker --version
```

### Result

Docker was successfully installed and running.

---

## Step 1.2 – Deploy Prometheus

The official Prometheus container image was downloaded.

```bash
sudo docker pull prom/prometheus
```

Prometheus container was launched.

```bash
sudo docker run -d \
--name prometheus \
-p 9090:9090 \
prom/prometheus
```

Verify container status:

```bash
sudo docker ps
```

### Access Prometheus

```text
http://SERVER_IP:9090
```

### Result

Prometheus was successfully deployed and accessible through the web interface.

---

# Task 2: Set Up Grafana

## Introduction

Grafana is an open-source analytics and visualization platform used to create dashboards from collected metrics.

---

## Step 2.1 – Deploy Grafana

Download Grafana image.

```bash
sudo docker pull grafana/grafana
```

Run Grafana container.

```bash
sudo docker run -d \
--name grafana \
-p 3000:3000 \
grafana/grafana
```

Verify:

```bash
sudo docker ps
```

### Access Grafana

```text
http://SERVER_IP:3000
```

Default credentials:

```text
Username: admin
Password: admin
```

### Result

Grafana was successfully deployed and accessible.

---

## Step 2.2 – Configure Prometheus Data Source

Navigate to:

```text
Connections
→ Data Sources
→ Add Data Source
→ Prometheus
```

Configure the URL:

```text
http://SERVER_IP:9090
```

Click:

```text
Save & Test
```

Expected output:

```text
Data source is working
```

### Result

Prometheus was successfully connected to Grafana.

---

# Task 3: Create a Real-Time Dashboard

## Step 3.1 – Create Dashboard

Navigate to:

```text
Dashboards
→ New Dashboard
→ Add Visualization
```

Select:

```text
Prometheus
```

### Result

A new dashboard was created.

---

## Step 3.2 – Add Query

The following Prometheus query was used:

```promql
up
```

Alternative query:

```promql
rate(prometheus_http_requests_total[1m])
```

Panel Title:

```text
Prometheus Status
```

### Result

Real-time Prometheus metrics were displayed.

---

## Step 3.3 – Configure Refresh Interval

Set dashboard refresh interval:

```text
Refresh → 5s
```

This enabled automatic dashboard updates every five seconds.

### Result

The dashboard continuously refreshed and displayed real-time metric updates.

---

# Verification

## Verify Prometheus Targets

Navigate to:

```text
Status → Targets
```

Expected status:

```text
UP
```

### Verify Grafana Dashboard

Confirm:

* Dashboard loads successfully.
* Metrics are visible.
* Auto-refresh is enabled.
* Prometheus data source is connected.

### Result

Real-time monitoring dashboard was functioning successfully.

---

# Commands Used

## Install Docker

```bash
sudo apt update

sudo apt install -y docker.io

sudo systemctl enable docker

sudo systemctl start docker
```

## Verify Docker

```bash
docker --version

sudo docker ps
```

## Deploy Prometheus

```bash
sudo docker pull prom/prometheus

sudo docker run -d \
--name prometheus \
-p 9090:9090 \
prom/prometheus
```

## Deploy Grafana

```bash
sudo docker pull grafana/grafana

sudo docker run -d \
--name grafana \
-p 3000:3000 \
grafana/grafana
```

---

# Screenshots

### Screenshot 1

Prometheus Web Interface running on port 9090.

### Screenshot 2

Grafana dashboard with Prometheus configured as a data source.

### Screenshot 3

Real-time Grafana dashboard displaying live metrics with a 5-second refresh interval.

---

# Key Concepts Learned

## Prometheus

Open-source monitoring and metrics collection platform.

## Grafana

Visualization and dashboarding platform.

## Docker

Containerization platform used for deploying Prometheus and Grafana.

## Real-Time Monitoring

Continuous observation of system metrics and events.

## Dashboard Refresh Intervals

Automatic dashboard updates for near real-time visibility.

---

# Conclusion

In this lab, Prometheus and Grafana were deployed using Docker containers to create a real-time monitoring solution. Prometheus was configured as the data source, and Grafana was used to build a dashboard displaying live metrics. A refresh interval of five seconds was configured to provide near real-time visibility into monitored data. This exercise demonstrated the fundamentals of modern monitoring and dashboard creation using open-source tools.
