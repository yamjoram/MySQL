

Questions : Based on each user's most recent transaction date, write a query to retrieve the users along with the number of products they bought. 
            Output the user's most recent transaction date, user ID, and the number of products bought, sorted in chronological order by the transaction date.



transaction_id INT PRIMARY KEY,
user_id INT, transaction_date DATE,
product_id INT, product_name VARCHAR(100), 
quantity INT
);

INSERT INTO walmart_transactions (
transaction_id,
user_id, 
transaction_date, 
product_id,
product_name, 
quantity)
VALUES
(1, 101, '2023-01-10', 1001, 'Laptop', 1),
(2, 101, '2023-01-15', 1002, 'Phone', 2),
(3, 102, '2023-02-01', 1003, 'Headphones', 1),
(4, 103, '2023-02-05', 1004, 'TV', 1),
(5, 104, '2023-02-10', 1005, 'Microwave', 1),
(6, 101, '2023-02-20', 1006, 'Tablet', 3),
(7, 102, '2023-02-25', 1007, 'Refrigerator', 2), 
(8, 103, '2023-03-01', 1008, 'Washing Machine', 1),
(9, 104, '2023-03-05', 1009, 'Blender', 1),
(10, 101, '2023-03-10', 1010, 'Smart Watch', 2);

with cte as (
select user_id, max(transaction_date) as latest_date 
from walmart_transactions 
group by 1 
order by 2)
select c.latest_date, c.user_id, sum(w.quantity) as num_of_product 
from cte c 
left join walmart_transactions w 
on w.user_id = c.user_id 
group by 1, 2 
order by 1;
