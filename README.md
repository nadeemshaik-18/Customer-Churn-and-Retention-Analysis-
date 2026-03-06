# 📊 Customer Churn & Retention Analysis

> A complete end-to-end data analytics project analyzing customer churn behavior using **Excel**, **SQL**, and **Power BI**.

---

## 🔗 Live Dashboard

👉 [**View Power BI Dashboard**](https://app.powerbi.com/view?r=eyJrIjoiNmE2NDNhOTItZDAwNC00YmM1LWI2MGEtZGFjNGFmOTk4MDE4IiwidCI6Ijk1OTU1YmQzLTZmZmItNDQzMC1hM2U4LWU2NjM0ZjZiZjdiOSJ9)

---

## 📌 Project Overview

This project analyzes customer churn and retention patterns for a subscription-based service. It follows the complete data analytics pipeline — from raw data collection and cleaning to SQL-based analysis and interactive Power BI visualizations.

---

## 🗂️ Dataset Fields

| Field | Description |
|---|---|
| `CustomerID` | Unique customer identifier |
| `StartDate` | Subscription start date |
| `EndDate` | Subscription end date (null if active) |
| `UsageFrequency` | Number of sessions per week |
| `AvgSessionDuration` | Average session length (minutes) |
| `FeedbackScore` | Customer satisfaction score |
| `Age` | Customer age |
| `Gender` | Customer gender |
| `Location` | Customer city/location |

---

## 🛠️ Tools & Workflow

```
Raw Data → Excel (Clean) → SQL (Analyze) → Power BI (Visualize)
```

### 🧹 Excel — Data Cleaning
- Handled missing `EndDate` values using formulas
- Removed duplicate rows by `CustomerID`
- Standardized date formats across the dataset

### 🗄️ SQL — Data Analysis

Key transformations performed:

- **Subscription Duration** — calculated using `DATEDIFF` between start and end dates
- **Usage Category** — segmented customers into `High`, `Medium`, `Low` frequency groups
- **Customer Lifetime Value (CLTV)** — computed as `AvgSessionDuration × UsageFrequency × 10`
- **Churn Flag** — labeled each customer as churned (`Yes`) or active (`No`)

Key metrics queried:
```sql
-- Churn Rate
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM CustomerData) AS ChurnRate
FROM CustomerData WHERE IsChurned = 'Yes';

-- Avg Subscription Duration
SELECT AVG(SubscriptionDuration) AS AvgSubscriptionDuration FROM CustomerData;

-- Avg CLTV
SELECT AVG(CLTV) AS AvgCLTV FROM CustomerData;
```

### 📊 Power BI — Visualizations

| Visual | Description |
|---|---|
| 🥧 Pie Chart | Churn Rate — churned vs. active customers |
| 📊 Bar Chart | Usage Frequency Category distribution |
| 📈 Line Chart | Average Subscription Duration over time |
| 🔵 Scatter Plot | CLTV vs. Age, colored by Usage Category |
| 📉 Bar Chart | Feedback Score distribution |

---

## 📸 Dashboard Preview

![Dashboard Preview](Project1_dashboard.pdf)

> **Churn Rate: 65.96% churned** | **34.04% active** across 47 customers

---

## 📁 Repository Structure

```
├── Book4.csv                          # Cleaned dataset
├── PROJECT1.sql                       # SQL queries & transformations
├── Project1.pbix                      # Power BI dashboard file
└── README.md                          # Project documentation
```

---

## 💡 Key Insights

- Nearly **66% of customers churned**, signaling a retention challenge
- **High-frequency users** show significantly higher CLTV
- Subscription durations have been **declining year-over-year** since 2019
- Feedback scores cluster around **6–8**, suggesting moderate satisfaction

---

## 🚀 How to Explore

1. Download `Book4.csv` and open in Excel to view the cleaned data
2. Run `PROJECT1.sql` in MySQL to reproduce all transformations
3. Open `Project1.pbix` in Power BI Desktop for the full interactive report
4. Or simply use the **[live dashboard link](https://app.powerbi.com/view?r=eyJrIjoiNmE2NDNhOTItZDAwNC00YmM1LWI2MGEtZGFjNGFmOTk4MDE4IiwidCI6Ijk1OTU1YmQzLTZmZmItNDQzMC1hM2U4LWU2NjM0ZjZiZjdiOSJ9)** for a quick look

---

*Built with ❤️ using Excel · MySQL · Power BI*
