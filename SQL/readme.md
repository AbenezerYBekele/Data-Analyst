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

## Digital Media Store (Chinook)

### Project Summary
This SQL script creates and populates the complete schema for the Chinook database, a sample database representing a digital media store. The purpose of this script is to establish a foundational relational database environment for performing data analysis.

### Database Schema Highlights
The script builds a multi-table relational database with key tables including:
*   `Tracks` & `Albums`
*   `Artists`
*   `Invoices` & `Invoice_Items`
*   `Customers`
*   `Employees`
### Purpose for Analysis
This script serves as the setup for a practice environment. It creates the necessary structure and data to write and test advanced SQL queries that could answer business questions related to sales performance, customer purchasing habits, and music genre popularity.
  
