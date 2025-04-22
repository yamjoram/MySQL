

Questions : Write an SQL query to find the second most recent order date for each customer from the
            Orders table. The table contains the following columns:
            • OrderID
            • CustomerID • OrderDate
            The output should display the CustomerID and the second most recent order date for each customer.



CREATE TABLE Orders (
OrderID INT PRIMARY KEY, 
CustomerID INT, 
OrderDate DATE
);


INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 101, '2024-01-10'), 
(2, 102, '2024-01-12'),
(3, 101, '2024-02-15'), 
(4, 103, '2024-03-01'), 
(5, 102, '2024-03-05'),
(6, 101, '2024-03-10'), 
(7, 103, '2024-04-02');


select CustomerID, OrderDate from(
select CustomerID, OrderDate, dense_rank() over(partition by CustomerID order by OrderDate desc) as rnk 
from Orders) as sub
where rnk = 2;
