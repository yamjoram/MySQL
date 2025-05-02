Questions : Find the number of unique products purchased by each customer in the orders table. 
            Output the customer ID and the count of distinct product IDs they have purchased.



CREATE TABLE orders (
order_id INT PRIMARY KEY, customer_id INT, product_id INT, order_date DATE
);

INSERT INTO orders (order_id, customer_id, product_id, order_date) VALUES
(1, 101, 1001, '2023-01-01'), 
(2, 101, 1002, '2023-01-02'), 
(3, 102, 1003, '2023-01-05'), 
(4, 102, 1002, '2023-01-07'), 
(5, 103, 1001, '2023-01-10'), 
(6, 104, 1004, '2023-01-12'),
(7, 101, 1001, '2023-01-15'), 
(8, 103, 1002, '2023-01-16'),
(9, 104, 1005, '2023-01-18');


select customer_id, count(distinct product_id) as distinct_cnt
from orders
group by 1 
order by 2 desc;
