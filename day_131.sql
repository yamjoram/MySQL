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


Question: Write an SQL query to retrieve the list of employees who have the same manager and their corresponding manager's name. 
  You need to use a self-join on the Employees table. The result should show the employee's name and the name of their manager.

CREATE TABLE Employees ( EmployeeID INT,
Name VARCHAR(50),
    ManagerID INT
);

SELECT e1.Name AS EmployeeName, e2.Name AS ManagerName 
FROM Employees e1
JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID
ORDER BY e1.Name;
