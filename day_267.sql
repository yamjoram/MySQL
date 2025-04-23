


Questions : Calculate the 3-month rolling average of total revenue from purchases, excluding returns (negative amounts), grouped by year-month (YYYY-MM).
            Sort the result from the earliest to the latest month.


CREATE TABLE amazon_purchases (
created_at DATETIME, 
purchase_amt BIGINT, 
user_id BIGINT
);

INSERT INTO amazon_purchases (created_at, purchase_amt, user_id) VALUES
('2023-01-05', 1500, 101), ('2023-01-15', -200, 102),
('2023-02-10', 2000, 103), ('2023-02-20', 1200, 101), 
('2023-03-01', 1800, 104), ('2023-03-15', -100, 102), 
('2023-04-05', 2200, 105), ('2023-04-10', 1400, 103), 
('2023-05-01', 2500, 106), ('2023-05-15', 1700, 107), 
('2023-06-05', 1300, 108), ('2023-06-15', 1900, 109);

with cte as (
select date_format(created_at, '%Y-%m') as month,
      sum(purchase_amt) as total_revenue
from amazon_purchases
where purchase_amt > 0
group by 1)
select month, avg(total_revenue) over(partition by month rows between 2 preceding and current row) as 3_month_avg
from cte 
order by 1;
