


Questions : Write an SQL query to replace NULL values in the Price column of the Products table with the average price of all products.




CREATE TABLE Products (
ProductID INT, 
ProductName VARCHAR(255), 
Price DECIMAL(10, 2)
);


INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Product A', 150.00), 
(2, 'Product B', NULL),
(3, 'Product C', 200.00),
(4, 'Product D', NULL),
(5, 'Product E', 300.00);


update Products
set Price = (select avg_price from (select avg(Price) as avg_price from Products) as tem)
where Price is null;
