# R Analysis 

## the Washington State Art Collection

### Project Summary

This project uses R and the Tidyverse to perform a complete data analysis of the Washington State Art Collection dataset. The script covers the full workflow from data cleaning and transformation to exploratory data analysis and visualization to uncover key trends and insights.

### Tools & Libraries
*   **R**
*   **Tidyverse:** `readr`, `dplyr`, `stringr`, `ggplot2`
*   **Janitor:** For data cleaning and examination.

### Key Steps & Techniques
*   **Data Cleaning:** Standardized column names using `clean_names()`, identified and removed duplicate records, and cleaned inconsistent text data.
*   **Data Transformation & Feature Engineering:** Extracted the creation year from a messy date column using `stringr`, handled missing values, and created a new feature for "title length."
*   **Exploratory Data Analysis (EDA):** Used `dplyr` verbs like `group_by()`, `summarize()`, and `arrange()` to aggregate data and identify the most common art types, materials, and the most productive years for art creation.
*   **Visualization:** Created bar charts and line graphs with `ggplot2` to visually represent key findings, such as the distribution of art types and the number of artworks created over time.

### Key Findings
*   Identified "Sculpture" and "Painting" as the most prevalent art types in the collection.
*   Visualized a clear trend showing the number of artworks commissioned per year, highlighting peak periods of art creation.

## Minneapolis Active Rental Licenses

### Project Summary
This project uses R and the Tidyverse to perform a full analysis of the Minneapolis Active Rental Licenses dataset. The script demonstrates a complete workflow from data cleaning and feature engineering to exploratory analysis and visualization, uncovering trends in the city's rental market.

### Tools & Libraries
*   **R**
*   **Tidyverse:** `readr`, `dplyr`, `lubridate`, `ggplot2`
*   **Janitor:** For efficient data cleaning.

### Key Steps & Techniques
*   **Data Cleaning:** Used `janitor` to standardize column names and `dplyr` to select relevant features and remove duplicate records.
*   **Data Transformation & Feature Engineering:** Parsed and transformed date/time columns using `lubridate`. Engineered new features, including the duration of a license (`numberOfDays`) and extracted the `year`, `month`, and `day` from issue dates for time-series analysis.
*   **Exploratory Data Analysis (EDA):** Aggregated data using `group_by()` and `summarize()` to identify key patterns, such as the communities with the most rental properties and the years with the highest application volumes.
*   **Visualization:** Created bar charts and line graphs with `ggplot2` to effectively communicate the findings from the analysis.

### Key Findings & Visualizations
*   **Top Rental Communities:** The analysis identified and visualized the top communities with the highest concentration of rental properties in Minneapolis.
*   **Application Growth Over Time:** A time-series line graph revealed the growth trend of rental license applications, showing a significant increase in recent years.
