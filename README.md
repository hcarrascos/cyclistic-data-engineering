# Cyclistic Data Engineering Pipeline

## Overview

This project implements a data engineering pipeline using the **Cyclistic bike-share dataset** and the **Medallion Architecture**.

The goal is to transform 12 months of raw trip data into clean and analytics-ready datasets through three layers:

* **Bronze (`raw`)** – ingestion and storage of source data.
* **Silver (`staging`)** – data cleaning, validation, and transformation.
* **Gold (`analytics`)** – analytics-ready datasets.

The project is being developed as a practical implementation of core data engineering concepts, including data ingestion, transformation, data quality, database design, and version control.

## Architecture

```text
Cyclistic CSV Files
        │
        ▼
   Bronze / Raw
        │
        ▼
 Silver / Staging
        │
        ▼
 Gold / Analytics
```

## Dataset

The project uses **12 months of Cyclistic/Divvy bike-share trip data**, covering **July 2025 to June 2026**.

The source data is provided as monthly CSV files containing trip information such as ride type, timestamps, stations, geographic coordinates, and membership type.

The Bronze layer contains approximately **5.9 million trip records**.

## Tools

| Tool              | Purpose                              |
| ----------------- | ------------------------------------ |
| PostgreSQL        | Data storage and transformation      |
| SQL               | Data manipulation and transformation |
| DBeaver           | Database management and development  |
| PostgreSQL `psql` | Command-line data ingestion          |
| VS Code           | Development environment              |
| Git               | Version control                      |
| GitHub            | Repository hosting and documentation |

## Repository Structure

```text
cyclistic-data-engineering/
│
├── setup/              # Database and schema setup
│
├── sql/
│   ├── bronze/         # Raw layer
│   ├── silver/         # Cleaning and transformation
│   └── gold/           # Analytics layer
│
├── tests/              # Data quality tests
├── docs/               # Project documentation
└── README.md
```

## Project Status

**In progress**

* [x] Database and schemas created
* [x] Bronze table created
* [x] 12 monthly CSV files ingested
* [ ] Silver layer
* [ ] Data quality tests
* [ ] Gold layer
* [ ] Final documentation
