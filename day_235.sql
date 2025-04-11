

Questions : Write an SQL query to delete all products from the Products table that are out of stock (i.e., Stock = 0) and have not been sold in the last 5 years. 
            Assume the Products table contains ProductID, ProductName, Stock, and LastSoldDate columns, and the Sales table contains ProductID and SaleDate.


CREATE TABLE Products (
ProductID INT, ProductName VARCHAR(255), 
Stock INT,
LastSoldDate DATE
);


CREATE TABLE Sales ( SaleID INT,
ProductID INT,
    SaleDate DATE
);

INSERT INTO Products 
(ProductID, ProductName, Stock, LastSoldDate) 
VALUES
(1, 'Product A', 0, '2017-06-15'),
(2, 'Product B', 10, '2021-04-22'), 
(3, 'Product C', 0, '2015-01-10');


INSERT INTO Sales (SaleID, ProductID, SaleDate) 
VALUES
(101, 1, '2017-06-15'), 
(102, 2, '2021-04-22');


delete from Products
where Stock = 0 and 
ProductID not in (
select ProductID
from Sales
where SaleDate > date_sub(current_date(), interval 5 year));
