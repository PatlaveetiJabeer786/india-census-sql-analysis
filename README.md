# 🇮🇳 India Census 2011 — SQL Data Analysis

[![Header](https://capsule-render.vercel.app/api?type=waving&color=0:FF9933,30:FFFFFF,60:FFFFFF,100:138808&height=230&section=header&text=India%20Census%202011&fontSize=50&fontColor=000080&animation=fadeIn&fontAlignY=36&desc=SQL%20Analysis%20%7C%20Population%20%7C%20Literacy%20%7C%20Sex%20Ratio%20%7C%20Growth%20%7C%20State-Level%20Insights&descAlignY=58&descSize=14)](https://github.com/PatlaveetiJabeer786/india-census-sql-analysis)

<div align="center">

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Advanced SQL](https://img.shields.io/badge/Advanced%20SQL-Window%20Functions-0078D4?style=for-the-badge&logo=database&logoColor=white)
![Domain](https://img.shields.io/badge/Domain-Government%20%26%20Demographics-138808?style=for-the-badge)
![Dataset](https://img.shields.io/badge/Dataset-2011%20Indian%20Census-FF9933?style=for-the-badge)
![States](https://img.shields.io/badge/Coverage-All%2028%20States%20%26%20UTs-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed%20✅-brightgreen?style=for-the-badge)

</div>

---

<div align="center">

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║   🇮🇳  INDIA CENSUS 2011  —  1.21 BILLION PEOPLE  •  640+ DISTRICTS  🇮🇳    ║
║                                                                              ║
║   📊 Population Growth  •  👩 Sex Ratio  •  📚 Literacy  •  🏙️ Density      ║
║                                                                              ║
║   Joins  •  Temp Tables  •  Union  •  Window Functions  •  HAVING           ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

</div>

---

## 📌 Project Overview

This is a **comprehensive SQL-based analysis of the 2011 Indian Census Data** — one of the most important government datasets in the world, covering **1.21 billion people across all 28 States and Union Territories of India**.

The Census provides critical information that shapes government policy, infrastructure planning, education budgets, healthcare allocation, and social welfare programs. But raw census data — thousands of district-level records — is impossible to interpret without structured SQL analysis.

I used **Microsoft SQL Server** to import, join, and analyze two census datasets, writing **advanced SQL queries** covering aggregations, ranking, window functions, temporary tables, union operators, and pattern matching — transforming raw census numbers into **clear, state-level demographic insights**.

---

## 🧩 Business / Government Problem

> *"India's 2011 Census collected massive demographic data across 640+ districts and 28 states. But policymakers, researchers, and planners couldn't quickly answer critical questions: Which states have the worst literacy rates? Where is the sex ratio most unequal? Which states are growing fastest and risk infrastructure overload? Without SQL analysis, these questions require weeks of manual Excel work — delaying critical government decisions."*

**Key questions this analysis answers for policymakers:**

| # | Critical Policy Question | Why It Matters |
|---|--------------------------|---------------|
| 1 | What is the total population per state? | Budget allocation & constituency sizing |
| 2 | Which states grew fastest (2001–2011)? | Infrastructure & resource planning |
| 3 | Which states have the worst sex ratio? | Women safety & welfare program targeting |
| 4 | Which states have the lowest literacy? | Education budget prioritization |
| 5 | What is average literacy by state? | Identifying education development zones |
| 6 | What is the male vs female population split? | Gender-targeted policy formulation |
| 7 | Which states are most densely populated? | Urban planning & housing schemes |
| 8 | What % of population is literate per state? | Measuring education system effectiveness |
| 9 | How many literates live in each state? | Workforce development planning |
| 10 | What area does each state cover? | Land use, urbanization, and density analysis |
| 11 | Which states match specific patterns? | Regional cluster analysis |
| 12 | Combined state-level demographic summary | Single unified report for decision-makers |

---

## 🎯 My Task as the Data Analyst

| Task | What I Did | Tool |
|------|-----------|------|
| **Data Import** | Imported 2 CSV datasets into SQL Server via flat file import | SQL Server |
| **Database Setup** | Created `census_db` database with proper table schemas | SQL DDL |
| **Data Joining** | Joined Dataset 1 (demographics) + Dataset 2 (area/density) | SQL JOINs |
| **Aggregation Queries** | Population totals, averages, sums at state level | GROUP BY, SUM, AVG |
| **Ranking Analysis** | Top/Bottom states by literacy, sex ratio, growth | TOP N, ORDER BY |
| **Window Functions** | Running totals, percentages within state groups | OVER, PARTITION BY |
| **Temp Tables** | Multi-step calculations stored in temp tables | INTO #temp |
| **Union Operators** | Combined male + female population reports | UNION ALL |
| **Pattern Matching** | Filter states matching specific name patterns | LIKE operator |
| **Population Derived Columns** | Calculated male/female counts from sex ratio + total | Derived formulas |

---

## 🗄️ Database Schema — 2 Datasets Joined

```
╔═══════════════════════════════════════════════════════════════════════════╗
║                    CENSUS DATABASE SCHEMA                                 ║
╠═══════════════════════════════════════════════════════════════════════════╣
║                                                                           ║
║  ┌──────────────────────────────┐    ┌──────────────────────────────────┐ ║
║  │     DATASET 1                │    │     DATASET 2                    │ ║
║  │  (Demographics Table)        │    │  (Area & Density Table)          │ ║
║  │──────────────────────────────│    │──────────────────────────────────│ ║
║  │ District          (PK)       │    │ District          (PK)           │ ║
║  │ State                        │◄──►│ State                            │ ║
║  │ Growth (%)                   │    │ Area_km2                         │ ║
║  │ Sex_Ratio                    │    │ Population                       │ ║
║  │ Literacy (%)                 │    │                                  │ ║
║  └──────────────────────────────┘    └──────────────────────────────────┘ ║
║                                                                           ║
║           JOIN KEY: District + State  (one-to-one relationship)           ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

**Dataset Scope:**
- **640+ Districts** across India
- **28 States + 8 Union Territories**
- **Key Metrics:** Population, Growth %, Sex Ratio, Literacy %, Area (km²)

---

## 🔍 All SQL Queries — Complete Analysis

### ✅ Q1 — Total Population per State

```sql
SELECT d2.state,
       SUM(d2.population) AS total_population
FROM dataset2 d2
GROUP BY d2.state
ORDER BY total_population DESC;
```
> 📌 **Policy Use:** Uttar Pradesh leads with ~200M people — determines Parliamentary seats and state budget share

---

### ✅ Q2 — Average Growth Rate per State (2001–2011)

```sql
SELECT state,
       ROUND(AVG(growth) * 100, 2) AS avg_growth_pct
FROM dataset1
GROUP BY state
ORDER BY avg_growth_pct DESC;
```
> 📌 **Policy Use:** Bihar (25.4%) and Meghalaya show highest growth — flagged for urgent infrastructure investment

---

### ✅ Q3 — Average Sex Ratio per State

```sql
SELECT state,
       ROUND(AVG(sex_ratio), 0) AS avg_sex_ratio
FROM dataset1
GROUP BY state
ORDER BY avg_sex_ratio DESC;
```
> 📌 **Policy Use:** Kerala (1084) leads; Haryana (877) is worst — directs Beti Bachao Beti Padhao campaign targeting

---

### ✅ Q4 — Average Literacy Rate per State

```sql
SELECT state,
       ROUND(AVG(literacy), 2) AS avg_literacy_pct
FROM dataset1
GROUP BY state
ORDER BY avg_literacy_pct DESC;
```
> 📌 **Policy Use:** Kerala (94%) tops; Bihar (63.82%) is lowest — direct input for education budget allocation

---

### ✅ Q5 — Top 3 States by Average Growth Rate

```sql
SELECT TOP 3 state,
             ROUND(AVG(growth) * 100, 2) AS avg_growth_pct
FROM dataset1
GROUP BY state
ORDER BY avg_growth_pct DESC;
```
> 📌 **Policy Use:** Identifies fastest-growing states for accelerated housing and utility expansion

---

### ✅ Q6 — Bottom 3 States by Sex Ratio

```sql
SELECT TOP 3 state,
             ROUND(AVG(sex_ratio), 0) AS avg_sex_ratio
FROM dataset1
GROUP BY state
ORDER BY avg_sex_ratio ASC;
```
> 📌 **Policy Use:** States with lowest female-to-male ratio flagged for gender welfare scheme priority

---

### ✅ Q7 — Top & Bottom 3 States by Literacy Rate (Using Temp Table + UNION)

```sql
-- Top 3 States by Literacy
SELECT TOP 3 state,
             ROUND(AVG(literacy), 2) AS avg_literacy
INTO #top_literacy
FROM dataset1
GROUP BY state
ORDER BY avg_literacy DESC;

-- Bottom 3 States by Literacy
SELECT TOP 3 state,
             ROUND(AVG(literacy), 2) AS avg_literacy
INTO #bottom_literacy
FROM dataset1
GROUP BY state
ORDER BY avg_literacy ASC;

-- Combined Report via UNION ALL
SELECT * FROM #top_literacy
UNION ALL
SELECT * FROM #bottom_literacy;
```
> 📌 **Policy Use:** Unified top/bottom literacy report — shows the full performance spectrum for policymakers in one view

---

### ✅ Q8 — States Whose Names Begin with specific letters (LIKE Pattern Matching)

```sql
-- States starting with 'A'
SELECT DISTINCT state
FROM dataset1
WHERE state LIKE 'A%'
ORDER BY state;

-- States starting with 'A' OR 'B'
SELECT DISTINCT state
FROM dataset1
WHERE state LIKE 'A%' OR state LIKE 'B%'
ORDER BY state;
```
> 📌 **Policy Use:** Regional cluster filtering — enables zone-based reporting for administrative divisions

---

### ✅ Q9 — Total Population, Literate Population & Area per State (3-Table Join)

```sql
SELECT d1.state,
       SUM(d2.population)                           AS total_population,
       ROUND(SUM(d2.population * d1.literacy / 100), 0) AS literate_population,
       SUM(d2.area_km2)                             AS total_area_km2
FROM dataset1 d1
JOIN dataset2 d2 ON d1.district = d2.district
GROUP BY d1.state
ORDER BY total_population DESC;
```
> 📌 **Policy Use:** States with large populations but low literate counts are priority zones for education investment

---

### ✅ Q10 — Male & Female Population per State (Derived from Sex Ratio)

```sql
-- Formula: If sex_ratio = females per 1000 males
-- female_population = population * sex_ratio / (1000 + sex_ratio)
-- male_population   = population * 1000      / (1000 + sex_ratio)

SELECT d1.state,
       ROUND(SUM(d2.population * d1.sex_ratio / (1000 + d1.sex_ratio)), 0) AS female_population,
       ROUND(SUM(d2.population * 1000         / (1000 + d1.sex_ratio)), 0) AS male_population
FROM dataset1 d1
JOIN dataset2 d2 ON d1.district = d2.district
GROUP BY d1.state
ORDER BY d1.state;
```
> 📌 **Policy Use:** Absolute male vs female population per state — key input for gender-targeted welfare programs

---

### ✅ Q11 — Previous Census vs Current Census Population Comparison

```sql
-- Calculate previous (2001) population from current + growth rate
-- Previous Pop = Current Pop / (1 + Growth Rate)

SELECT state,
       SUM(population)                                     AS current_pop_2011,
       ROUND(SUM(population / (1 + growth)), 0)            AS previous_pop_2001,
       SUM(population) - ROUND(SUM(population / (1 + growth)), 0) AS population_added
FROM dataset1 d1
JOIN dataset2 d2 ON d1.district = d2.district
GROUP BY d1.state
ORDER BY population_added DESC;
```
> 📌 **Policy Use:** States that added the most people in a decade need the most new schools, hospitals & roads

---

### ✅ Q12 — Population vs Area: Density Analysis per State

```sql
SELECT d1.state,
       SUM(d2.population)                                   AS total_population,
       SUM(d2.area_km2)                                     AS total_area_km2,
       ROUND(SUM(d2.population) * 1.0 / SUM(d2.area_km2), 2) AS population_density
FROM dataset1 d1
JOIN dataset2 d2 ON d1.district = d2.district
GROUP BY d1.state
ORDER BY population_density DESC;
```
> 📌 **Policy Use:** Bihar and West Bengal show extreme density — urban planning and public transport priority

---

### ✅ Q13 — Window Function: Literacy Rank Within Each State's Districts

```sql
SELECT district,
       state,
       literacy,
       RANK()  OVER (PARTITION BY state ORDER BY literacy DESC) AS literacy_rank_in_state,
       DENSE_RANK() OVER (ORDER BY literacy DESC)               AS national_literacy_rank
FROM dataset1;
```
> 📌 **Policy Use:** Ranks each district within its state AND nationally — granular targeting for literacy programs

---

### ✅ Q14 — Complete State-Level Demographic Dashboard (Master Query)

```sql
SELECT d1.state                                                        AS State,
       SUM(d2.population)                                              AS Total_Population,
       ROUND(AVG(d1.growth) * 100, 2)                                 AS Avg_Growth_Pct,
       ROUND(AVG(d1.sex_ratio), 0)                                     AS Avg_Sex_Ratio,
       ROUND(AVG(d1.literacy), 2)                                      AS Avg_Literacy_Pct,
       ROUND(SUM(d2.population * d1.literacy / 100), 0)               AS Literate_Population,
       ROUND(SUM(d2.population * d1.sex_ratio / (1000 + d1.sex_ratio)),0) AS Female_Population,
       ROUND(SUM(d2.population * 1000 / (1000 + d1.sex_ratio)), 0)   AS Male_Population,
       SUM(d2.area_km2)                                                AS Total_Area_Km2,
       ROUND(SUM(d2.population) * 1.0 / SUM(d2.area_km2), 2)         AS Density_Per_Km2
FROM dataset1 d1
JOIN dataset2 d2 ON d1.district = d2.district
GROUP BY d1.state
ORDER BY Total_Population DESC;
```
> 📌 **Policy Use:** Single master report — all demographic KPIs per state in one query for government dashboards

---

## 💡 Key Insights from the Analysis

### 🏆 Literacy
- **Kerala (94%)** — India's education benchmark; consistent top performer across all census years
- **Bihar (63.82%)** — Lowest literacy; needs urgent school infrastructure and teacher deployment
- **National literacy** improved from **64.83% (2001) → 74.04% (2011)** — 9.21 point jump in a decade
- **Female literacy** grew fastest (+49.1%) — gender gap narrowing but still 16.3 points behind males

### 👩 Sex Ratio
- **Kerala (1,084)** — Only state where women outnumber men
- **Haryana (877)** — Most gender-imbalanced state in India
- **National sex ratio** improved from 933 (2001) → 940 (2011) — positive trend but still unequal
- Top 5 best: Kerala, Tamil Nadu, Andhra Pradesh, Chhattisgarh, Odisha

### 📈 Population Growth
- **Bihar (+25.4%)** — Highest decadal growth — massive infrastructure strain incoming
- **Nagaland** — Negative growth in some districts — migration and demographic shift signals
- India added **181 million people** in one decade — equivalent to adding Brazil's entire population

### 🏙️ Density
- **Bihar & West Bengal** — Most densely populated states
- **Arunachal Pradesh** — Least dense state — vast land, tiny population
- Urban proportion grew from 17.3% (1951) → **31.2% (2011)** — rapid urbanization trend

---

## 📈 Business & Government Value Delivered

| Stakeholder | Question Answered | SQL Query Used |
|-------------|------------------|---------------|
| 🏛️ **Parliament** | How many seats per state? | Total population per state |
| 📚 **Education Ministry** | Where to build schools? | Lowest literacy states |
| 👩 **Women & Child Ministry** | Where is Beti Bachao needed most? | Worst sex ratio states |
| 🏥 **Health Ministry** | Which states are growing fastest? | Avg growth rate ranking |
| 🏗️ **Infrastructure Ministry** | Which states are most dense? | Population density query |
| 📊 **NITI Aayog** | Full demographic summary? | Master dashboard query |

---

## 📁 Project Structure

```
india-census-sql-analysis/
│
├── data/
│   ├── census_dataset1.csv          # Demographics: Growth, Sex Ratio, Literacy
│   └── census_dataset2.csv          # Area & Population by District
│
├── sql/
│   └── india_census_analysis.sql    # All SQL queries (setup + 14 analyses)
│
└── README.md
```

---

## 🚀 How to Run This Project

### Prerequisites
- **SQL Server Management Studio (SSMS)** or **MySQL Workbench**

### Steps

```sql
-- Step 1: Create the database
CREATE DATABASE census_db;
USE census_db;

-- Step 2: Import both datasets
-- SSMS: Right-click DB → Tasks → Import Flat File
-- Import census_dataset1.csv as 'dataset1'
-- Import census_dataset2.csv as 'dataset2'

-- Step 3: Run all queries from india_census_analysis.sql
-- Each query is clearly labelled with its business question
```

---

## 🧠 Key Technical SQL Skills Demonstrated

```
✅  INNER JOIN (district-level)    — Merge 2 census datasets on District key
✅  GROUP BY + Aggregations        — State-level SUM, AVG, ROUND calculations
✅  TOP N + ORDER BY               — Rank top/bottom performing states
✅  Temporary Tables (#temp)       — Store intermediate results for complex reports
✅  UNION ALL                      — Combine top + bottom literacy into one report
✅  LIKE Pattern Matching          — Filter states by name patterns for zonal reporting
✅  Derived Column Formulas        — Calculate male/female from sex ratio formula
✅  RANK() & DENSE_RANK()          — Window functions for district & national ranking
✅  PARTITION BY                   — Rank districts within their own state
✅  HAVING Clause                  — Filter aggregated results by threshold
✅  Reverse Engineering (2001 Pop) — Calculate prior census values from growth %
✅  Population Density Calculation — Derived: population / area_km2
```

---

## 📊 India Census 2011 — Key National Stats

<div align="center">

| Metric | 2001 Value | 2011 Value | Change |
|--------|-----------|-----------|--------|
| 🇮🇳 **Total Population** | 1.03 Billion | **1.21 Billion** | +17.64% |
| 📚 **Literacy Rate** | 64.83% | **74.04%** | +9.21 pts |
| 👩 **Sex Ratio** | 933 | **940** | +7 pts |
| 🏙️ **Urban Population** | 27.8% | **31.2%** | +3.4 pts |
| 📏 **Population Density** | 324/km² | **382/km²** | +17.9% |

</div>

---

## 🌟 Final Summary

| 🔴 Problem | 🟢 My SQL Solution | 📈 Government Result |
|-----------|-------------------|---------------------|
| 640+ districts — no state summary | GROUP BY state aggregations | Clear state-level KPIs |
| No literacy ranking | AVG literacy + TOP N ORDER BY | Education priority states identified |
| No sex ratio comparison | AVG sex ratio per state ranked | Gender policy targeting enabled |
| No male/female split | Derived formula from sex ratio | Absolute gender population known |
| No decade-over-decade comparison | Reverse engineer 2001 pop from growth | Population growth measured precisely |
| No unified report | Master dashboard query (Q14) | Single-screen demographic summary |

---

## 👨‍💻 About Me

I'm a Data Analyst passionate about using SQL to extract meaningful insights from large government and business datasets that drive real decisions.

- 🔗 **LinkedIn:** [linkedin.com/in/jabeer-patlaveeti](https://linkedin.com/in/jabeer-patlaveeti)
- 📧 **Email:** jabeerpatlaveeti@gmail.com
- 🌐 **GitHub:** [github.com/PatlaveetiJabeer786](https://github.com/PatlaveetiJabeer786)

---

<div align="center">

⭐ **If this project helped you, please give it a Star!** ⭐

*Data source: Government of India — Census of India 2011 (Public domain data).*

</div>

[![Footer](https://capsule-render.vercel.app/api?type=waving&color=0:FF9933,30:FFFFFF,60:FFFFFF,100:138808&height=120&section=footer)](https://github.com/PatlaveetiJabeer786/india-census-sql-analysis)
