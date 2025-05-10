


Questions : Write a SQL query to generate a report of the continuous periods where tasks either failed or succeeded between 2019-01-01 and 2019-12-31. The report should include start_date, end_date, and period_state (either 'failed' or 'succeeded'). Order the result by start_date.
            Explanation
            To solve this:
            • Combine both the Failed and Succeeded tables and select the dates within the period 2019-01-01 to 2019-12-31.
            • Group consecutive days together using a method to identify continuous periods of success or failure.
            • For each period, determine if the task was failed or succeeded.
            • Output the start_date, end_date, and period_state for each continuous period, ordering by start_date.





INSERT INTO Failed (fail_date) VALUES
('2018-12-28'),
('2018-12-29'), 
('2019-01-04'), 
('2019-01-05');

INSERT INTO Succeeded (success_date) VALUES
('2018-12-30'),
('2018-12-31'), 
('2019-01-01'), 
('2019-01-02'), 
('2019-01-03'), 
('2019-01-06');


WITH Combined AS (
SELECT fail_date AS task_date, 'failed' AS period_state FROM Failed
WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31' UNION ALL
SELECT success_date AS task_date, 'succeeded' AS period_state FROM Succeeded
WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
),
Ranked AS (
SELECT
task_date,
period_state,
ROW_NUMBER() OVER (ORDER BY task_date) -
ROW_NUMBER() OVER (PARTITION BY period_state ORDER BY task_date) AS grp
    FROM Combined
)
SELECT MIN(task_date) AS start_date, MAX(task_date) AS end_date,
period_state FROM Ranked
GROUP BY period_state, grp ORDER BY start_date;
