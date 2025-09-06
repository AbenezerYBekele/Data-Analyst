
SELECT 
    COUNT(*) AS [Total states],
	ROUND(AVG(Obesity), 2) AS [Average Obesity Rate],
    MAX(Obesity) AS [Highest obesity rate],
    MIN(Obesity) AS [lowest obesity rate]
FROM [national obesity by state];

SELECT 
    NAME AS state, 
    Obesity AS [obesity rate],
    RANK() OVER (ORDER BY Obesity DESC) AS rank
FROM [national obesity by state];

SELECT 
    NAME AS state, 
    Obesity AS [Obesity rate]
FROM [national obesity by state]
ORDER BY Obesity DESC
LIMIT 5;

SELECT 
    NAME AS state, 
    Obesity AS [Obesity rate]
FROM [national obesity by state]
ORDER BY Obesity ASC
LIMIT 5;

SELECT Obesity
FROM [national obesity by state]
ORDER BY Obesity
LIMIT 1 OFFSET (SELECT COUNT(*)/2 FROM [national obesity by state]);

SELECT 
    NAME AS state, 
    Obesity AS "Obesity Percentage"
FROM [national obesity by state]
ORDER BY Obesity DESC;

SELECT NAME AS State,
       Obesity,
       CASE 
           WHEN Obesity >= 35 THEN 'High Obesity'
           WHEN Obesity BETWEEN 25 AND 34.9 THEN 'Moderate Obesity'
           ELSE 'Low Obesity'
       END AS 'Obesity Category'
FROM [national obesity by state];

SELECT COUNT(*) AS 'States Above 30'
FROM [national obesity by state]
WHERE Obesity > 30;

SELECT NAME AS State, 
       ROUND(CAST(Shape__Area AS REAL) , 2) AS 'Largest Area',
       Obesity AS Obesity_Percentage
FROM [national obesity by state]
ORDER BY Shape__Area DESC
LIMIT 1;

SELECT NAME AS State,
       Obesity AS 'Obesity Percentage',
       CASE 
         WHEN Obesity >= 35 THEN 'High'
         WHEN Obesity >= 30 THEN 'Moderate'
         ELSE 'Low'
       END AS 'Obesity Level'
FROM [national obesity by state];

SELECT 
    CASE 
         WHEN Obesity >= 35 THEN 'High'
         WHEN Obesity >= 30 THEN 'Moderate'
         ELSE 'Low'
    END AS Obesity_Level,
    COUNT(*) AS State_Count
FROM [national obesity by state]
GROUP BY Obesity_Level;











