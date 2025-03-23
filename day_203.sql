CREATE TABLE ElectronicsPurchases (
CustomerID INT,
ProductID INT
);

CREATE TABLE ClothingPurchases (
CustomerID INT,
ProductID INT
);


INSERT INTO ElectronicsPurchases VALUES 
(1, 101),
(2, 102),
(3, 103),
(4, 104);

INSERT INTO ClothingPurchases VALUES
(2, 201),
(3, 202),
(5, 203),
(6, 204);

Questions : Write a query to find customers who bought items from only one category (either Electronics or Clothing, but not both).

select * from ElectronicsPurchases
where CustomerID not in (select CustomerID from ClothingPurchases)
union
select * from ClothingPurchases
where CustomerID not in (select CustomerID from ElectronicsPurchases);
