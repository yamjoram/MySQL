


Questions : For each of the last 12 months, find the date of the last Friday. This involves calculating the last day of the month and 
            then adjusting backward to the previous Friday if necessary.

SELECT 
    DATE_SUB(
        LAST_DAY(DATE_SUB(CURDATE(), INTERVAL n MONTH)),
        INTERVAL (DAYOFWEEK(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL n MONTH))) + 1) % 7 DAY
    ) AS last_friday
FROM 
    (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 
    UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 
    UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 
    UNION ALL SELECT 11) AS months;
