

Questions : Given a table of employee sales, write a query to select the Employee_id, Store_id, and a rank based on their Sale_amount for the year 2023, 
              with 1 being the highest performing employee.


CREATE TABLE employee_sales (
transaction_id INT PRIMARY KEY, 
employee_id INT,
store_id INT,
sale_date DATE,
sale_amount DECIMAL(10, 2) );

INSERT INTO employee_sales (transaction_id, 
employee_id, 
store_id, 
sale_date, 
sale_amount)
VALUES
(1, 101, 1, '2023-01-10', 500.00),
(2, 102, 2, '2023-01-12', 800.00),
(3, 103, 3, '2023-01-15', 200.00), 
(4, 101, 1, '2023-02-05', 700.00), 
(5, 104, 1, '2023-02-10', 1200.00), 
(6, 102, 2, '2023-03-01', 400.00), 
(7, 101, 1, '2023-03-12', 600.00), 
(8, 105, 2, '2023-03-15', 1000.00), 
(9, 103, 3, '2023-04-01', 150.00), 
(10, 104, 1, '2023-04-05', 900.00);


select employee_id, store_id, 
dense_rank() over (order by sum(sale_amount)  desc) as rnk 
from employee_sales
where year(sale_date) = 2023
group by 1, 2
order by 3, 1;
