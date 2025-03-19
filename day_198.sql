CREATE TABLE CatalogA ( 
ProductID INT,
ProductName VARCHAR(100) );

CREATE TABLE CatalogB ( 
ProductID INT,
ProductName VARCHAR(100) );

INSERT INTO CatalogA VALUES 
(101, 'Laptop'),
(102, 'Smartphone'),
(103, 'Tablet'),
(104, 'Monitor');

INSERT INTO CatalogB VALUES 
(102, 'Smartphone'),
(103, 'Tablet'),
(105, 'Keyboard'),
(106, 'Mouse');


Questions : You are given two product catalogs: CatalogA and CatalogB. Each table contains columns ProductID and ProductName.
            Write a query to find the products that appear in both catalogs (common products), and also find the products that are in either one but not the other (unique products). 
            Use appropriate set operations to achieve this.


select * from CatalogA a 
inner join  CatalogB b
on a.ProductID = b.ProductID;

select * from CatalogA a 
left join CatalogB b 
  on a.ProductID = b.ProductID
where b.ProductID is null
union
select * from CatalogB b
left join CatalogA a
on a.ProductID = b.ProductID
where a.ProductID is null;
