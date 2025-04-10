

Questions : Write an SQL query to update the Stock of all products in the Products table by reducing the stock by the quantity sold in the Sales table.
            Assume the Sales table contains ProductID and QuantitySold columns, and the Products table contains ProductID and Stock columns.






CREATE TABLE Sales ( SaleID INT,
ProductID INT,
QuantitySold INT );

CREATE TABLE Products (
ProductID INT, ProductName VARCHAR(255),
Stock INT);


INSERT INTO Products (ProductID, ProductName, Stock)
 VALUES
(1, 'Product A',100),
(2, 'Product B',150),
(3, 'Product C',200);

INSERT INTO Sales (SaleID,ProductID, QuantitySold)
VALUES
    (101, 1, 10),
    (102, 2, 25),
    (103, 3, 50);
    
    
update Products p 
join Sales s 
on s.ProductID = p.ProductID
set p.Stock = p.Stock - s.QuantitySold;
