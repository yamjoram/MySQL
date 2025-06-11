
Questions : Write a SQL query to select the Customer_id and Store_id for customers with more than 10 purchases from the same store in the past year.


CREATE TABLE customer_purchases (
purchase_id INT PRIMARY KEY, 
customer_id INT,
store_id INT,
purchase_date DATE,
amount DECIMAL(10, 2) );

INSERT INTO customer_purchases (
purchase_id, 
customer_id, 
store_id, 
purchase_date, 
amount)
VALUES
(1, 101, 1, '2023-01-05', 50.00), (2, 101, 1, '2023-02-10', 30.00), 
(3, 101, 1, '2023-03-15', 100.00), (4, 102, 2, '2023-03-01', 200.00), 
(5, 102, 2, '2023-03-20', 150.00), (6, 103, 1, '2023-04-12', 70.00),
(7, 101, 1, '2023-05-10', 90.00), (8, 101, 1, '2023-06-15', 120.00),
(9, 104, 2, '2023-06-01', 60.00), (10, 101, 1, '2023-07-20', 80.00), 
(11, 101, 1, '2023-08-02', 110.00), (12, 102, 2, '2023-09-10', 130.00), 
(13, 101, 1, '2023-10-05', 150.00),
(14, 101, 1, '2023-11-01', 200.00), (15, 103, 2, '2023-12-15', 90.00);


select customer_id, store_id, count(purchase_id) as num_of_purchased 
from customer_purchases
where year(purchase_date) < year(current_date)
group by 1, 2 
having count(purchase_id) > 5;
