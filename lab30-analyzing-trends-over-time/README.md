# SIEM Lab 30 – Analyzing Trends Over Time

## Overview

Time-series analysis is a critical technique used in cybersecurity, monitoring, and business intelligence to identify trends, patterns, and anomalies over time. By visualizing login attempts and calculating weekly averages, analysts can detect unusual behavior and investigate potential security incidents.

This lab demonstrates how Python, Pandas, Matplotlib, and Seaborn can be used to analyze login activity trends and detect anomalies.

---

## Lab Objectives

* Load and process time-series data using Pandas.
* Create time-series visualizations.
* Compare weekly login activity.
* Detect anomalies using statistical thresholds.
* Export analysis results as images and PDF reports.

---

## Tools Used

| Tool        | Purpose                   |
| ----------- | ------------------------- |
| Python 3    | Data Analysis             |
| Pandas      | Data Processing           |
| Matplotlib  | Data Visualization        |
| Seaborn     | Statistical Visualization |
| CSV Dataset | Source Data               |

---

# Task 1 – Load Dataset

## Dataset

A CSV file named `login_attempts.csv` was created.

### Fields

| Column   | Description              |
| -------- | ------------------------ |
| date     | Login date               |
| attempts | Number of login attempts |

### Load Data

```python
data = pd.read_csv('login_attempts.csv', parse_dates=['date'])
print(data.head())
```

### Result

Dataset loaded successfully.

---

# Task 2 – Build Time-Series Chart

## Set Date as Index

```python
data.set_index('date', inplace=True)
```

## Create Line Chart

```python
plt.figure(figsize=(10,5))
plt.plot(data.index, data['attempts'], marker='o')
```

### Result

A time-series visualization displaying login attempts over time was generated.

---

# Task 3 – Compare Weekly Trends

## Calculate Weekly Averages

```python
data_weekly = data.resample('W').mean()
```

## Create Weekly Trend Chart

```python
sns.lineplot(
    data=data_weekly,
    x=data_weekly.index,
    y='attempts'
)
```

### Result

Weekly average login activity was visualized.

---

# Task 4 – Identify Patterns and Anomalies

## Calculate Threshold

```python
threshold = (
    data_weekly['attempts'].mean()
    + 2 * data_weekly['attempts'].std()
)
```

## Detect Anomalies

```python
anomalies = data_weekly[
    data_weekly['attempts'] > threshold
]
```

## Visualize Anomalies

```python
plt.scatter(
    anomalies.index,
    anomalies['attempts'],
    color='red'
)
```

### Result

Unusual spikes in login activity were highlighted.

---

# Task 5 – Export Results

## Export PDF Snapshot

```python
plt.savefig('weekly_attempts_snapshot.pdf')
```

### Result

A shareable PDF report was successfully generated.

---

# Findings

## Trend Analysis

Login attempts generally increased over time.

## Weekly Comparison

Weekly averages demonstrated gradual growth in activity.

## Anomaly Detected

A significant spike occurred on:

```text
2026-05-14
```

with:

```text
50 Login Attempts
```

This value exceeded the normal activity range and may indicate suspicious behavior.

---

# Screenshots

### Screenshot 1

Dataset Preview

### Screenshot 2

Time-Series Chart

### Screenshot 3

Weekly Comparison Chart

### Screenshot 4

Anomaly Detection Visualization

### Screenshot 5

Generated PDF Report

---

# Key Concepts Learned

## Time-Series Analysis

Analyzing data collected over time.

## Trend Detection

Identifying long-term increases or decreases in activity.

## Weekly Aggregation

Summarizing daily data into weekly averages.

## Anomaly Detection

Finding unusual values that differ significantly from normal behavior.

## Reporting

Exporting analysis results for presentation and sharing.

---

# Conclusion

In this lab, time-series login activity was analyzed using Python and open-source data science libraries. Weekly trends were visualized, anomalies were identified using statistical methods, and the results were exported into shareable reports. These techniques are widely used in cybersecurity monitoring, SIEM analysis, and business intelligence reporting.
