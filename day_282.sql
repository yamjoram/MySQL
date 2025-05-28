
Questions : Find the top 3 most profitable stores based on the total revenue from their sales in the store_sales table. 
            Output the store ID, store name, and the total revenue, sorted by revenue in descending order.

CREATE TABLE store_sales (
sale_id INT PRIMARY KEY, 
store_id INT,
store_name VARCHAR(100), 
sale_amount DECIMAL(10, 2), 
sale_date DATE
);


INSERT INTO store_sales (sale_id, store_id, store_name, sale_amount, sale_date) VALUES
(1, 101, 'Store A', 1500.00, '2023-01-01'), (2, 102, 'Store B', 2000.00, '2023-01-01'), 
(3, 101, 'Store A', 1000.00, '2023-01-02'), (4, 103, 'Store C', 1800.00, '2023-01-02'), 
(5, 104, 'Store D', 1200.00, '2023-01-03'), (6, 102, 'Store B', 2500.00, '2023-01-03'), 
(7, 103, 'Store C', 2100.00, '2023-01-04'), (8, 104, 'Store D', 1900.00, '2023-01-04'), 
(9, 105, 'Store E', 1700.00, '2023-01-05'), (10, 105, 'Store E', 1600.00, '2023-01-05'),
(11, 101, 'Store A', 2000.00, '2023-01-06'), (12, 103, 'Store C', 2200.00, '2023-01-06'), 
(13, 102, 'Store B', 2400.00, '2023-01-07'), (14, 104, 'Store D', 1500.00, '2023-01-07'), 
(15, 105, 'Store E', 1800.00, '2023-01-08');


select store_id, store_name, sum(sale_amount) as total_revenue 
from store_sales 
group by 1, 2 
order by 3 desc;
