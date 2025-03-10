-- Calculate average obesity rate, highest and lowest obesity rates by state
SELECT 
    COUNT(*) AS [Total states],
	ROUND(AVG(Obesity), 2) AS [Average Obesity Rate],
    MAX(Obesity) AS [Highest obesity rate],
    MIN(Obesity) AS [lowest obesity rate]
FROM [national obesity by state];

-- Rank states by obesity rate in descending order
SELECT 
    NAME AS state, 
    Obesity AS [obesity rate],
    RANK() OVER (ORDER BY Obesity DESC) AS rank
FROM [national obesity by state];

-- Get the top 5 states with the highest obesity rates
SELECT 
    NAME AS state, 
    Obesity AS [Obesity rate]
FROM [national obesity by state]
ORDER BY Obesity DESC
LIMIT 5;

-- Get the 5 states with the lowest obesity rates
SELECT 
    NAME AS state, 
    Obesity AS [Obesity rate]
FROM [national obesity by state]
ORDER BY Obesity ASC
LIMIT 5;

-- median Obesity
SELECT Obesity
FROM [national obesity by state]
ORDER BY Obesity
LIMIT 1 OFFSET (SELECT COUNT(*)/2 FROM [national obesity by state]);

-- Calculate the Average Obesity Rate Across All States
SELECT 
    NAME AS state, 
    Obesity AS "Obesity Percentage"
FROM [national obesity by state]
ORDER BY Obesity DESC;

-- Categorize States Based on Obesity Rate
SELECT NAME AS State,
       Obesity,
       CASE 
           WHEN Obesity >= 35 THEN 'High Obesity'
           WHEN Obesity BETWEEN 25 AND 34.9 THEN 'Moderate Obesity'
           ELSE 'Low Obesity'
       END AS 'Obesity Category'
FROM [national obesity by state];

--Count the Number of States with Obesity Rates Above 30%
SELECT COUNT(*) AS 'States Above 30'
FROM [national obesity by state]
WHERE Obesity > 30;

--Find the State with the Largest Area and Its Obesity Rate
SELECT NAME AS State, 
       ROUND(CAST(Shape__Area AS REAL) , 2) AS 'Largest Area',
       Obesity AS Obesity_Percentage
FROM [national obesity by state]
ORDER BY Shape__Area DESC
LIMIT 1;

--Query to Categorize States by Obesity Level
SELECT NAME AS State,
       Obesity AS 'Obesity Percentage',
       CASE 
         WHEN Obesity >= 35 THEN 'High'
         WHEN Obesity >= 30 THEN 'Moderate'
         ELSE 'Low'
       END AS 'Obesity Level'
FROM [national obesity by state];


--Query to Count States by Obesity Category

SELECT 
    CASE 
         WHEN Obesity >= 35 THEN 'High'
         WHEN Obesity >= 30 THEN 'Moderate'
         ELSE 'Low'
    END AS Obesity_Level,
    COUNT(*) AS State_Count
FROM [national obesity by state]
GROUP BY Obesity_Level;










