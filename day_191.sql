CREATE TABLE Products ( 
ProductID INT PRIMARY KEY, 
ProductName VARCHAR(100),
StockQuantity INT
);

INSERT INTO Products VALUES 
(101, 'T-shirt', 50),
(102, 'Jeans', 0),
(103, 'Jacket', 5),
(104, 'Hat', 30), 
(105, 'Scarf', 0), 
(106, 'Socks', 15),
(107, 'Sweater', 10), 
(108, 'Shoes', 20), 
(109, 'Gloves', 0),
(110, 'Coat', 8),
(111, 'Dress', 25), 
(112, 'Skirt', 12), 
(113, 'Blouse', 40), 
(114, 'Belt', 5), 
(115, 'Trousers', 0);

Questions : This question requires you to determine the availability of products based on their StockQuantity. 
            If the stock quantity is greater than 0, mark the product as 'Available'; otherwise, mark it as 'Out of Stock'.

select ProductID, ProductName,
       case when StockQuantity > 0 then "Available"
       else "Out of Stock" end as Availability
from Products;
