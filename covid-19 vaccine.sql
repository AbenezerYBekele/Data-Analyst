
-- SQLite Query to Find the Country with the Highest Total Vaccinations
SELECT 
    COUNTRY,
    [TOTAL VACCINATIONS] 
FROM [vaccination-data]
ORDER BY [TOTAL VACCINATIONS] DESC
LIMIT 1;

-- Top 5 Countries with the Highest Total Vaccinations
SELECT 
    COUNTRY,
    [TOTAL VACCINATIONS] 
FROM "vaccination-data" 
ORDER BY [TOTAL VACCINATIONS]  DESC
LIMIT 5;

-- Countries with the Highest Percentage of Population Vaccinated (1+ Dose)
SELECT 
    COUNTRY,
    PERSONS_VACCINATED_1PLUS_DOSE_PER100 AS "Vaccinated 1+ Dose per 100"
FROM "vaccination-data"
WHERE PERSONS_VACCINATED_1PLUS_DOSE_PER100 IS NOT NULL
ORDER BY PERSONS_VACCINATED_1PLUS_DOSE_PER100 DESC
LIMIT 5;

-- Countries with Most Booster Doses Administered
SELECT 
    COUNTRY,
    PERSONS_BOOSTER_ADD_DOSE
FROM "vaccination-data"
ORDER BY PERSONS_BOOSTER_ADD_DOSE DESC
LIMIT 5;

-- Vaccination Rates Across Regions
SELECT 
    WHO_REGION,
    SUM("TOTAL VACCINATIONS") AS total_vaccinations,
    AVG(TOTAL_VACCINATIONS_PER100) AS avg_vaccination_rate_per100
FROM "vaccination-data"
GROUP BY WHO_REGION
ORDER BY total_vaccinations DESC;

-- Countries with Most Booster Doses Administered
SELECT
	COUNTRY,
	PERSONS_BOOSTER_ADD_DOSE
FROM "vaccination-data"
ORDER BY PERSONS_BOOSTER_ADD_DOSE DESC
LIMIT 5;

-- Countries That Have Not Administered Any Booster Doses
SELECT 
    COUNTRY
FROM "vaccination-data"
WHERE PERSONS_BOOSTER_ADD_DOSE = 0;

-- Total Vaccinations Per Region with Comparison to Population
SELECT 
    WHO_REGION,
    SUM("TOTAL VACCINATIONS") AS [Total vaccinations],
    AVG(TOTAL_VACCINATIONS_PER100) AS [Avg vaccination rate per 100 people]
FROM "vaccination-data"
GROUP BY WHO_REGION
ORDER BY [Total vaccinations] DESC;

-- Countries with the Most Recent Vaccine Usage
SELECT 
    COUNTRY,
    DATE_UPDATED AS [Date updste]
FROM "vaccination-data"
ORDER BY DATE_UPDATED DESC
LIMIT 5;

-- Title: Total Vaccinations by Vaccine Type
SELECT 
    SUM("TOTAL VACCINATIONS") AS [Total vaccinations]
FROM "vaccination-data"
GROUP BY VACCINES_USED
ORDER BY [Total vaccinations] DESC;

-- Percentage of Population Vaccinated with Last Dose
SELECT 
    COUNTRY,
    PERSONS_LAST_DOSE_PER100 AS [PERSONS LAST DOSE PER100]
FROM "vaccination-data"
ORDER BY PERSONS_LAST_DOSE_PER100 DESC
LIMIT 5;

-- Total Vaccinations by Date
SELECT 
    DATE_UPDATED AS [Date update],
    SUM("TOTAL VACCINATIONS") AS [Total Vaccinations]
FROM "vaccination-data"
GROUP BY DATE_UPDATED
ORDER BY DATE_UPDATED DESC;

-- Vaccination Data by WHO Region with Booster Dose Analysis
SELECT 
    WHO_REGION,
    COUNT(DISTINCT COUNTRY) AS [Number of countries],
    SUM("TOTAL VACCINATIONS") AS [Total vaccinations in region],
    AVG("TOTAL_VACCINATIONS_PER100") AS [Avg vaccinations per 100 in region],
    SUM(PERSONS_BOOSTER_ADD_DOSE) AS [Total booster doses in region],
    AVG(PERSONS_BOOSTER_ADD_DOSE_PER100) AS [Avg booster doses per 100 in region]
FROM "vaccination-data"
GROUP BY WHO_REGION
ORDER BY [Total vaccinations in region] DESC;










