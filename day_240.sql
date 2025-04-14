


Questions : Write an SQL query to delete all products from the Products table that have not been sold in the last 2 years.
            Assume the Products table has a LastSoldDate column.


CREATE TABLE Products (
ProductID INT, 
ProductName VARCHAR(255), 
LastSoldDate DATE
);


INSERT INTO Products (ProductID, ProductName, LastSoldDate) VALUES

(1, 'Product A', '2024-05-10'),
(2, 'Product B', '2024-03-15'),
(3, 'Product C', '2019-11-20'), 
(4, 'Product D', '2023-01-25'),
(5, 'Product E', '2021-07-30');


delete p 
from Products p 
where LastSoldDate < date_sub(current_date, interval 2 year);
