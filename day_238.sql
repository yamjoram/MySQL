

Questions : 
          Write an SQL query to delete all duplicate orders in the Orders table where both the CustomerID and OrderDate are identical. 
          Keep only the first instance of each duplicated order.

CREATE TABLE Orders (
OrderID INT,
CustomerID INT,
OrderDate DATE, OrderAmount DECIMAL(10, 2)
);



INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount)
VALUES
(1, 101,'2023-01-15', 2500.00),
(2, 102,'2023-01-16', 1500.00),
(3, 101,'2023-01-15', 2500.00),
(4, 103,'2023-01-18', 5000.00),
(5, 104, '2023-01-17', 1200.00),
(6, 102,'2023-01-16', 1500.00),
(7, 101, '2023-01-15', 2500.00),
(8, 105, '2023-01-20', 3200.00);

delete o1 from Orders o1
join Orders o2
on o1.CustomerID = o2.CustomerID and o1.OrderDate = o2.OrderDate
where o1.OrderID > o2.OrderID;
