## Chicago Urban Analysis
- Acquired and integrated data from multiple sources, web scraping Chicago neighborhood data from Wikipedia using pandas and programmatically querying the Foursquare API for real-time venue information.
- Utilized geopy to convert neighborhood names into geographic coordinates (latitude/longitude), preparing the dataset for geospatial analysis and visualization.
- Applied unsupervised machine learning by implementing a K-Means clustering algorithm in scikit-learn to segment 100+ neighborhoods into distinct clusters based on their most common venue categories.
- Created interactive geospatial visualizations with folium, mapping the identified neighborhood clusters to provide a clear and intuitive understanding of Chicago's urban landscape and the unique character of each area.

## Exploratory Data Analysis of Stock Market Trends
- Acquired and integrated time-series stock data and quarterly revenue data from multiple sources, utilizing the yfinance API for market data and Python (Requests, BeautifulSoup) for web scraping financial statements.
- Performed comprehensive data cleaning and preprocessing on raw financial data using pandas, ensuring data integrity by handling missing values, standardizing formats, and performing data type conversions.
- Engineered and built comparative visualizations using matplotlib and plotly to illustrate the strong correlation between Tesla's revenue growth and its stock price, contrasting it with the sentiment-driven volatility of GameStop.
- Synthesized analytical findings into actionable insights, concluding that while strong fundamentals were indicative of Tesla's long-term value, external market events were the primary driver for GameStop's short-term price surge.

## Data Wrangling: Used Cars Pricing Analysis
- Executed a full data wrangling pipeline in Python and pandas, identifying and resolving issues in a raw dataset to ensure its quality and usability for analysis.
- Addressed data quality issues by implementing strategies for missing data imputation, using mean and frequency replacement techniques to handle numerical and categorical gaps.
- Standardized and normalized data for comparative analysis, converting categorical variables into numerical indicators (one-hot encoding) and scaling features like "length," "width," and "horsepower" to a common range.
- Performed feature engineering to create a new, more descriptive "horsepower-binned" variable, effectively transforming continuous data into a categorical feature to improve model interpretability.
- Conducted data formatting and type correction across the dataset, ensuring all columns were aligned with their appropriate data types (e.g., int, float, object) for analytical accuracy.

