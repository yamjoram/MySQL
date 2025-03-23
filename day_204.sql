CREATE TABLE BooksPurchases (
CustomerID INT,
ProductID INT
);

INSERT INTO BooksPurchases VALUES 
(1, 101),
(2, 102),
(3, 103),
(4, 104);

CREATE TABLE GroceryPurchases (
CustomerID INT,
ProductID INT
);

INSERT INTO GroceryPurchases VALUES 
(1, 201),
(2, 202),
(4, 104),
(5, 203);

Questions : Write a query to find the products that have been purchased by customers who bought both books and groceries 
            (i.e., products bought by the same customer from both categories).


select b.ProductID from BooksPurchases b 
left join GroceryPurchases g 
on b.CustomerID = g.CustomerID 
where b.ProductID = g.ProductID;
