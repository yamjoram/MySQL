


Questions : Find the second most recent purchase made by each customer in the purchases table. Output the customer ID, the second most recent purchase date, 
            and the amount spent on that purchase.



CREATE TABLE purchases (
purchase_id INT PRIMARY KEY, 
customer_id INT, 
purchase_date DATE, 
amount_spent DECIMAL(10, 2)
);

INSERT INTO purchases (purchase_id, customer_id, purchase_date, amount_spent) VALUES
(1, 101, '2023-01-01', 150.50), (2, 101, '2023-02-10', 200.75),
(3, 102, '2023-01-15', 99.99), (4, 103, '2023-01-05', 250.00),
(5, 103, '2023-03-01', 300.50), (6, 104, '2023-01-20', 500.00),
(7, 104, '2023-02-15', 450.25), (8, 105, '2023-01-25', 700.00);


select customer_id, purchase_date, amount_spent from (
select customer_id, purchase_date, dense_rank() over(partition by customer_id order by purchase_date desc) as rn,
        amount_spent
from purchases) as sub where rn = 2
