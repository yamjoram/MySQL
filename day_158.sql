


Questions : Write a SQL query to identify high-spending customers who have made purchases exceeding $100. You have two tables called customers (containing customer_id and name) 
            and orders (containing order_id, customer_id, and order_amount). The task is to join these tables and calculate the total purchase amount for each customer, 
            selecting customers whose total purchase amount exceeds $100.

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(100) );

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_amount DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Alice'), (2, 'Bob'),
(3, 'Charlie'), (4, 'David');

INSERT INTO orders (order_id, customer_id, order_amount) VALUES
    (1, 1, 50.00),
    (2, 2, 75.00),
    (3, 3, 100.00),
    (4, 1, 120.00),
    (5, 2, 80.00),
    (6, 4, 150.00);
    
select c.customer_id, c.name, sum(o.order_amount) as total_spend 
from customers c 
left join orders o 
on o.customer_id = c.customer_id
group by 1, 2 
having sum(order_amount) > 100;
