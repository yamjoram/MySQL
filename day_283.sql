



Questions : Find the most profitable product category for each brand based on the total revenue from sales in the product_sales table. 
            Revenue for a category is calculated by summing the total sales of all products within that category for each brand. 
            Output the brand name, product category, and the total revenue for that category, ordered by brand and revenue





CREATE TABLE product_sales ( sale_id INT PRIMARY KEY,
product_id INT, product_name VARCHAR(100), brand_id INT,
brand_name VARCHAR(100), category_name VARCHAR(100), 
sale_amount DECIMAL(10, 2), sale_date DATE
);

INSERT INTO product_sales (sale_id, product_id, product_name, 
brand_id, brand_name, category_name, sale_amount, sale_date)
VALUES
(1, 201, 'Product A1', 1, 'Brand X', 'Electronics', 500.00, '2023-01-01'),
(2, 202, 'Product A2', 1, 'Brand X', 'Home Appliances', 300.00, '2023-01-02'),
(3, 203, 'Product A3', 2, 'Brand Y', 'Clothing', 200.00, '2023-01-03'),
(4, 204, 'Product A4', 1, 'Brand X', 'Electronics', 150.00, '2023-01-03'),
(5, 205, 'Product A5', 2, 'Brand Y', 'Clothing', 100.00, '2023-01-04'),
(6, 206, 'Product B1', 3, 'Brand Z', 'Electronics', 1200.00, '2023-01-04'),
(7, 207, 'Product B2', 3, 'Brand Z', 'Home Appliances', 900.00, '2023-01-05'), 
(8, 208, 'Product B3', 1, 'Brand X', 'Furniture', 700.00, '2023-01-06'),
(9, 209, 'Product B4', 2, 'Brand Y', 'Clothing', 400.00, '2023-01-07'),
(10, 210, 'Product B5', 3, 'Brand Z', 'Home Appliances', 800.00, '2023-01-07'), 
(11, 211, 'Product C1', 1, 'Brand X', 'Furniture', 600.00, '2023-01-08'),
(12, 212, 'Product C2', 3, 'Brand Z', 'Electronics', 1100.00, '2023-01-08'),
(13, 213, 'Product C3', 2, 'Brand Y', 'Clothing', 500.00, '2023-01-09'),
(14, 214, 'Product D1', 3, 'Brand Z', 'Furniture', 300.00, '2023-01-09'),
(15, 215, 'Product D2', 1, 'Brand X', 'Electronics', 800.00, '2023-01-10');

select * from (
select brand_id, brand_name,category_name,  product_name, sum(sale_amount) as total_revenue,
dense_rank() over(partition by brand_id order by sum(sale_amount) desc) as rnk 
from product_sales
group by 1, 2, 3, 4) as sub where rnk = 1;
