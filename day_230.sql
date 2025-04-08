
Questions : Write a query to delete all customers from the Customers table who have not placed an order in the last two years.
            Assume there is an Orders table with a CustomerID and OrderDate.


CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE

);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email) 
VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(4, 'Michael', 'Taylor', 'michael.taylor@example.com'),
(5, 'Sarah', 'Williams', 'sarah.williams@example.com'), 
(6, 'David', 'Brown', 'david.brown@example.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2023-01-15'), 
(2, 2, '2022-06-10'),
(3, 3, '2021-05-20'),
(4, 4, '2020-07-15'),
(5, 2, '2021-09-22'), 
(6, 5, '2020-12-01'),
(7, 6, '2023-03-10'), 
(8, 1, '2021-02-25');


delete  from Customers
where CustomerID not in (select CustomerID from Orders
where OrderDate >= current_date() - interval 3 year);
