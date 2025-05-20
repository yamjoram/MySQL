

Questions : Find the longest sequence of consecutive days a Walmart customer has made purchases. Output the customer ID, the start date, the end date, and the number of consecutive 
            days they made purchases.




CREATE TABLE walmart_orders ( order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE );

INSERT INTO walmart_orders (order_id, customer_id, order_date) VALUES
(1, 101, '2023-01-01'), (2, 101, '2023-01-02'), 
(3, 101, '2023-01-04'), (4, 101, '2023-01-05'), 
(5, 102, '2023-01-03'), (6, 102, '2023-01-04'),
(7, 102, '2023-01-05'), (8, 103, '2023-01-01'),
(9, 103, '2023-01-03'), (10, 103, '2023-01-04'), 
(11, 104, '2023-01-02'), 
(12, 104, '2023-01-03'), (13, 104, '2023-01-04'),
(14, 104, '2023-01-06');

with ordered_date as (
select customer_id, order_date, 
      lag(order_date) over(partition by customer_id order by order_date) as previous_date,
      datediff(order_date, lag(order_date) over(partition by customer_id order by order_date)) as days
from walmart_orders),
group_date as (
select customer_id, days,min(order_date) as start_date, max(order_date) as end_date, count(*) as consecutive_days
from ordered_date
group by customer_id,days),
ranked_ as (
select *, row_number() over(partition by customer_id order by consecutive_days desc) as rn
from group_date)
select customer_id, start_date, end_date, consecutive_days from ranked_ where rn = 1;
