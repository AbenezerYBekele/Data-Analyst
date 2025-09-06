# SQL Analysis 

## Global Obesity Trends 

### Project Summary
This project uses SQL to analyze global obesity data, identifying trends and demographic differences. The goal is to showcase proficiency in SQL for data analysis, from basic aggregations to advanced queries.
### SQL Techniques Demonstrated
*   **Aggregate Functions:** `AVG()` with `GROUP BY` to calculate mean obesity rates.
*   **Sorting & Filtering:** `ORDER BY`, `LIMIT`, and `WHERE` to rank countries and isolate specific trends.
*   **Advanced Joins:** A **Self-Join** to compare year-over-year data and identify countries with consistently increasing obesity rates.

### Key Findings
*   Identified countries with the highest and lowest overall obesity rates.
*   Pinpointed nations with a continuous, year-over-year increase in obesity percentages.

## COVID-19 Vaccinations & Deaths

### Project Summary
This project uses SQL to explore a global COVID-19 dataset. The primary goal is to analyze the relationship between vaccination rates and mortality data by joining and querying two separate tables (`CovidDeaths` and `CovidVaccinations`).
### SQL Techniques Demonstrated
*   **Table Joins:** Combining `CovidDeaths` and `CovidVaccinations` tables to perform a comprehensive analysis.
*   **Window Functions:** Using `SUM() OVER (PARTITION BY ...)` to calculate rolling vaccination counts over time.
*   **Common Table Expressions (CTEs):** Creating a CTE (`WITH` clause) to perform calculations on a partitioned dataset to determine vaccination percentages.
*   **Creating Views:** Building a view to store complex query results for later use and simplified analysis.
*   **Aggregate Functions:** `SUM()`, `MAX()`, `COUNT()` to summarize data at country and continental levels.
*   **Data Type Conversion:** Using `CAST` to convert data types for accurate calculations.

### Key Analytical Questions
*   What is the rolling count of people vaccinated in each country over time?
*   What percentage of the population has received at least one vaccine dose?
*   How do infection rates and death percentages vary by country?

## HR Analytics Database Schema

### Project Summary

This script demonstrates advanced SQL and database design by building a complete, normalized HR database from scratch. It focuses on ensuring data integrity, optimizing query performance, and creating powerful, pre-joined analytical views for business intelligence.

### Key SQL Techniques Demonstrated
*   **Relational Database Design:** Created a multi-table schema (`Employees`, `Jobs`, `Departments`).
*   **Data Integrity:** Enforced rules using `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `CHECK` constraints.
*   **Performance Optimization:** Added `INDEX`es on foreign keys to accelerate join performance.
*   **Advanced Views (`CREATE VIEW`):**
    *   Built a denormalized `view_employee_details` by joining five tables and performing a **self-join**.
    *   Created an aggregated `view_department_salary_summary` for high-level reporting.
*   **Feature Engineering:** Calculated new fields like employee tenure and salary range utilization directly within a view.

### Purpose
This script builds a robust backend ready for analysis in BI tools like Tableau or Power BI, simplifying complex queries for end-users by providing ready-made analytical views.




