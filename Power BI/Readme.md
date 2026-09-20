# Power BI Projects: financial performance

A comprehensive data analysis project showcasing key business metrics and insights through an interactive Power BI dashboard.

<img width="1268" height="711" alt="image" src="https://github.com/user-attachments/assets/fec89db8-7871-44aa-af9b-7c28713b5d26" />


## 📋 Table of Contents

- [Project Overview](#%EF%B8%8F-project-overview)
- [Tools Used](#-tools-used)
- [Data Cleaning and Preparation](#-data-cleaning-and-preparation)
- [Data Modeling](#-data-modeling)
- [Visualizations and Dashboard](#-visualizations-and-dashboard)
- [Key Insights](#-key-insights)
- [How to Use](#-how-to-use)
- [Contact](#-contact)

---

## 🏷️ Project Overview

This project aims to analyze [mention the subject, e.g., sales data, financial performance, customer behavior] from [mention the time period, e.g., 2022-2024] to identify trends, patterns, and opportunities for business improvement. The interactive dashboard provides a clear and concise view of key performance indicators (KPIs) and allows for a deeper dive into the underlying data.

---

## 🛠️ Tools Used

- **Microsoft Power BI:** Used for the entire workflow, including data connection, transformation, modeling, and visualization.
- **DAX (Data Analysis Expressions):** Utilized for creating complex calculations and custom measures.
- **Power Query:** Employed for data cleaning, transformation, and preparation (ETL process).

---

## 🧹 Data Cleaning and Preparation

During the data preparation phase in Power Query, the following steps were taken:

- **Data Loading:** Connected to the data sources and loaded the tables.
- **Handling Missing Values:** [e.g., Removed rows with null values in the 'order_id' column].
- **Data Type Correction:** [e.g., Ensured 'order_date' was formatted as a Date type and 'sales_amount' as a Decimal Number].
- **Column Manipulation:** [e.g., Split the 'customer_name' column into 'first_name' and 'last_name'].
- **Calculated Columns:** [e.g., Created a 'profit' column by subtracting 'cost' from 'revenue'].

---

## ⚙️ Data Modeling

A relational data model was built in Power BI to connect the different data tables.

- **Relationships:** Established a one-to-many relationship between the `Customers` table and the `Sales` table on `CustomerID`.
- **DAX Measures:** Created several key measures to power the visualizations, such as:
    - `Total Sales = SUM(Sales[Revenue])`
    - `Profit Margin = DIVIDE([Total Profit], [Total Sales], 0)`
    - `Year-over-Year Sales Growth = ...`

---

## 📊 Visualizations and Dashboard

The final dashboard consists of multiple interactive visuals designed to provide a comprehensive overview of the data:

- **KPI Cards:** Displaying high-level metrics like Total Revenue, Total Profit, and Number of Customers.
- **Sales Trend Analysis:** A line chart showing revenue trends over time, with slicers for year and month.
- **Product Performance:** A bar chart illustrating the top-performing products by sales.
- **Geographical Sales Map:** A map visual displaying sales distribution by state or country.
- **Interactive Slicers:** Filters for date, region, and product category to allow for dynamic data exploration.

---

---

## 🚀 How to Use

To view and interact with the report:

1.  Make sure you have **Power BI Desktop** installed.
2.  Download the `.pbix` file from this repository.
3.  Open the `Bi projects.pbix` file in Power BI Desktop.

---

## 📫 Contact

- **Name:** Abenezer Y. Bekele
- **GitHub:** [AbenezerYBekele](https://github.com/AbenezerYBekele)
- **LinkedIn:** [LinkedIn](https://www.linkedin.com/in/abenezer-bekele/)
