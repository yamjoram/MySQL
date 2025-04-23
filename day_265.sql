

Questions : Write an SQL query to calculate the running total of sales for each brand, ordered by sale_date. 
            The brand_sales table contains the following columns:
            • sale_id
            • brand
            • sale_date
            • sale_amount
            The output should display the brand, sale_id, sale_date, and the cumulative sum of sale_amount for each brand in a running total.


CREATE TABLE brand_sales (
sale_id INT PRIMARY KEY,
brand VARCHAR(50), 
sale_date DATE, 
sale_amount DECIMAL(10, 2)
);

INSERT INTO brand_sales (sale_id, brand, sale_date, sale_amount) VALUES
(1, 'Apple', '2024-01-10', 500.00), (2, 'Samsung', '2024-01-12', 300.00),
(3, 'Apple', '2024-01-15', 600.00), (4, 'Apple', '2024-01-20', 700.00), 
(5, 'Samsung', '2024-01-25', 400.00), (6, 'Google', '2024-01-30', 250.00),
(7, 'Samsung', '2024-02-05', 350.00), (8, 'Google', '2024-02-10', 500.00),
(9, 'Apple', '2024-02-15', 750.00), (10, 'Samsung', '2024-02-20', 450.00), 
(11, 'Apple', '2024-02-22', 800.00), (12, 'Google', '2024-02-25', 650.00), 
(13, 'Samsung', '2024-03-01', 550.00), (14, 'Apple', '2024-03-05', 900.00),
(15, 'Google', '2024-03-10', 300.00), 
(16, 'Samsung', '2024-03-15', 600.00), (17, 'Apple', '2024-03-20', 1200.00),
(18, 'Google', '2024-03-25', 700.00), (19, 'Samsung', '2024-03-28', 850.00),
(20, 'Apple', '2024-03-30', 1500.00);


select brand, sale_id, sale_date, sum(sale_date) over(partition by brand order by sale_date) as running_total
from brand_sales;
