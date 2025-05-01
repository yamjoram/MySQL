

Questions : Find the second most expensive product in each category from the products table. 
            Output the category, product name, and price.


CREATE TABLE products (
product_id INT PRIMARY KEY, 
category VARCHAR(50), 
product_name VARCHAR(100), 
price DECIMAL(10, 2)
);


INSERT INTO products (product_id, category, product_name, price) VALUES
(1, 'Electronics', 'Smartphone', 999.99), 
(2, 'Electronics', 'Laptop', 1299.99), 
(3, 'Electronics', 'Tablet', 599.99),
(4, 'Furniture', 'Sofa', 799.99),
(5, 'Furniture', 'Coffee Table', 199.99), 
(6, 'Furniture', 'Bookshelf', 299.99), 
(7, 'Clothing', 'Jacket', 120.00),
(8, 'Clothing', 'T-shirt', 25.00),
(9, 'Clothing', 'Jeans', 80.00), 
(10, 'Clothing', 'Sweater', 55.00);

select * from (
select category, product_name, price,
        dense_rank() over(partition by category order by price desc) as rnk 
from products) as sub 
where rnk = 2;
