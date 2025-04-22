

Questions : Write an SQL query to generate a report of product names, sale years, and prices for each sale from the sales table. 
            The output should include the sale ID, product name, the year the sale was made, and the price.




CREATE TABLE sales (
sale_id INT PRIMARY KEY, 
product_name VARCHAR(50), 
sale_date DATE,
price DECIMAL(10, 2)
);


INSERT INTO sales (sale_id, product_name, sale_date, price) VALUES
(101, 'Laptop', '2024-01-15', 1200.00), 
(102, 'Smartphone', '2024-02-20', 800.00), 
(103, 'Tablet', '2024-03-10', 600.00),
(104, 'Laptop', '2024-04-05', 1100.00), 
(105, 'Smartwatch', '2024-05-25', 300.00);


select sale_id, product_name, extract(year from sale_date) as sale_year, price
from sales;
