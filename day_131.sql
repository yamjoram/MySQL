CREATE TABLE Customers ( CustomerID INT,
CustomerName VARCHAR(50) );
CREATE TABLE Orders ( OrderID INT,
CustomerID INT,
TotalAmount DECIMAL(10, 2) );
CREATE TABLE Products ( ProductID INT,
ProductName VARCHAR(50),
CategoryID INT );
CREATE TABLE Categories ( CategoryID INT,
CategoryName VARCHAR(50) );

Question: Write an SQL query to retrieve the list of customers who have made orders for products in the "Electronics" or "Books" categories, including their names, 
  order total amounts, and the product names. The query should include data from the following tables: Customers, Orders, Products, and Categories.

SELECT c.CustomerName, o.TotalAmount, p.ProductName FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.OrderID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID WHERE cat.CategoryName IN ('Electronics', 'Books');
