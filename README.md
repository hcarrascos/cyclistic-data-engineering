# Cyclistic Data Engineering Pipeline

## Overview

This project implements an end-to-end data pipeline using the **Medallion Architecture** to process and transform Cyclistic bike-share trip data.

The pipeline processes 12 months of historical trip data using PostgreSQL and SQL, progressively transforming raw data into clean, analytics-ready datasets.

The project was designed around the following business question:

> **Do members and casual riders use Cyclistic bikes differently?**

---

## Architecture

```text
Raw CSV Files
      ↓
Bronze (raw)
      ↓
Silver (staging)
      ↓
Gold (analytics)
```

### Bronze Layer

Raw trip data from 12 monthly CSV files is loaded into:

`raw.cyclistic_trips`

The Bronze layer preserves the source data while adding ingestion metadata.

### Silver Layer

The Silver transformation creates:

`staging.cyclistic_trips`

The transformation:

- removes records with invalid timestamps
- removes duplicate `ride_id` values
- removes rides where `ended_at <= started_at`
- calculates ride duration in minutes
- derives the day of the week
- selects fields required for downstream analytics

Validation queries are stored separately under `/tests`.

### Gold Layer

The Gold layer aggregates the cleaned Silver data into analytics-ready tables designed to answer the project's business question.

`analytics.cyclistic_rides_summary`

Summarizes rider behavior by membership type and day of the week, including total rides and average ride duration.

`analytics.cyclistic_ride_type_summary`

Summarizes rider behavior by membership type and bike type, including total rides and average ride duration.

---

## Key Findings

The Gold layer reveals clear differences between member and casual rider behavior. Casual riders take longer trips on average, while member rides are shorter and more consistent throughout the week. Member activity is highest during weekdays, while casual ridership increases on weekends. The largest difference in ride duration occurs with classic bikes, where casual riders average **39.6 minutes** per trip compared with **15.2 minutes** for members.

---

## Dataset

The dataset contains 12 months of Cyclistic bike-share trip data:

**July 2025 – June 2026**

Approximately **5.9 million trip records** were loaded into the Bronze layer.

Source: Divvy/Cyclistic public trip data.

---

## Technologies

| Technology | Purpose |
|---|---|
| PostgreSQL | Database and data processing |
| SQL | Data transformation and aggregation |
| DBeaver | Database management |
| psql | Bulk CSV ingestion |
| VS Code | Development |
| Git | Version control |
| GitHub | Repository hosting |

---

## Repository Structure

```text
cyclistic-data-engineering/
│
├── setup/
│   ├── 01_create_database.sql
│   └── 02_create_schemas.sql
│
├── sql/
│   ├── bronze/
│   │   └── 01_create_bronze_table.sql
│   ├── silver/
│   │   └── 01_create_silver_table.sql
│   └── gold/
│       ├── 01_create_rides_summary.sql
│       └── 02_create_ride_type_summary.sql
│
├── tests/
│   ├── 01_validate_silver.sql
│   └── 02_validate_gold.sql
│
└── README.md
```

---

## Pipeline Status

- [x] Database and schemas created
- [x] Bronze table created
- [x] 12 monthly CSV files ingested
- [x] Silver transformation completed
- [x] Silver layer validated
- [x] Gold analytics tables created
- [x] Gold layer validated
- [x] Business question evaluated
- [x] Project documentation completed