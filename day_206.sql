CREATE TABLE ElectronicsPurchases (
CustomerID INT, 
ProductID INT, 
PurchaseDate DATE
);

INSERT INTO ElectronicsPurchases VALUES 
(1, 101, '2024-01-10'),
(2, 102, '2024-02-05'),
(3, 103, '2024-03-15'),
(1, 104, '2024-03-01'), 
(4, 105, '2024-02-28'), 
(6, 106, '2024-04-01'),
(7, 107, '2024-04-12'),
(2, 108, '2024-05-20'),
(8, 109, '2024-05-25'),
(9, 110, '2024-06-10'),
(3, 111, '2024-06-15'), 
(10, 112, '2024-06-25'), 
(1, 113, '2024-07-05'), 
(11, 114, '2024-07-20'), 
(5, 115, '2024-07-25');

CREATE TABLE ClothingPurchases (
CustomerID INT, 
ProductID INT, 
PurchaseDate DATE
);

INSERT INTO ClothingPurchases VALUES
(1, 201, '2024-01-20'),
(2, 202, '2024-02-15'),
(3, 203, '2024-03-05'), 
(4, 204, '2024-04-10'), 
(5, 205, '2024-04-18'), 
(6, 206, '2024-04-22'), 
(7, 207, '2024-05-02'),
(8, 208, '2024-05-12'), 
(9, 209, '2024-05-18'),
(10, 210, '2024-05-25'), 
(11, 211, '2024-06-05'), 
(12, 212, '2024-06-12'), 
(13, 213, '2024-06-22'), 
(14, 214, '2024-07-02'),
(15, 215, '2024-07-15');

CREATE TABLE GroceryPurchases (
CustomerID INT, 
ProductID INT, 
PurchaseDate DATE
);

INSERT INTO GroceryPurchases VALUES
(1, 301, '2024-01-15'),
(2, 302, '2024-02-18'),
(4, 303, '2024-03-25'),
(5, 304, '2024-04-12'), 
(6, 305, '2024-05-01'),
(7, 306, '2024-05-15'), 
(8, 307, '2024-06-05'), 
(9, 308, '2024-06-10'), 
(10, 309, '2024-06-20'),
(11, 310, '2024-07-01'),
(12, 311, '2024-07-03'), 
(13, 312, '2024-07-10'), 
(14, 313, '2024-07-14'),
(15, 314, '2024-07-20'),
(1, 315, '2024-07-25');


Questions : Write a query to identify customer purchase behavior, categorizing them into three categories based on their activity:
            • "Heavy Shopper": Customers who have purchased items from all three categories (Electronics, Clothing, and Grocery).
            • "Seasonal Shopper": Customers who have purchased items from two of the categories. • "Category-Specific Shopper": Customers who have only purchased from one category.


with cte as (
select CustomerID, 'Electronics' as Category from ElectronicsPurchases
union 
select CustomerID, 'Clothing' from ClothingPurchases
union 
select CustomerID, 'Grocery' from GroceryPurchases),
cte2 as (select CustomerID, count(distinct Category) as cate_cnt 
from cte group by 1)
select CustomerID, cate_cnt,
    case when cate_cnt = 3 then "Heavy Shopper"
        when cate_cnt = 2 then "Seasonal Shopper"
        else "Category-Specific Shopper" end as cate 
from cte2;
