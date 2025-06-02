


Questions : Find the top 3 customers who have made the most number of purchases in a single month, across all months. Output the customer ID, customer name, the month (YYYY-MM), 
            and the number of purchases made by that customer in that month, ordered by number of purchases (highest to lowest).



CREATE TABLE customer_purchases (
purchase_id INT PRIMARY KEY, customer_id INT,
customer_name VARCHAR(100), purchase_date DATE,
product_id INT, purchase_amount DECIMAL(10, 2)
);

INSERT INTO customer_purchases (
purchase_id, 
customer_id, 
customer_name, 
purchase_date, 
product_id, 
purchase_amount)

VALUES
(1, 101, 'Alice', '2023-01-05', 1001, 500.00), 
(2, 101, 'Alice', '2023-01-10', 1002, 200.00), 
(3, 101, 'Alice', '2023-01-15', 1003, 150.00), 
(4, 102, 'Bob', '2023-01-05', 1004, 250.00),
(5, 102, 'Bob', '2023-01-06', 1005, 300.00),
(6, 103, 'Charlie', '2023-01-10', 1006, 350.00), 
(7, 103, 'Charlie', '2023-01-15', 1007, 400.00), 
(8, 103, 'Charlie', '2023-02-01', 1008, 450.00), 
(9, 104, 'David', '2023-02-02', 1009, 600.00), 
(10, 104, 'David', '2023-02-03', 1010, 700.00),
(11, 104, 'David', '2023-02-10', 1011, 650.00), 
(12, 105, 'Eve', '2023-02-10', 1012, 550.00), 
(13, 105, 'Eve', '2023-02-15', 1013, 600.00), 
(14, 106, 'Frank', '2023-03-05', 1014, 450.00), 
(15, 106, 'Frank', '2023-03-07', 1015, 500.00);

select customer_id, customer_name, date_format("%Y-%m", purchase_date) as month, 
        count(purchase_id) as num_of_purchased 
from customer_purchases 
group by 1, 2, 3
order by 4 desc
limit 3;
