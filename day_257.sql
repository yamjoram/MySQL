
Questions : Find the longest streak of consecutive days with a purchase made by the same customer in the orders table. 
            Output the customer ID, the starting date of the streak, the ending date, and the number of consecutive days in the streak.





CREATE TABLE orders (
order_id INT PRIMARY KEY, 
customer_id INT, 
order_date DATE
);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 101, '2023-01-01'), 
(2, 101, '2023-01-02'), 
(3, 101, '2023-01-04'), 
(4, 101, '2023-01-05'), 
(5, 102, '2023-01-03'), 
(6, 102, '2023-01-04'), 
(7, 102, '2023-01-05'),
(8, 103, '2023-01-01'), 
(9, 103, '2023-01-03'), 
(10, 103, '2023-01-04');


WITH ordered_dates AS (
  SELECT 
    customer_id,
    order_date,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
  FROM orders
),

date_groups AS (
  SELECT 
    customer_id,
    order_date,
    DATE_SUB(order_date, INTERVAL rn DAY) AS grp_date
  FROM ordered_dates
),

grouped_streaks AS (
  SELECT 
    customer_id,
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date,
    DATEDIFF(MAX(order_date), MIN(order_date)) + 1 AS streak_length
  FROM date_groups
  GROUP BY customer_id, grp_date
)

SELECT *
FROM grouped_streaks
ORDER BY streak_length DESC
LIMIT 1;
