


Questions : Find the most frequent day of the week on which each customer makes purchases. Output the customer ID, the most frequent day of the week, and the number 
                of times they made a purchase on that day.



CREATE TABLE purchases (
purchase_id INT PRIMARY KEY, 
customer_id INT, 
purchase_date DATE, 
amount_spent DECIMAL(10, 2)
);

INSERT INTO purchases (purchase_id, customer_id, purchase_date, amount_spent) VALUES
(1, 101, '2023-01-01', 150.50), 
(2, 101, '2023-01-02', 200.75), 
(3, 101, '2023-01-08', 100.00),
(4, 102, '2023-01-03', 99.99), 
(5, 102, '2023-01-04', 150.50), 
(6, 102, '2023-01-10', 250.00), 
(7, 103, '2023-01-05', 300.50), 
(8, 103, '2023-01-06', 50.00),
(9, 104, '2023-01-07', 500.00),
(10, 104, '2023-01-07', 450.25);

with cte as (
select customer_id, dayofweek(purchase_date) as day, count(*) as num_of_purchased, 
        dense_rank() over (partition by customer_id order by count(*) desc) as rnk
from purchases
group by 1, 2 
order by 3 desc)
select customer_id, case when day = 1 then "Sunday"
                        when day = 2 then "Monday"
                        when day = 3 then "Tuesday"
                        when day = 4 then "Wednesday"
                        when day = 5 then "Thursday"
                        when day = 6 then "Friday"
                        when day = 7 then "Saturday" end as day_ 
from cte
where rnk = 1;
