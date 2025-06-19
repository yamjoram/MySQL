





Questions : Write a SQL query to find all orders with a total amount greater than twice the average order amount.


CREATE TABLE orders (
order_id INT PRIMARY KEY, customer_id INT,
order_date DATE, total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, 
customer_id, 
order_date,
total_amount) VALUES
(1, 101, '2023-01-05', 150.00), 
(2, 102, '2023-01-07', 200.00), 
(3, 103, '2023-02-10', 500.00),
(4, 104, '2023-02-15', 120.00), 
(5, 105, '2023-03-01', 750.00), 
(6, 106, '2023-03-05', 300.00), 
(7, 107, '2023-04-15', 180.00),
(8, 108, '2023-04-20', 220.00), 
(9, 109, '2023-05-10', 600.00), 
(10, 101, '2023-06-01', 800.00);

select order_id, customer_id, avg(total_amount) as avg_amount 
from orders
group by 1, 2 
having avg(total_amount) > 2 * (select avg(total_amount) from orders);
