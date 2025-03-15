


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

#### alternative ###


select current_date(), 
       date_sub(current_date(), interval n month) as mnth,
       last_day(date_sub(current_date(), interval n month)) as lastDayOfMonth,
       dayofweek(last_day(date_sub(current_date(), interval n month))) as day,
       date_sub(last_day(date_sub(current_date(), interval n month)),
                interval (dayofweek(last_day(date_sub(current_date(), interval n month))) + 1) % 7 day
                ) as lst_friday
  from (
select 0 as n union all select 1 union all select 2 union all select 3 union all select 4
union all select 5  UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) as months;


