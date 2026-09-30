# Plant Co. Sales Performance Dashboard

**Power BI | DAX | Power Query | Data Modeling | Time Intelligence**

An interactive Power BI dashboard that analyzes Plant Co.'s Sales, Gross Profit, and Quantity from 2022 to 2024. It compares Year-to-Date (YTD) against Previous Year-to-Date (PYTD) performance and breaks results down by month, country, product, and customer account.

<!-- Replace with your dashboard screenshot -->
<!-- ![Dashboard Preview](screenshots/dashboard.png) -->

---

## Project Summary

| | |
|---|---|
| **Objective** | Give management a single view of YTD vs. PYTD performance and show where growth or decline originates |
| **Period** | January 2022 to April 2024 |
| **Data volume** | 2,440 transactions, 949 accounts across 50 countries, 1,000 products |
| **Source** | Excel workbook (`Accounts`, `Plant_FACT`, `Plant_Hierarchy` sheets) |
| **Deliverable** | One-page interactive report with a dynamic metric selector |

---

## Key Findings

| Year | YTD Gross Profit | GP % | Change vs. PYTD |
|---|---|---|---|
| 2022 | $5.42M | 40.09% | n/a (first year of data) |
| 2023 | $5.15M | 39.62% | -$265.3K |
| 2024 (through Apr 14) | $1.40M | 39.15% | -$77.6K |

- **China is the largest driver of the 2023 decline**, with a gross profit drop of about $405K, followed by Sweden and the United States.
- **Volume held up while profit fell.** 2023 quantity rose to 555.7K units (up 17.1K), so the gross profit decline points to margin and product-mix pressure rather than lower demand.
- **Margins eroded gradually**, from 40.09% to 39.62% to 39.15% over the three periods.
- **2024 is trending below 2023** on both gross profit and quantity (-12.4K units) for the same Jan to Apr 14 window.

---

## Dashboard Features

- **Dynamic metric selector:** one slicer switches every KPI, chart, and title between Sales, Gross Profit, and Quantity.
- **KPI cards:** GP %, YTD, PYTD, and YTD vs. PYTD variance.
- **Treemap:** bottom 10 countries by YTD vs. PYTD variance.
- **Waterfall chart:** variance drill-down by Month, Country, and Product.
- **Combo chart:** monthly and quarterly YTD vs. PYTD by product type (Indoor, Outdoor, Landscape).
- **Scatter plot:** account profitability segmentation (GP % vs. selected metric).
- **Dynamic titles:** report and chart titles update with the selected metric and year.

---

## Data Model

Star-schema design with one fact table, two dimensions, a date table, and a disconnected selector table.

```
Dim_Accounts ──(Account_id)── Fact_Sales ──(Product_id)──> Dim_Product
                                  ^
                              Dim_Date

slc_Values (disconnected)  ->  drives the metric SWITCH
_Measures                  ->  central measure table
```

| Table | Role |
|---|---|
| `Fact_Sales` | Sales, quantity, price, COGS, date, account, and product keys |
| `Dim_Accounts` | Customer, country, coordinates, address (de-duplicated on `Account_id`) |
| `Dim_Product` | Family, Group, Name hierarchy, size, and type |
| `Dim_Date` | Calendar table with an `Inpast` flag for PYTD logic |
| `slc_Values` | Helper table for the metric selector |
| `_Measures` | Measures organized into Base, YTD, PYTD, and SWITCH folders |

---

## Selected DAX

```DAX
Gross Profit = [Sales] - [COGs]
GP%          = DIVIDE([Gross Profit], [Sales])

YTD_Sales  = TOTALYTD([Sales], Fact_Sales[Date_Time])

PYTD_Sales =
    CALCULATE(
        [Sales],
        SAMEPERIODLASTYEAR(Dim_Date[Date]),
        Dim_Date[Inpast] = TRUE
    )

S_YTD =
VAR selected_value = SELECTEDVALUE(Slc_Values[Values])
RETURN
    SWITCH(selected_value,
        "Sales",        [YTD_Sales],
        "Quantity",     [YTD_Quantity],
        "Gross Profit", [YTD_GrossProfit],
        BLANK()
    )

YTD VS PYTD = [S_YTD] - [S_PYTD]
```

---

## Data Preparation (Power Query)

- Imported three Excel sheets and promoted headers.
- Enforced data types for dates, numeric fields, and IDs.
- Removed duplicate accounts on `Account_id`.
- Standardized column names (for example, `latitude2` to `latitude`).
- Built the `slc_Values` helper table for the metric selector.

---

## Skills Demonstrated

- Dimensional modeling (star schema, relationships, disconnected tables)
- DAX time intelligence (`TOTALYTD`, `SAMEPERIODLASTYEAR`) and variable-based measures
- Dynamic reporting with `SWITCH` and `SELECTEDVALUE`
- Data cleaning and transformation in Power Query
- Dashboard design and business storytelling (variance analysis, drill-down)

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/plantco-performance.git
   ```
2. Open `Bi_projects.pbix` in [Power BI Desktop]([https://powerbi.microsoft.com/desktop/](https://github.com/AbenezerYBekele/Data-Analyst/blob/main/Power%20BI/Bi%20projects.pbix)).
3. If data does not load, update the source: **Home > Transform data > Data source settings > Change Source**, then point to your local copy of `Plant_DTS.xls` and click **Refresh**.
4. Use the year and metric slicers, then drill into the waterfall and treemap.

---

## Roadmap

- Add a dedicated Sales performance page
- Add a map visual using account coordinates
- Add forecasting for profit and quantity
- Publish to Power BI Service with scheduled refresh
- Convert the `Dim_Accounts` to `Fact_Sales` relationship to one-to-many, single direction

---

## Author

Abenezer Y Bekele
