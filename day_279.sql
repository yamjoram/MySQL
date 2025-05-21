

Questions : Find the top 3 most sold products globally (across all stores) in the walmart_inventory table based on the total quantity sold. 
            Output the product name, total quantity sold, and the total revenue generated from that product.

CREATE TABLE walmart_inventory (
product_id INT PRIMARY KEY, 
product_name VARCHAR(100), 
quantity_sold INT, 
price_per_unit DECIMAL(10, 2),
store_id INT,
sale_date DATE );


INSERT INTO walmart_inventory (product_id, product_name, quantity_sold, price_per_unit, store_id, sale_date)
VALUES
(101, 'Laptop', 50, 799.99, 1, '2023-01-01'), (102, 'Smartphone', 150, 499.99, 1, '2023-01-02'), 
(103, 'Tablet', 120, 299.99, 1, '2023-01-03'), (104, 'Smartwatch', 90, 199.99, 2, '2023-01-04'), 
(105, 'Headphones', 200, 99.99, 2, '2023-01-05'), (106, 'Speaker', 80, 149.99, 2, '2023-01-06'), 
(107, 'Laptop', 30, 799.99, 3, '2023-01-07'), (108, 'Smartphone', 120, 499.99, 3, '2023-01-08'), 
(109, 'Tablet', 110, 299.99, 3, '2023-01-09'), (110, 'Smartwatch', 50, 199.99, 3, '2023-01-10');



select product_name, sum(quantity_sold) as total_quantity, sum(price_per_unit) as total_price
from walmart_inventory
group by 1 
order by 2 desc;
