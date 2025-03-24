CREATE TABLE FashionPurchases (
CustomerID INT,
ProductID INT
);

INSERT INTO FashionPurchases VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104);

CREATE TABLE BeautyPurchases (
CustomerID INT,
ProductID INT
);

INSERT INTO BeautyPurchases VALUES 
(2, 201),
(3, 202),
(4, 203),
(5, 204);

Questions : Write a query to combine the customers who bought either Fashion or Beauty products (or both) without eliminating duplicates.


select * from FashionPurchases
union all 
select * from BeautyPurchases;
