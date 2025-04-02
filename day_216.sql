

Questions : Given a Categories table, which stores a hierarchical product category structure (where CategoryID references the parent category via ParentCategoryID), 
            write a query to generate all possible parent-child pairs, showing the CategoryID of the parent and the CategoryID of the child

CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(100), 
ParentCategoryID INT
);

INSERT INTO Categories VALUES
(1, 'Electronics', NULL),
(2, 'Laptops', 1),
(3, 'Smartphones', 1),
(4, 'Tablets', 1),
(5, 'Gaming Laptops', 2),
(6, 'Android Phones', 3),
(7, 'iPhones', 3);

with recursive cat_tree as (
select CategoryID, CategoryName, ParentCategoryID
from Categories
where ParentCategoryID is NULL

union all

select c.CategoryID, c.CategoryName, c.ParentCategoryID
from Categories c 
inner join cat_tree ct 
on ct.CategoryID = c.ParentCategoryID)
select * from cat_tree;
